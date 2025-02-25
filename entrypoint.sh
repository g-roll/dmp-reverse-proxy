#!/usr/bin/env bash
set -Eeuo pipefail

if ! wp core is-installed; then
    wp core install --url="${WORDPRESS_URL}" \
        --title="WordPress Site" \
        --admin_user="admin" \
        --admin_password="dummy123" \
        --admin_email="admin@example.com"
fi

# # Configure SSL and Proxy settings
# wp config set FORCE_SSL_ADMIN true --raw
# wp config set WP_HOME "https://${DOMAIN}"
# wp config set WP_SITEURL "https://${DOMAIN}"
# wp config set 'WORDPRESS_CONFIG_EXTRA' '$_SERVER["HTTPS"] = "on"; $_SERVER["SERVER_PORT"] = 443;' --raw

exec "$@"
