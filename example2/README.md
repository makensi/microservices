# Docker-Machine(VirtualBox) + Docker Swarm + Consul + Nginx

This test is just create a Docker Swarm (cluster) base on same structure than example 1. This swarm contains:
* 1 swarm-master, for swarm management
* 3 swarm-nodes, as agents of the swarm which run the dockers

## Requirements

Below the specifications where it example was tested:

1. OS: Linux Mint 17.2 Rafaela
	1. Kernel: 3.16.0-38-generic #52~14.04.1-Ubuntu 
	2. Architecture: x86_64
2. Docker: version 1.7.1, build 786b29d
	1. docker image: ubuntu:latest
3. Docker-Machine: version 0.3.0
4. Docker-Swarm: latest, version 0.4.0
5. Virtual Box: version 4.3.28
3. consul: 0.5.2_linux_amd64
4. consul-template: 0.10.0_linux_amd64

## Build and run

Build Docker machines and dockers
	
```shell
./run.sh
```

Once done it automatically run the dockers inside the swarm-agents

## Directories

* base, 
	* docker: makensi/microservices:example-base
	* include:
		* nginx
		* consul
		* supervisor
* server, 
	* docker: makensi/microservices:example-server
		* inheritance: makensi/microservices:example-base
	* include:
		* consul
		* nginx
* loadbalancer, 
	* docker: makensi/microservices:example-nginx-proxy
		* inheritance: makensi/microservices:example-base
	* include:
		* consul
		* consul-template
		* supervisor
* web, 
	* docker: makensi/microservices:example-nginx
		* inheritance: makensi/microservices:example-base
	* include:
		* consul

## Docker in Swarm

This command give you the invormation about the VM swarm-master:

```shell
$ docker-machine env --swarm swarm-master

export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:3376"
export DOCKER_CERT_PATH="/home/user/.docker/machine/machines/swarm-master"
export DOCKER_MACHINE_NAME="swarm-master"
# Run this command to configure your shell: 
# eval "$(docker-machine env swarm-master)"
```
If you like work directly with docker swarm in VM you should execute:

```shell
eval "$(docker-machine env --swarm swarm-master)"
```

After that whatever action in docker will be performed in the swarm

## Ports 


Once the example is running these is the list of available ports:

1. dns - 8600 - not bound to 53 because I am using dnsmasq locally.
2. http - 8500
3. rpc - 8400
4. lan - 8301
5. wan - 8302
6. rpc - 8300
7. ui - 8200
8. web - 8100

# DNS check

Once executed `run.sh` you can check the dns interface of consul using dig (dnsutils package):

```shell
dig @localhost -p 8600 web.service.consul
dig @localhost -p 8600 loadbalancer.service.consul
dig @localhost -p 8600 consul.service.consul
```

## Links

* install: http://docs.docker.com/swarm/install-manual/
* w machine: http://docs.docker.com/swarm/install-w-machine/
* swarm hub: https://hub.docker.com/_/swarm/
* parameters: https://docs.docker.com/v1.5/machine/
* discovery: http://docs.docker.com/swarm/discovery/
