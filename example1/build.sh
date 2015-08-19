#!/bin/bash
docker build -t makensi/microservices:example1-base docker/base
if [ $? -ne 0 ]; then
    exit 1
fi
echo
echo "base built"
echo
sleep 1
docker build -t makensi/microservices:example1-server docker/server
if [ $? -ne 0 ]; then
    exit 1
fi
echo
echo "server built"
echo
sleep 1
docker build -t makensi/microservices:example1-loadbalancer docker/loadbalancer
if [ $? -ne 0 ]; then
    exit 1
fi
echo
echo "loadbalancer built"
echo
sleep 1
docker build -t makensi/microservices:example1-web docker/web
if [ $? -ne 0 ]; then
    exit 1
fi
echo
echo "web built"
echo
sleep 1