#! /bin/bash

echo "----------------------------------- REPORT IPS [CONTAINERS] -----------------------------------"

docker network inspect ansiblelab_default \
| jq -r '.[] | .Containers | to_entries[] | "\(.value.Name) ->  \(.value.IPv4Address)"'
