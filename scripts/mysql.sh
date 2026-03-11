#!/bin/bash

apt install -y mysql-server

mysql <<EOF

CREATE DATABASE whaticket;
CREATE USER 'whaticket'@'localhost' IDENTIFIED BY 'whaticket123';
GRANT ALL PRIVILEGES ON whaticket.* TO 'whaticket'@'localhost';
FLUSH PRIVILEGES;

EOF