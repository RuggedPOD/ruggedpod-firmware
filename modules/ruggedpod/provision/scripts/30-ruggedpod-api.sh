#!/bin/bash

set -eux

cd /tmp
git clone https://github.com/RuggedPOD/ruggedpod-api.git
cd ruggedpod-api
pip install .
cd ..
rm -rf /tmp/ruggedpod-api

mkdir -p /var/lib/ruggedpod
chown ruggedpod: /var/lib/ruggedpod
