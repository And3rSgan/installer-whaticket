#!/bin/bash

cd /home/zgestor/frontend

npm install

cat <<EOF > .env
REACT_APP_BACKEND_URL=https://$API_DOMAIN
EOF

npm run build

mkdir -p /var/www/zap
cp -r build/* /var/www/zap