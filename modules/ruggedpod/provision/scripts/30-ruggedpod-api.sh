#!/bin/bash

set -x

pip install git+https://github.com/RuggedPOD/ruggedpod-api.git &

pid=$!

while true ; do
    ps -o pid= -p $pid
    if [ $? -ne 0 ] ; then
        echo "RuggedPOD API installation is done"
        exit 0
    fi
    sleep 60
    echo "Waiting for RuggedPOD API installation to complete..."
done
