#!/bin/bash

# Strict mode, fail on any error
set -euo pipefail

export RESOURCE_GROUP="dm-debezium-ct"
export EVENTHUB_NAME="dm-debezium-ct"

echo "deleting debezium-created eventhubs"
ehs=("debezium_configs" "debezium_offsets" "debezium_statuses")
for e in "${ehs[@]}"; do
    echo "deleting $e..."
    az eventhubs eventhub delete -g $RESOURCE_GROUP --namespace-name $EVENTHUB_NAME --name $e
done

echo "done"
