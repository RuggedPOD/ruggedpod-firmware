#!/bin/bash

set -eux

adduser --disabled-password --gecos "" --shell /bin/bash ruggedpod
chpasswd <<EOF
ruggedpod:ruggedpod
EOF
adduser ruggedpod sudo
