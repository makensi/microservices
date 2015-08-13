#!/bin/bash
docker build -t makensi/microservices:step1-base docker/base
if [ $? -ne 0 ]; then
    exit 1
fi
echo
echo "base built"
echo
sleep 1
docker build -t makensi/microservices:step1-master docker/master
if [ $? -ne 0 ]; then
    exit 1
fi
echo
echo "master built"
echo
sleep 1
docker build -t makensi/microservices:step1-loadbalancer docker/loadbalancer
if [ $? -ne 0 ]; then
    exit 1
fi
echo
echo "loadbalancer built"
echo
sleep 1
docker build -t makensi/microservices:step1-web docker/web
if [ $? -ne 0 ]; then
    exit 1
fi
echo
echo "web built"
echo
sleep 1