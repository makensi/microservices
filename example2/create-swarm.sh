#!/bin/bash
#
. unset-swarm.sh
#
. remove-swarm.sh
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
for i in $(seq 1 1 3)
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
		swarm-agent-0$i
	#
	echo "Launching server$i"
done