#!/bin/bash
# expose only port to one of them
docker run --name master1 --hostname master1 -p 8000:80 -d makensi/microservices:step1-master
docker run --name master2 --hostname master2 --link master1:master1 -d makensi/microservices:step1-master
docker run --name master3 --hostname master3 --link master1:master1 -d makensi/microservices:step1-master
