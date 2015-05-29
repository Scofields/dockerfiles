#!/bin/sh

wget -qO- https://get.docker.com/ | sh
adduser $USER docker

wget -q --output-document=/usr/local/bin/docker-machine https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_linux-amd64
chmod +x /usr/local/bin/docker-machine

wget -q --output-document=/usr/local/bin/weave https://github.com/weaveworks/weave/releases/download/latest_release/weave
chmod a+x /usr/local/bin/weave
