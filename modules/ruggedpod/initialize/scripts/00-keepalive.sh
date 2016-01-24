#!/bin/bash

set -eu

log_alive() {
    while true ; do
        sleep 120
        echo "[$(date "+%Y-%m-%d %H:%M:%S")] RuggedPOD image provisioning is still in progress..."
    done
}

log_alive &
