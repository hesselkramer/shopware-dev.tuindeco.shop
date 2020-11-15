#!/bin/bash
sed -i 's/Options Indexes FollowSymLinks/Options FollowSymLinks/g'  /etc/httpd/conf/httpd.conf
service httpd restart
cd /
cd /var/www/html
#composer install -n
chown -R apache.apache /var/www/html
chmod -R 755 /var/www/html
chmod -R 755 /var/www/html/storage
#cp -n .env.example .env
#php artisan key:generate
cd /
cd /etc/httpd/conf/
sed -i 's|DocumentRoot "/var/www/html"|DocumentRoot /var/www/html/public|g' httpd.conf
service httpd restart
