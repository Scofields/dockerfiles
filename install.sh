#!/bin/bash

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
echo "deb https://get.docker.com/ubuntu docker main" > /etc/apt/sources.list.d/docker.list
apt-get -qq update

apt-get install -y lxc-docker wget

adduser $USER docker

wget -q --output-document=/usr/local/bin/weave https://github.com/weaveworks/weave/releases/download/latest_release/weave
chmod a+x /usr/local/bin/weave

DOCKER_HOST_EXPORTED=`grep -c DOCKER_HOST= /etc/environment`

if [ "$DOCKER_HOST_EXPORTED" == "0" ]; then
    echo "DOCKER_HOST=tcp://127.0.0.1:12375" >> /etc/environment
fi
