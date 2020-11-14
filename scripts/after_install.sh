#!/bin/bash
sed -i 's/Options Indexes FollowSymLinks/Options FollowSymLinks/g'  /etc/httpd/conf/httpd.conf
service httpd restart
cd /
cd /var/www/laravel
composer install -n
chown -R apache.apache /var/www/laravel
chmod -R 755 /var/www/laravel
chmod -R 755 /var/www/laravel/storage
cp -n .env.example .env
php artisan key:generate
cd /
cd /etc/httpd/conf/
sed -i 's|DocumentRoot "/var/www/html"|DocumentRoot /var/www/laravel/public|g' httpd.conf
service httpd restart
