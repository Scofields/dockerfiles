FROM debian:jessie

RUN apt-get -qq update && \
    apt-get install -y libnl-utils ufw haproxy python-setuptools ca-certificates && \
    easy_install supervisor && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD haproxy.cfg /etc/haproxy/haproxy.cfg
ADD haproxy.sh /haproxy.sh
ADD supervisord.conf /etc/supervisord.conf

RUN chmod a+x /haproxy.sh
RUN mkdir -p /var/run/haproxy /var/lib/haproxy
RUN chown -R haproxy:haproxy /var/run/haproxy /var/lib/haproxy

RUN echo "* soft nofile 1048576" >> /etc/security/limits.conf
RUN echo "* hard nofile 1048576" >> /etc/security/limits.conf

EXPOSE 80 443

CMD ["supervisord", "-n", "-c", "/etc/supervisord.conf"]
