#!/bin/bash

set -eux

adduser --disabled-password --gecos "" --shell /bin/bash ruggedpod
chpasswd <<EOF
ruggedpod:ruggedpod
EOF
adduser ruggedpod sudo

echo "ruggedpod ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/ruggedpod

wget --header="X-Auth-Token: Lj9MN6TlSWb6j6EvoZIJJYmUHENs2Oxr" \
                 --method=DELETE http://192.168.2.15:5000/v2/blades/1/build
