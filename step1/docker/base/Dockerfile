# step1 master build steps
FROM ubuntu:latest
# dependencies
RUN apt-get update && apt-get install -y unzip nginx supervisor dnsutils vim
ADD https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip /tmp/consul.zip
# preparing
WORKDIR /tmp
RUN mkdir -p /var/consu
RUN unzip /tmp/consul.zip
RUN mv /tmp/consul /usr/bin
RUN rm -rf /tmp/consul.zip
# copying configuration
ADD consul /etc/consul.d
COPY nginx/default /etc/nginx/sites-enabled/default
COPY nginx/nginx.conf /etc/nginx/nginx.conf
ADD supervisor /etc/supervisor/conf.d
# starting services
CMD ["/usr/bin/supervisord", "-n"]