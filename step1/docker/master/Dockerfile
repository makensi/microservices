# step1 master build steps
FROM ubuntu:latest
# dependencies
RUN apt-get update && apt-get install -y unzip nginx supervisor dnsutils vim
ADD https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip /tmp/consul.zip
ADD https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip /tmp/consul_ui.zip
# preparing
WORKDIR /tmp
RUN mkdir -p /var/consul /usr/share/consul/ui
RUN unzip /tmp/consul.zip
RUN unzip /tmp/consul_ui.zip
RUN mv /tmp/consul /usr/bin
RUN mv /tmp/dist/* /usr/share/consul/ui
RUN rm -rf /tmp/consul.zip /tmp/consul_ui.zip /tmp/dist
# copying configuration
ADD consul /etc/consul.d
COPY nginx/default /etc/nginx/sites-enabled/default
COPY nginx/nginx.conf /etc/nginx/nginx.conf
ADD supervisor /etc/supervisor/conf.d
# Exposing service ports
EXPOSE 8300 8301 8302 8400 8500 8600 8600/udp
# starting services
CMD ["/usr/bin/supervisord", "-n"]