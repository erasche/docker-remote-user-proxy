#!/bin/bash
# Pull containers
echo "Pulling containers"
docker-compose pull;
# And launch (they launch quickly)
echo 
echo 
echo 
echo "Launching containers"
docker-compose up -d 2> /dev/null;
# Sleep just to be sure
sleep 1;
# Then make a cURL request to check the headers. They SHOULD have a `REMOTE_USER` header set.
echo "Containers started, please check for REMOTE_USER in the following request"
curl $(docker-compose port remote_user 80)/headers
docker-compose kill 2> /dev/null;
docker-compose rm -f 2> /dev/null;
