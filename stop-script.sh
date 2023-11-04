#!/bin/sh

docker-compose stop
docker rm --force powerplant-api
docker images --format '{{.Repository}}:{{.Tag}}' | grep "powerplant-api-img" | xargs -r docker rmi