#!/bin/bash

set -eux

apt-get install -y squid
service squid stop

dir=/var/cache/squid
file=ruggedpod-firmware-cache-0.1.0.tar.gz

mkdir -p ${dir}
cd ${dir}
wget https://s3-us-west-2.amazonaws.com/ruggedpod/public/${file}
tar xvzf ${file}
rm -f ${file}
chown -R proxy: ${dir}
