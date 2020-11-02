#!/bin/bash
sed -i 's/Options Indexes FollowSymLinks/Options FollowSymLinks/g'  /etc/httpd/conf/httpd.conf
service httpd restart
EC2_INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
EC2_AZ=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
sed -i "s/from server/from server $EC2_INSTANCE_ID in $EC2_AZ/g" /var/www/html/Server.html
chmod 664 /var/www/html/Server.html
