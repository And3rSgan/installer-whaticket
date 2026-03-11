#!/bin/bash

cd /home

git clone https://github.com/And3rSgan/Whaticket.git zgestor

cd zgestor/backend

npm install

cat <<EOF > .env
NODE_ENV=production

BACKEND_URL=https://$API_DOMAIN
FRONTEND_URL=https://$FRONT_DOMAIN

PORT=8080
PROXY_PORT=443

DB_DIALECT=mysql
DB_HOST=localhost
DB_USER=whaticket
DB_PASS=whaticket123
DB_NAME=whaticket

JWT_SECRET=zgestor

REDIS_URI=redis://127.0.0.1:6379
EOF

npx sequelize db:migrate

npm run build

pm2 start dist/server.js --name whaticket-backend
pm2 save