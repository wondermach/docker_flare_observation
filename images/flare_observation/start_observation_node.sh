#!/bin/bash
echo "Starting flare observation node"
/data/flare/go-flare/avalanchego/build/avalanchego --network-id=flare --http-host= \
  --bootstrap-ips="$(curl -m 10 -sX POST --data '{ "jsonrpc":"2.0", "id":1, "method":"info.getNodeIP" }' -H 'content-type:application/json;' https://flare.flare.network/ext/info | jq -r ".result.ip")"  \
  --bootstrap-ids="$(curl -m 10 -sX POST --data '{ "jsonrpc":"2.0", "id":1, "method":"info.getNodeID" }' -H 'content-type:application/json;' https://flare.flare.network/ext/info | jq -r ".result.nodeID")" \
  --public-ip=${PUBLIC_IP} --data-dir=/data/flare-data/  --config-file /data/flare/go-flare/config/localflare/C/config.wonderftso.json 2>&1