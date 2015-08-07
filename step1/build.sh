#!/bin/bash
docker build -t makensi/microservices:step1-master docker/master
echo
echo "master build"
echo
docker build -t makensi/microservices:step1-loadbalancer docker/loadbalancer
echo
echo "loadbalancer build"
echo
docker build -t makensi/microservices:step1-web docker/web
echo
echo "web build"
echo