#!/bin/sh

set -e

if [ ! -f ".initialized" ]; then
    echo "setting up 4 bands for queuing"
    tc qdisc add dev lo root handle 1: prio bands 4
    
    echo "setting up 3 std bands"
    tc qdisc add dev lo parent 1:1 handle 10: pfifo limit 1000
    tc qdisc add dev lo parent 1:2 handle 20: pfifo limit 1000
    tc qdisc add dev lo parent 1:3 handle 30: pfifo limit 1000
    
    echo "adding 4th plug band"
    nl-qdisc-add --dev=lo --parent=1:4 --id=40: plug --limit 104857600
    
    echo "setting plug band to immediate release"
    nl-qdisc-add --dev=lo --parent=1:4 --id=40: --update plug --release-indefinite
    
    echo "1-marked request are classified with last band"
    tc filter add dev lo protocol ip parent 1:0 prio 1 handle 1 fw classid 1:4
    
    echo "mark all traffic from port 80 and 443 with 1"
    iptables -t mangle -I OUTPUT -p tcp --dport 80 --syn -j MARK --set-mark 1
    iptables -t mangle -I OUTPUT -p tcp --dport 443 --syn -j MARK --set-mark 1
    
    touch .initialized
fi

echo "queuing incomming requests"
nl-qdisc-add --dev=lo --parent=1:4 --id=40: --update plug --buffer
sleep 0.1

echo "starting haproxy"
/usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg -D -p /var/run/haproxy.pid -sf $(/bin/cat /var/run/haproxy.pid)
echo "dequeuing requests"
nl-qdisc-add --dev=lo --parent=1:4 --id=40: --update plug --release-indefinite
