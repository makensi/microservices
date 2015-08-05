Docker + Consul + Nginx

	  M        Http1
	/   \      ...
	M - M      HttpN

M = Master (consul server mode)
HttpX = Ngnix (agent) 


first build after run

# to build it: docker build -t "makensi/microservices:step1-master" master
# to run it: docker run --name master1 --hostname master1 -d makensi/microservices:step1-master 
# to execute consul:
# 1: docker exec -it master1 /bin/bash
# 2: consul agent -config-dir /etc/consul.d


# Client Addr: 127.0.0.1 (HTTP: 8500, DNS: 8600, RPC: 8400)
# Cluster Addr: X.Y.Z.W (LAN: 8301, WAN: 8302)
# Raft: 8300

localhost:8000 consul ui
localhost:8001 webserver
localhost:8002 dns


Dnsmasq to webserver:

sudo vi /etc/dnsmasq.conf 
sudo vi /etc/dnsmasq.d/consul
