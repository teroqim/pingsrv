#! /bin/bash

#Exit immediately if any command fails
set -e

#Update repository
git pull origin master

#Build dockerfile
docker build --rm -t $(etcdctl get /announce/services/docker-registry/host)/pingsrv:latest .

#Push dockerfile
docker push $(etcdctl get /announce/services/docker-registry/host)/pingsrv:latest

