#!/bin/bash
sudo apt-get update
sudo apt-get install nginx -y
sudo echo "Setup Done" >/var/www/html/index.nginx-debian.html
