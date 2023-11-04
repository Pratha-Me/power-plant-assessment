#!/bin/sh

./mvnw clean install
docker-compose -p powerplant-web-services up -d