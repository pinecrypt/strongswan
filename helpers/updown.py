#!/usr/bin/env python
import requests
import os

# TODO: Replace with simple shell script and drop Python
url = "http://127.0.0.1:2001/api/by-dn/%s" % os.environ["PLUTO_PEER_ID"]
for key, value in os.environ.items():
    if key.startswith("PLUTO_PEER_SOURCEIP"):
        requests.post(url, data={
            "service": "strongswan",
            "internal_addr": value,
            "remote_addr": os.environ["PLUTO_PEER"],
            "remote_port": 0
        })
