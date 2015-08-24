#!/bin/bash
# expose only port to one of them
echo
echo "running consul"
echo
docker run --name consul1 --hostname consul1 \
	-p 8200:80 \
    -p 8300:8300 \
    -p 8301:8301 \
    -p 8301:8301/udp \
    -p 8302:8302 \
    -p 8302:8302/udp \
    -p 8400:8400 \
    -p 8500:8500 \
    -p 8600:8600/udp \
	-d makensi/microservices:example-consul
docker run --name consul2 --hostname consul2 \
	--link consul1:consul1 \
	-d makensi/microservices:example-consul
docker run --name consul3 --hostname consul3 \
	--link consul1:consul1 \
	-d makensi/microservices:example-consul
#
echo
echo "running nginx-proxy"
echo
docker run --name nginx-proxy --hostname nginx-proxy \
	--link consul1:consul1 \
	--link consul2:consul2 \
	--link consul3:consul3 \
	-p 8100:80 \
	-d makensi/microservices:example-nginx-proxy
#
echo
echo "running nginx"
echo
docker run --name nginx1 --hostname nginx1 \
	--link consul1:consul1 \
	--link consul2:consul2 \
	--link consul3:consul3 \
	-d makensi/microservices:example-nginx
docker run --name nginx2 --hostname nginx2 \
	--link consul1:consul1 \
	--link consul2:consul2 \
	--link consul3:consul3 \
	-d makensi/microservices:example-nginx
docker run --name nginx3 --hostname nginx3 \
	--link consul1:consul1 \
	--link consul2:consul2 \
	--link consul3:consul3 \
	-d makensi/microservices:example-nginx