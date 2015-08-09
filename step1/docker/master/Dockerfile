FROM makensi/microservices:step1-base
# dependencies
ADD https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip /tmp/consul_ui.zip
# preparing
WORKDIR /tmp
RUN mkdir -p /usr/share/consul/ui
RUN unzip /tmp/consul_ui.zip
RUN mv /tmp/dist/* /usr/share/consul/ui
RUN rm -rf /tmp/consul_ui.zip /tmp/dist
# copying configuration
ADD consul /etc/consul.d
ADD nginx /etc/nginx/sites-enabled
ADD supervisor /etc/supervisor/conf.d
# Exposing service ports
EXPOSE 8300 8301 8302 8400 8500 8600 8600/udp
# starting services
CMD ["/usr/bin/supervisord", "-n"]