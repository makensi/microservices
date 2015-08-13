FROM makensi/microservices:step1-base
# dependencies
ADD https://github.com/hashicorp/consul-template/releases/download/v0.10.0/consul-template_0.10.0_linux_amd64.tar.gz /tmp/consul-template_0.10.0_linux_amd64.tar.gz
# preparing
WORKDIR /tmp
RUN mkdir -p /usr/share/consul/templates
RUN tar xzf /tmp/consul-template_0.10.0_linux_amd64.tar.gz
RUN mv /tmp/consul-template_0.10.0_linux_amd64/consul-template /usr/bin
RUN rm -rf /tmp/consul-template_0.10.0_linux_amd64*
# copying configuration
ADD consul /etc/consul.d
ADD supervisor /etc/supervisor/conf.d
COPY consul-template/default.ctmpl /usr/share/consul/templates/default.ctmpl
COPY consul-template/consul-template.conf /etc/consul-template.conf
# starting services
CMD ["/usr/bin/supervisord", "-n"]