#! /bin/bash

#Exit immediately if any command fails
set -e

#Update repository
#git pull origin master

#Build dockerfile
docker build --rm -t $(etcdctl get /announce/services/docker-registry/host)/sodioapi:latest .

#Restart docker (hack for now, since docker _always_ hangs when trying to push image immediately after building it)
sudo systemctl restart docker

#TODO: Look into using the timeout command for the push and if it fails, then restart docker. Loop this for a while and if it still fails then exit

#Push dockerfile
docker push $(etcdctl get /announce/services/docker-registry/host)/sodioapi:latest

