#!/bin/bash

sudo apt-get -y remove nginx
sudo apt-get -y install nginx-extras realpath

sudo nginx || true

