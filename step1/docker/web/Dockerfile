FROM makensi/microservices:step1-base
# preparing
WORKDIR /tmp
# copying configuration
ADD consul /etc/consul.d
ADD nginx /etc/nginx/sites-enabled
ADD supervisor /etc/supervisor/conf.d
ADD static /usr/share/nginx/html
# starting services
CMD ["/usr/bin/supervisord", "-n"]