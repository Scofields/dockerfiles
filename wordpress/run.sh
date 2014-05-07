container_domain=www.example.com
container_hostname=www_example_com

docker run -i -t \
    -v /containers/$container_hostname/certs:/certs:ro \
    -v /containers/$container_hostname/logs:/logs:rw \
    -v /containers/$container_hostname/mails:/mails:rw \
    -v /containers/$container_hostname/mysql:/mysql:rw \
    -v /containers/$container_hostname/puppet:/puppet:rw \
    -v /containers/$container_hostname/wordpress:/var/www/wordpress:rw \
    -e FACTOR_DOMAIN=$container_domain \
    --lxc-conf="lxc.cgroup.cpuset.cpus = 0,1" \
    -m 128m \
    -h $container_hostname \
    1c38f66904d4 \
    /start.sh
