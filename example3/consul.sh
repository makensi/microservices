#!/bin/bash
echo "building base"
docker build -t makensi/microservices:example-base /docker/base
echo "building consul"
docker build -t makensi/microservices:example-consul /docker/consul
echo "launching consul"
docker run --name consul$1 --hostname consul$1 \
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