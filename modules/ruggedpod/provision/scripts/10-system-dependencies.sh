#!/bin/bash

set -eux

apt-get install -y --force-yes \
             git apache2 apache2-dev python-dev python-pip libxml2-dev \
             libxslt1-dev zlib1g-dev libffi-dev libssl-dev python-smbus
