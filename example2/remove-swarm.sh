#!/bin/bash
docker-machine stop swarm-master
# docker-machine rm swarm-master
for i in $(seq 1 1 3)
	do
	docker-machine stop swarm-agent-0$i
	# docker-machine rm swarm-agent-0$i
done
. unset-swarm.sh