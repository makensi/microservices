# Docker + Consul + Nginx

	Under development - working on consul template for balancing web agents.

The test create a pool of three master nodes and two web agent:

	  M          W1
	/   \   LB   ...
	M - M        WN

M = Master (consul server mode) - consul + ui
LB = Load balancer (consul agent) - nginx + consul + consul template
WN = Web (consul agent) - nginx + consul 

The example provide the docker creation for consul servers (masters) and web server (agent).

## Build and run

Build dockers
	
	./build.sh

Execute the example

	./run

## Exposed ports

1. dns - 8600.
2. http - 8500
3. rpc - 8400
4. lan - 8301
5. wan - 8302
6. rpc - 8300
7. ui - 8200
8. web - 8100

Architecture: x86_64