#!/bin/bash
# Pull containers
docker-compose pull;
# And launch (they launch quickly)
docker-compose up -d
# Sleep just to be sure
sleep 1;
# Then make a cURL request to check the headers. They SHOULD have a `REMOTE_USER` header set.
echo "Containers started, please check for REMOTE_USER in the following request"
curl $(docker-compose port remote_user 80)/headers
docker-compose kill
docker-compose rm -f
