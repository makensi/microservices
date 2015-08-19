FROM makensi/microservices:example1-base
# preparing
WORKDIR /tmp
# copying configuration
ADD consul /etc/consul.d
ADD static /usr/share/nginx/html
# starting services
CMD ["/usr/bin/supervisord", "-n"]