#!/bin/sh
read request

domain=$(echo "$request" | grep -oP 'GET /verify\?domain=\K[^& ]+')

if [ -z "$domain" ]; then
    echo "HTTP/1.1 400 Bad Request"
    echo
    exit 0
fi

ip=$(dig +short "$domain" A)

if [ "$ip" = "$EXPECTED_IP" ]; then
    echo "HTTP/1.1 200 OK"
else
    echo "HTTP/1.1 403 Forbidden"
fi
echo
