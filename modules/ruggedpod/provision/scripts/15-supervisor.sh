#!/bin/bash

set -eux

apt-get install -y supervisor
service supervisor stop
