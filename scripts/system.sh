#!/bin/bash

apt update && apt upgrade -y

apt install -y \
curl \
git \
sudo \
nginx \
redis-server \
build-essential \
certbot \
python3-certbot-nginx

curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt install -y nodejs

npm install -g pm2