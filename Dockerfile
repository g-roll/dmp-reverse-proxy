# Use the official WordPress image as the base image
FROM wordpress:php8.2-apache

# Install WP-CLI and configure www-data user in a single layer
RUN set -ex \
  && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp \
  && chsh -s /bin/bash www-data \
  && mkdir -p /var/www/.wp-cli \
  && chown www-data:www-data /var/www/.wp-cli

# Copy the entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the working directory
WORKDIR /var/www/html

# Expose the default port
EXPOSE 80

# Switch to www-data user
USER www-data

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Start the web server
CMD ["apache2-foreground"]
