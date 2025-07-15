#! /bin/bash

echo "----------------------------------- REPORT IPS [CONTAINERS] -----------------------------------"

docker network inspect ansiblelab_ansible_net \
| jq -r '.[] | .Containers | to_entries[] | "\(.value.Name) ->  \(.value.IPv4Address)"'
