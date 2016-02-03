#!/bin/bash

#
# This script wraps the dd command to show the progress in percentage
#

set -e

log_file="$(mktemp)"

input_file=$(echo "$@" | sed -e 's/.* if=\(.*\) .*/\1/')

handle_error() {
    echo -e "\nError: script failed for an unknown reason. See log file dd_error.log"
    cp ${log_file} dd_error.log
    exit 1
}

trap handle_error ERR

if [[ -f ${input_file} ]] ; then
    total=$(wc -c $input_file | awk '{print $1}')

    dd $@ > ${log_file} 2>&1 &
    pid=$!

    sleep 1

    while true ; do
        kill_result="$(kill -INFO $pid >/dev/null 2>&1 ; echo $?)"
        if [ ${kill_result} -eq 1 ] ; then
            total_write=$(tail -n 1 ${log_file} | awk '{print $1}')
            if [ ${total_write} -eq ${total} ] ; then
                break
            fi
            handle_error
        fi
        sleep 1
        current=$(grep ' bytes transferred in ' ${log_file} | tail -n 1 | awk '{print $1}')
        progress=$(bc -l <<< "scale=0; $current * 100 / $total")
        echo -ne "\r$progress %"
    done

    echo -e '\r100 %'
    exit 0
else
    echo "WARGING: input is not a regular file. Fallback to standard dd command."
    dd $@ > ${log_file}
    exit $?
fi
