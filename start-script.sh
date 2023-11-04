#!/bin/sh

./mvnw clean install -DskipTests
docker-compose -p powerplant-web-services up -d