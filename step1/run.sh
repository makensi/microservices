#!/bin/bash
# expose only port to one of them
echo
echo "running masters"
echo
docker run --name master1 --hostname master1 \
	-p 8200:80 \
    -p 8300:8300 \
    -p 8301:8301 \
    -p 8301:8301/udp \
    -p 8302:8302 \
    -p 8302:8302/udp \
    -p 8400:8400 \
    -p 8500:8500 \
    -p 8600:8600/udp \
	-d makensi/microservices:step1-master
docker run --name master2 --hostname master2 \
	--link master1:master1 \
	-d makensi/microservices:step1-master
docker run --name master3 --hostname master3 \
	--link master1:master1 \
	-d makensi/microservices:step1-master
#
echo
echo "running loadbalancer"
echo
docker run --name loadbalancer --hostname loadbalancer \
	--link master1:master1 \
	--link master2:master2 \
	--link master3:master3 \
	-p 8100:80 \
	-d makensi/microservices:step1-loadbalancer
#
echo
echo "running webs"
echo
docker run --name web1 --hostname web1 \
	--link master1:master1 \
	--link master2:master2 \
	--link master3:master3 \
	-d makensi/microservices:step1-web
docker run --name web2 --hostname web2 \
	--link master1:master1 \
	--link master2:master2 \
	--link master3:master3 \
	-d makensi/microservices:step1-web