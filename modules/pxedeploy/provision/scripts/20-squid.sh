#!/bin/bash

set -eux

apt-get install -y squid
service squid stop

echo "192.168.2.15	ruggedpod" >> /etc/hosts
