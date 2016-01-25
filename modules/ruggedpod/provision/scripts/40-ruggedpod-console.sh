#!/bin/bash

set -eux

apt-get install -y nodejs lsof screen

cd /tmp
wget https://github.com/RuggedPOD/ruggedpod-web/releases/download/0.1.0/ruggedpod-serial.tar.gz
mkdir -p /opt/ruggedpod-serial
cd /opt/ruggedpod-serial
tar xzf /tmp/ruggedpod-serial.tar.gz
rm -rf /tmp/ruggedpod-serial.tar.gz
chown -R ruggedpod: /opt/ruggedpod-serial
