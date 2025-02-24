#!/bin/bash
set -e

# Warte auf MySQL
sleep 10

# Setze Berechtigungen
chown -R www-data:www-data /var/www/html

su www-data

# Konfiguriere WordPress
wp config set FORCE_SSL_ADMIN true --raw
wp config set WP_HOME "https://${DOMAIN}"
wp config set WP_SITEURL "https://${DOMAIN}"
wp config set 'WORDPRESS_CONFIG_EXTRA' '$_SERVER["HTTPS"] = "on"; $_SERVER["SERVER_PORT"] = 443;' --raw

exec apache2-foreground
