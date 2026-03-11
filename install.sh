#!/bin/bash

clear

echo "================================="
echo " INSTALADOR WHATICKET ZGESTOR"
echo "================================="

read -p "Dominio da API (ex: api.zgestor.com): " API_DOMAIN
read -p "Dominio do Painel (ex: zap.zgestor.com): " FRONT_DOMAIN

export API_DOMAIN
export FRONT_DOMAIN

bash scripts/system.sh
bash scripts/mysql.sh
bash scripts/backend.sh
bash scripts/frontend.sh
bash scripts/nginx.sh

echo "================================="
echo " INSTALAÇÃO FINALIZADA"
echo "================================="

echo "Painel: https://$FRONT_DOMAIN"
echo "API: https://$API_DOMAIN"