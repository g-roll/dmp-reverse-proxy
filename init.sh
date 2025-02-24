#!/bin/bash
set -e

# Warte auf MySQL
sleep 10

# Installiere wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
mkdir -p /var/www/.wp-cli

# Ab hier läuft alles als www-data
# wp config set FORCE_SSL_ADMIN true --raw
# wp config set WP_HOME "https://${DOMAIN}"
# wp config set WP_SITEURL "https://${DOMAIN}"
# wp config set 'WORDPRESS_CONFIG_EXTRA' '$_SERVER["HTTPS"] = "on"; $_SERVER["SERVER_PORT"] = 443;' --raw

# Apache startet automatisch als www-data
exec apache2-foreground
