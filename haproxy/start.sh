#!/bin/sh

docker run -d -p 0.0.0.0:80:80 --name="haproxy" --cap-add=NET_ADMIN rstiller/haproxy
