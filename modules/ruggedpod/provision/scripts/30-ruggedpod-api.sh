#!/bin/bash

set -eux

pip install git+https://github.com/RuggedPOD/ruggedpod-api.git

mkdir -p /var/lib/ruggedpod
chown ruggedpod: /var/lib/ruggedpod
