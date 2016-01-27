#!/bin/bash

cd "`dirname $0`"

conf_path="`realpath ../nginx.conf`"
conf_linkpath="/etc/nginx/sites-enabled/offline-material"

www_path="`realpath ../web/`"
www_linkpath="/var/www/offline-material"
sudo mkdir -p "`realpath \"$www_linkpath/..\"`"

sudo rm -f "/etc/nginx/sites-enabled/default"

sudo rm -f $conf_linkpath
sudo ln -s $conf_path $conf_linkpath
sudo rm -f $www_linkpath
sudo ln -s $www_path $www_linkpath

if ! ( sudo nginx -t && sudo nginx -s reload )
then
  >&2 echo "ERROR: could not reload nginx"
  exit 1
fi
