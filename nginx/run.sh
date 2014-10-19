#!/bin/bash

if [ "$1" == "" ]; then
    echo "Usage: run.sh <domain>"
    exit 1;
fi

DOMAIN=$1
DOMAIN_HOSTNAME="${DOMAIN//./_}"

docker run \
    --memory="256m" \
    --hostname="${DOMAIN_HOSTNAME}-nginx" \
    --restart="always" \
    -p 127.0.0.1::8080 \
    --name="${DOMAIN_HOSTNAME}" \
    -v /var/www/$DOMAIN:/var/www/ \
    -d nginx
