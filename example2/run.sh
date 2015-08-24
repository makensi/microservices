#!/bin/bash
#
echo "$(docker-machine env --swarm swarm-master)"
#
#
eval $(docker-machine env --swarm swarm-master)
#
. ../example1/run.sh