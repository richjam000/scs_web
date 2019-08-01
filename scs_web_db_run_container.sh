#!/bin/bash
set -e

NETWORK=${NETWORK:-"jamnet"}
echo "Check NETWORK($NETWORK) exists. If not: docker network create $NETWORK"
set -x
docker network inspect "$NETWORK" >/dev/null

docker run -d --name=scs_web_db --network="$NETWORK" --hostname=scs_web_db --restart=always \
-v scs_web_db_data:/var/lib/mysql \
-v scs_secrets:/secrets \
-e MYSQL_DATABASE=wordpress \
-e MYSQL_USER=wordpress \
-e MYSQL_RANDOM_ROOT_PASSWORD=yes \
-e MYSQL_PASSWORD_FILE=/secrets/mysql/MYSQL_PASSWORD \
gitlab.scsuk.net:5005/scsuk/ext_registry/docker/mysql:5.6
