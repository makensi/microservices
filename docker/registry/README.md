docker run -d -p 5000:5000 --name registry registry:2

Tag
docker tag ubuntu:latest localhost:5000/ubuntu:latest
Push
docker push localhost:5000/ubuntu:latest


docker stop registry && docker rm -v registry

