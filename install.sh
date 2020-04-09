#!/bin/bash
# Run as root

# check permissions
if [ "$(whoami)" != "root" ]; then
        echo "Root privileges are required to run this, try running with sudo or with root user..."
        exit 2
fi

if [ "$1" == "" ]; then
  echo "Please specify a website fqdn"
fi

if [ $# -gt 2 ]; then
  echo "Too many arguments"
  exit 1
fi

apt update
apt install apache2 php php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip php-mysql -y
mkdir -p /var/www/$1/public_html
chown -R www-data:www-data /var/www/$1/public_html
