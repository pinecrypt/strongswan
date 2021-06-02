#!/bin/sh
while [ ! -e $1 ]; do
  sleep 1
done
curl -X DELETE http://127.0.0.1:2001/api/by-service/strongswan
ipsec start --nofork
