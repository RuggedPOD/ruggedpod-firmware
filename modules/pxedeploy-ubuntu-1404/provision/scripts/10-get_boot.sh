#!/bin/bash

set -eux

mkdir -p /var/www/pxe

mkdir -p /tftp/pxe/ubuntu/1404

wget http://archive.ubuntu.com/ubuntu/dists/trusty/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/initrd.gz -O /tftp/pxe/ubuntu/1404/initrd.gz
wget http://archive.ubuntu.com/ubuntu/dists/trusty/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/linux -O /tftp/pxe/ubuntu/1404/linux

a2ensite pxe-vhost
