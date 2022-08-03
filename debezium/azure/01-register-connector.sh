#!/bin/bash

# Strict mode, fail on any error
#set -euo pipefail

export RESOURCE_GROUP="dm-debezium-ct2"
export CONTAINER_NAME="dm-debezium-ct2"

echo "finding debezium ip"
export DEBEZIUM_IP2=`az container show -g $RESOURCE_GROUP -n $CONTAINER_NAME -o tsv --query "ipAddress.ip"`

echo "registering connector"
curl -i -X POST \
    -H "Accept:application/json" -H  "Content-Type:application/json" \
    http://${DEBEZIUM_IP2}:8083/connectors/ \
    -d @../register-sqlserver-eh.json
