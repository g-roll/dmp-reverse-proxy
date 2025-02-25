#!/usr/bin/env bash
set -Eeuo pipefail

sleep 30

if ! wp core is-installed; then
    wp core install --url="${WORDPRESS_URL}" \
        --title="WordPress Site" \
        --admin_user="admin" \
        --admin_password="dummy123" \
        --admin_email="admin@example.com"

    wp plugin install --activate all-in-one-wp-migration https://dmp-assets.b-cdn.net/wp/plugins/ai1wm.zip

    cd /var/www/html/wp-content/ai1wm-backups/

    wget https://${DOMAIN}/wp-content/ai1wm-backups/${AI1WM}

    wp aiwm restore ${AI1WM}
fi

exec "$@"
