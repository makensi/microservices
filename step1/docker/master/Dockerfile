# to build it: docker build -t "makensi/microservices:step1-master" master
# to run it: docker run --name master1 --hostname master1 -d makensi/microservices:step1-master 
# to execute consul:
# 1: docker exec -it master1 /bin/bash
# 2: consul agent -config-dir /etc/consul.d
# step1 master build steps
FROM ubuntu:latest
# dependencies
RUN apt-get update && apt-get install -y unzip nginx supervisor
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
ADD nginx /etc/nginx/sites-enabled
ADD supervisor /etc/supervisor/conf.d
# Exposing service ports
# Client Addr: 127.0.0.1 (HTTP: 8500, DNS: 8600, RPC: 8400)
# Cluster Addr: X.Y.Z.W (LAN: 8301, WAN: 8302)
# Raft: 8300
EXPOSE 8400 8500 8600 8300 8301 8302
CMD ["/usr/bin/supervisord", "-n"]
