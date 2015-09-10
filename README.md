# Microservices
Test examples to build complete microservices architectures form infrastructure to data and applications with different approaches done to learn how to build it using several tools and platforms.

`Currently working on infrastructure with containers and virtualization`.

* Example 1
	* Services orchestation using consul over docker.
	* Platforms, tools & infrastructure: docker + consul + consul-template + nginx.
	* Description: Simple example with loadbalancer (nginx) and 3 web servers (nginx), all managed by 3 consul servers.
* Example 2 (ongoing)
	* Services orchestation using consul over docker swarm.
	* Platforms, tools & infrastructure: docker (swarm + machine) + consul + consul-template + nginx.
	* Description: Simple example with loadbalancer (nginx) and 3 web servers (nginx), all managed by 3 consul servers over docker swarm base on VirtualBox.
* Example 3 (ongoing)
	* Services orchestation using consul over docker + vagrant.
	* Platforms, tools & infrastructure: docker + vagrant + consul + consul-template + nginx.
	* Description: Simple example with loadbalancer (nginx) and 3 web servers (nginx), all managed by 3 consul servers over vagrant base on VirtualBox.