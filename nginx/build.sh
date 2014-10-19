#!/bin/sh

if [ ! -f ./latest-de_DE.zip ]; then
    wget https://de.wordpress.org/latest-de_DE.zip
fi

docker build --rm=true --force-rm=true --tag="rstiller/nginx" .

