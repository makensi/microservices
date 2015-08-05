# step1 master build steps
FROM ubuntu:latest
# dependencies
RUN apt-get update && apt-get install -y unzip nginx supervisor dnsmasq dnsutils vim
ADD https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip /tmp/consul.zip
# preparing
WORKDIR /tmp
RUN mkdir -p /var/consul /usr/share/consul
RUN unzip /tmp/consul.zip
RUN mv /tmp/consul /usr/bin
RUN rm -rf /tmp/consul.zip
# copying configuration
ADD consul /etc/consul.d
ADD nginx /etc/nginx/sites-enabled
ADD supervisor /etc/supervisor/conf.d
ADD static /usr/share/nginx/html
# starting services
CMD ["/usr/bin/supervisord", "-n"]