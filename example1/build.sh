#!/bin/bash
docker build -t makensi/microservices:example-base ../docker/base
if [ $? -ne 0 ]; then
    exit 1
fi
echo
echo "base built"
echo
sleep 1
docker build -t makensi/microservices:example-consul ../docker/consul
if [ $? -ne 0 ]; then
    exit 1
fi
echo
echo "server built"
echo
sleep 1
docker build -t makensi/microservices:example-nginx-proxy ../docker/nginx-proxy
if [ $? -ne 0 ]; then
    exit 1
fi
echo
echo "loadbalancer built"
echo
sleep 1
docker build -t makensi/microservices:example-nginx ../docker/nginx
if [ $? -ne 0 ]; then
    exit 1
fi
echo
echo "web built"
echo
sleep 1