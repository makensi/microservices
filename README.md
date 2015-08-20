# Microservices
Test examples to build complete microservices architectures form infrastructure to data and applications with different approaches done to learn how to build it using several tools and platforms.

* Example 1
	* Services orchestation using consul.
	* Platforms, tools & infrastructure: docker + consul + consul-template + nginx.
	* Description: Simple example with loadbalancer (nginx) and 3 web servers (nginx), all managed by 3 consul servers.
* Example 2
	* Services orchestation using consul over docker swarm.
	* Platforms, tools & infrastructure: docker (swarm + machine) + consul + consul-template + nginx.
	* Description: Simple example with loadbalancer (nginx) and 3 web servers (nginx), all managed by 3 consul servers over docker swarm base on VirtualBox.