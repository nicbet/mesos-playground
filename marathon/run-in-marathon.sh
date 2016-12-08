#!/bin/bash

# Configure the following to be your correct Marathon IP
MARATHON_IP=http://10.0.15.101:8080


echo "Running $1 in Marathon on ${MARATHON_IP}...";
curl -X POST "${MARATHON_IP}/v2/apps" -d @"$1" -H "Content-type: application/json";
echo "";
