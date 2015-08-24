#!/bin/bash
#
. unset.sh
#
docker-machine stop swarm-master
docker-machine rm swarm-master
for i in $(seq 0 1 2)
	do
	docker-machine stop swarm-agent-0$i
	docker-machine rm swarm-agent-0$i
done
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
		swarm-agent-0$i
	#
	echo "Launching server$i"
done
#
echo "$(docker-machine env --swarm swarm-master)"
#
#
eval $(docker-machine env --swarm swarm-master)
#
. ../example1/build.sh