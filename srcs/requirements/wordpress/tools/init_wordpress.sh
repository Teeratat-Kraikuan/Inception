#!/bin/sh

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

    wp user create $WORDPRESS_ADMIN_USER $WORDPRESS_ADMIN_EMAIL --role=administrator --user_pass=$WORDPRESS_ADMIN_PASSWORD --allow-root
	wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASSWORD --allow-root
fi

exec "$@"
