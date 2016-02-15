#!/bin/bash

set -eux

cd /tmp
wget https://github.com/RuggedPOD/ruggedpod-web/releases/download/0.3.0/ruggedpod-web.tar.gz
mkdir -p /var/www/ruggedpod
cd /var/www/ruggedpod
tar xzf /tmp/ruggedpod-web.tar.gz
rm -rf /tmp/ruggedpod-web.tar.gz
