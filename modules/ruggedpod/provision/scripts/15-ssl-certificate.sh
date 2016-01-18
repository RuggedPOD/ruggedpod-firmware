#!/bin/bash

set -eux

cert=/etc/ssl/certs/ruggedpod

sudo openssl req -nodes -newkey rsa:2048 -keyout ${cert}.key -out ${cert}.csr \
                 -subj "/C=FR/ST=Paris/L=Paris/O=OCP/OU=RuggedPOD/CN=admin.ruggedpod"

sudo openssl x509 -req -days 365 -in ${cert}.csr -signkey ${cert}.key -out ${cert}.crt
