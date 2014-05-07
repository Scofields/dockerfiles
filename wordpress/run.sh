docker run -i -t -v \
    /containers/<DOMAIN>/certs/:/etc/ssl/private:ro \
    /containers/<DOMAIN>/logs/:/logs:rw \
    /containers/<DOMAIN>/mails/:/mails:rw \
    /containers/<DOMAIN>/mysql/:/mysql:rw \
    /containers/<DOMAIN>/wordpress/:/var/www/wordpress:rw \
    -e FACTOR_DOMAIN=www.example.com \
    -c 0.5 \
    --lxc-conf="lxc.cgroup.cpuset.cpus = 0,1" \
    -m 128m \
    -h <DOMAIN> \
    <IMAGE> \
    /usr/bin/supervisord
