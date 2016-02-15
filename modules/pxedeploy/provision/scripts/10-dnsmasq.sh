#!/bin/bash

set -eux

apt-get install -y dnsmasq
service dnsmasq stop

mkdir -p /tftp/pxe/

wget -O /tmp/syslinux-6.03.tar.gz https://www.kernel.org/pub/linux/utils/boot/syslinux/6.xx/syslinux-6.03.tar.gz
tar -xzf /tmp/syslinux-6.03.tar.gz syslinux-6.03/bios/core/pxelinux.0 -O > /tftp/pxe/pxelinux.0
tar -xzf /tmp/syslinux-6.03.tar.gz syslinux-6.03/bios/com32/elflink/ldlinux/ldlinux.c32 -O > /tftp/pxe/ldlinux.c32
