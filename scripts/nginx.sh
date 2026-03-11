#!/bin/bash

cat <<EOF > /etc/nginx/sites-available/whaticket

server {
server_name $API_DOMAIN;

location / {
proxy_pass http://127.0.0.1:8080;
proxy_http_version 1.1;
proxy_set_header Upgrade \$http_upgrade;
proxy_set_header Connection 'upgrade';
proxy_set_header Host \$host;
}
}

server {
server_name $FRONT_DOMAIN;

root /var/www/zap;
index index.html;

location / {
try_files \$uri /index.html;
}

}

EOF

ln -s /etc/nginx/sites-available/whaticket /etc/nginx/sites-enabled

nginx -t

systemctl restart nginx

certbot --nginx -d $API_DOMAIN -d $FRONT_DOMAIN --non-interactive --agree-tos -m admin@$FRONT_DOMAIN