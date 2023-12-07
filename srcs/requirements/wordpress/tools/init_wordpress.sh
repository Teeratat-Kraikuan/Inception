#!/bin/sh

mkdir -p /run/php;

if [ ! -f /var/www/html/wp-config.php ]
then
    mkdir -p /var/www/html
    cd /var/www/html
    wp core download --allow-root

    cp wp-config-sample.php wp-config.php
	sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php
	sed -i "s/localhost/$MYSQL_DATABASE_HOST/g" wp-config.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php

    wp core install --url=$DOMAIN_NAME --title=$TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --allow-root
	wp user create $WORDPRESS_USER $WORDPRESS_EMAIL --role=author --user_pass=$WORDPRESS_PASSWORD --allow-root
fi

exec "$@"
