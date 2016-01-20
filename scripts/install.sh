#!/bin/bash

set -ex

cd /root
apt-get update
apt-get install -y git
git clone https://github.com/ggiamarchi/rpi-debian-builder
cd rpi-debian-builder
echo '
export PATH=$PATH:/root/rpi-debian-builder' >> /root/.bashrc
./install.sh
