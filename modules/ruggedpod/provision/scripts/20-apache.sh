#!/bin/bash

set -eux

apt-get install -y apache2

mod_wsgi_version=4.4.21
cd /tmp
wget https://github.com/GrahamDumpleton/mod_wsgi/archive/${mod_wsgi_version}.tar.gz
tar xvzf ${mod_wsgi_version}.tar.gz
cd mod_wsgi-${mod_wsgi_version}
./configure && make && sudo make install
cd
rm -rf /tmp/mod_wsgi-${mod_wsgi_version}
sudo bash -c 'echo "LoadModule wsgi_module /usr/lib/apache2/modules/mod_wsgi.so" > /etc/apache2/mods-available/wsgi.load'

a2enmod proxy_http
a2enmod rewrite
a2enmod proxy_wstunnel
a2enmod ssl
a2enmod wsgi

service apache2 stop

cd /etc/apache2/sites-enabled
rm -rf *
ln -s ../sites-available/ruggedpod-vhost.conf .
