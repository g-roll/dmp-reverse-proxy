#!/bin/bash

# Generate two random 20-character alphanumeric passwords (lowercase only)
MYSQL_PW=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 20 | head -n 1)
MYSQL_ROOT_PW=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 20 | head -n 1)

# Create/overwrite .env file with the passwords
cat >.env <<EOF
MYSQL_PASSWORD=$MYSQL_PW
MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PW

# Set missing variables
DOMAIN=
AI1WM=
EOF

echo "Created .env file with random passwords"
echo "Edit .env and set your DOMAIN before running docker compose up!"
