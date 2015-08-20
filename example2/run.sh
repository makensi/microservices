#!/bin/bash
#
unset DOCKER_CERT_PATH     
unset DOCKER_HOST          
unset DOCKER_MACHINE_NAME  
unset DOCKER_TLS_VERIFY    
# create a swarm and if exists will removed it (--rm)
echo "Creating swarm"
export DOCKER_SWARM_TOKEN="$(docker run --rm swarm create)"
echo "Swarm token://$DOCKER_SWARM_TOKEN"
#
# create the master
echo "Creating swarm master"
#
docker-machine create \
	-d virtualbox \
	--swarm \
	--swarm-master \
	--swarm-discovery token://$DOCKER_SWARM_TOKEN \
	--virtualbox-memory 512 \
	--virtualbox-disk-size 2048 \
	swarm-master
#
#
for i in $(seq 0 1 2)
	do 
	#
	echo "Building vm $i"
	# megabytes
	docker-machine create \
		-d virtualbox \
		--swarm \
		--swarm-discovery token://$DOCKER_SWARM_TOKEN \
		--virtualbox-memory 512 \
		--virtualbox-disk-size 2048 \
		swarm-node-0$i
	#
	echo "Launching server$i"
done
#
echo "$(docker-machine env --swarm swarm-master)"
#
#
eval $(docker-machine env --swarm swarm-master)
#
# build the images
docker build -t makensi/microservices:example2-base docker/base
docker build -t makensi/microservices:example2-server docker/server
docker build -t makensi/microservices:example2-loadbalancer docker/loadbalancer
docker build -t makensi/microservices:example2-web docker/web
#
# expose only port to one of them
echo
echo "running servers"
echo
docker run --name server1 --hostname server1 \
	-p 8200:80 \
    -p 8300:8300 \
    -p 8301:8301 \
    -p 8301:8301/udp \
    -p 8302:8302 \
    -p 8302:8302/udp \
    -p 8400:8400 \
    -p 8500:8500 \
    -p 8600:8600/udp \
	-d makensi/microservices:example2-server
docker run --name server2 --hostname server2 \
	--link server1:server1 \
	-d makensi/microservices:example2-server
docker run --name server3 --hostname server3 \
	--link server1:server1 \
	-d makensi/microservices:example2-server
#
echo
echo "running loadbalancer"
echo
docker run --name loadbalancer --hostname loadbalancer \
	--link server1:server1 \
	--link server2:server2 \
	--link server3:server3 \
	-p 8100:80 \
	-d makensi/microservices:example2-loadbalancer
#
echo
echo "running webs"
echo
docker run --name web1 --hostname web1 \
	--link server1:server1 \
	--link server2:server2 \
	--link server3:server3 \
	-d makensi/microservices:example2-web
docker run --name web2 --hostname web2 \
	--link server1:server1 \
	--link server2:server2 \
	--link server3:server3 \
	-d makensi/microservices:example2-web
docker run --name web3 --hostname web3 \
	--link server1:server1 \
	--link server2:server2 \
	--link server3:server3 \
	-d makensi/microservices:example2-web