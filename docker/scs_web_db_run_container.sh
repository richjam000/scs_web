#!/bin/bash

docker run -d --name=scs_web_db --network=jamnet --hostname=scs_web_db --restart=always \
-v scs_web_db_data:/var/lib/mysql \
-v scs_secrets:/secrets \
-e MYSQL_DATABASE=wordpress \
-e MYSQL_USER=wordpress \
-e MYSQL_RANDOM_ROOT_PASSWORD=yes \
-e MYSQL_PASSWORD_FILE=/secrets/mysql/MYSQL_PASSWORD \
localhost:5000/docker/mysql:5.6
