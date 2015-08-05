#!/bin/bash
docker build -t makensi/microservices:step1-master docker/master
docker build -t makensi/microservices:step1-agent docker/agent
