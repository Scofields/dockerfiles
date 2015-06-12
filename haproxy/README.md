# haproxy

An image with zero-packet-loss configuration reload.

## run

    docker run -d \
           --name="<name of the container>" \
           -v <path to haproxy>:/etc/haproxy/haproxy.cfg \
           -p 0.0.0.0:80:80 -p 0.0.0.0:443:443 \
           rstiller/haproxy
    
    weave run --with-dns <an ip address> \
           --name="<name of the container>" \
           -v <path to haproxy>:/etc/haproxy/haproxy.cfg \
           -p 0.0.0.0:80:80 -p 0.0.0.0:443:443 \
           rstiller/haproxy
    weave export <an ip address>

## restart

Note:
    Changes in the mounted configuration file are immediately available inside the container - so simply restart haproxy for the changes to be applied.

    docker exec <name of the container> /haproxy.sh
