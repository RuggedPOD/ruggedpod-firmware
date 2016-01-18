#!/bin/bash

set -eux

apt-get install -y nodejs npm
ln -s /usr/bin/nodejs /usr/bin/node

cd /opt
git clone https://github.com/RuggedPOD/ruggedpod-web
chown -R ruggedpod: /opt/ruggedpod-web

mkdir -p /var/www/ruggedpod

rm -rf /var/www/ruggedpod/*
cp -r /opt/ruggedpod-web/web/* /var/www/ruggedpod
