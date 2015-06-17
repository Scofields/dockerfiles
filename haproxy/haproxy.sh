#!/bin/sh

set -e

echo "queuing incoming requests"
iptables -I INPUT -p tcp --dport 80 --syn -j DROP
iptables -I INPUT -p tcp --dport 443 --syn -j DROP

echo "starting haproxy"
/usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg -D -p /var/run/haproxy.pid -sf $(/bin/cat /var/run/haproxy.pid)

echo "dequeuing requests"
iptables -D INPUT -p tcp --dport 80 --syn -j DROP
iptables -D INPUT -p tcp --dport 443 --syn -j DROP
