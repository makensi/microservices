#!/bin/bash
# start registry
## cd ../docker/registry
## docker-compose up -d
## cd ../example2
# build locally
## docker build -t makensi/microservices:example-base ../docker/base
## if [ $? -ne 0 ]; then
##     exit 1
## fi
## echo
## echo "base built"
## echo
## sleep 1
## docker build -t makensi/microservices:example-consul ../docker/consul
## if [ $? -ne 0 ]; then
##     exit 1
## fi
## echo
## echo "server built"
## echo
## sleep 1
## docker build -t makensi/microservices:example-nginx-proxy ../docker/nginx-proxy
## if [ $? -ne 0 ]; then
##     exit 1
## fi
## echo
## echo "loadbalancer built"
## echo
## sleep 1
## docker build -t makensi/microservices:example-nginx ../docker/nginx
## if [ $? -ne 0 ]; then
##     exit 1
## fi
## echo
## echo "web built"
## echo
## sleep 1
# tagging
docker tag makensi/microservices:example-consul localhost:5000/makensi/microservices:example-consul
docker tag makensi/microservices:example-nginx-proxy localhost:5000/makensi/microservices:example-nginx-proxy
docker tag makensi/microservices:example-nginx localhost:5000/makensi/microservices:example-nginx
# pushing to the registry
docker push localhost:5000/makensi/microservices:example-consul
docker push localhost:5000/makensi/microservices:example-nginx-proxy
docker push localhost:5000/makensi/microservices:example-nginx