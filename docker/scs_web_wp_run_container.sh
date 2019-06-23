#!/bin/bash

docker run -d --name=scs_web_wp --network=jamnet --hostname=scs_web_wp --restart=always \
-v scs_web_wp_html:/var/www/html \
-v scs_secrets:/secrets \
-e WORDPRESS_DB_HOST=scs_web_db \
-e WORDPRESS_DB_NAME=wordpress \
-e WORDPRESS_DB_USER=wordpress \
-e WORDPRESS_DB_PASSWORD_FILE=/secrets/mysql/MYSQL_PASSWORD \
localhost:5000/docker/wordpress:5.2.2

# The mount of /var/www/html/wp-content screws up its ownership - so need to correct that.

# docker exec scs_web_wp ls -ld /var/www/html/wp-content
# drwxr-xr-x 4 root root 52 Jun 22 13:54 /var/www/html/wp-content

#docker exec scs_web_wp chown www-data:www-data /var/www/html/wp-content

#docker exec scs_web_wp ls -ld /var/www/html/wp-content
# drwxr-xr-x 4 www-data www-data 52 Jun 22 13:54 /var/www/html/wp-content

