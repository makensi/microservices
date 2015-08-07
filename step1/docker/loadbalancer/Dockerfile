# step1 master build steps
FROM ubuntu:latest
# dependencies
RUN apt-get update && apt-get install -y unzip nginx supervisor dnsutils vim
ADD https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip /tmp/consul.zip
ADD https://github.com/hashicorp/consul-template/releases/download/v0.10.0/consul-template_0.10.0_linux_amd64.tar.gz /tmp/consul-template_0.10.0_linux_amd64.tar.gz
# preparing
WORKDIR /tmp
RUN mkdir -p /var/consul /usr/share/consul/templates
RUN unzip /tmp/consul.zip
RUN tar xzf /tmp/consul-template_0.10.0_linux_amd64.tar.gz
RUN mv /tmp/consul /usr/bin
RUN mv /tmp/consul-template_0.10.0_linux_amd64/consul-template /usr/bin
RUN rm -rf /tmp/consul.zip /tmp/consul-template_0.10.0_linux_amd64*
# copying configuration
ADD consul /etc/consul.d
COPY nginx/default /etc/nginx/sites-enabled/default
COPY nginx/nginx.conf /etc/nginx/nginx.conf
ADD supervisor /etc/supervisor/conf.d
COPY consul-template/default.ctmpl /usr/share/consul/templates/default.ctmpl
COPY consul-template/consul-template.conf /etc/consul-template.conf
# starting services
CMD ["/usr/bin/supervisord", "-n"]