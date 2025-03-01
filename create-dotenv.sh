#!/bin/bash

# Generate two random 20-character lowercase alphanumeric passwords
MYSQL_PW=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 20 | head -n 1)
MYSQL_ROOT_PW=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 20 | head -n 1)

cat >.env <<EOF
MYSQL_PASSWORD=$MYSQL_PW
MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PW

# Set missing variables
DOMAIN=
AI1WM=
EOF

echo "Created .env file with random passwords"
echo "Edit .env and set missing variables before running docker compose up!"
