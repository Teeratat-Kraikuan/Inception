#!/bin/sh

service mariadb start

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
mysql_secure_installation << EOF

Y
Y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
Y
Y
Y
Y
EOF

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
echo "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql

fi

service mariadb stop

exec "$@"
