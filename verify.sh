#!/bin/sh
domain=$(echo "$1" | grep -oP 'domain=\K[^& ]+')
ip=$(dig +short "$domain" A)
if [ "$ip" = "$EXPECTED_IP" ]; then exit 0; else exit 1; fi
