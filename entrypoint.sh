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

    if ! wp ai1wm restore "${AI1WM}" --yes; then
        echo "First restore attempt failed, trying with alternative method..."

        if ! yes | wp ai1wm restore "${AI1WM}"; then
            echo "Failed to restore backup after multiple attempts"
            exit 1
        fi
    fi

    wp plugin install --activate mainwp-child updraftplus
fi

echo "Setting up network rate limit..."

exec "$@"
