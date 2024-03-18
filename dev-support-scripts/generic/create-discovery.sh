#!/bin/bash

USERNAME="admin"
PASSWORD="admin" #grep "openNMSPassword" examples/lokahi-values.yaml | awk '{print $2}'
CLIENT_ID="lokahi"

API_BASE_URL="https://onmshs"
AUTH_REALM="opennms"
AUTHURL="${API_BASE_URL}/auth/realms/${AUTH_REALM}/protocol/openid-connect/token"
GRAPHURL="${API_BASE_URL}/api/graphql"

DISCOVERY_IP="192.168.1.0/24"
DISCOVERY_NAME="e2e-test-discovery"

# Login
RESPONSE=$(curl \
			-S \
			-s \
			-f \
			-X POST \
			-H 'Content-Type: application/x-www-form-urlencoded' \
			-d "username=${USERNAME}" \
			-d "password=${PASSWORD}" \
			-d 'grant_type=password' \
			-d "client_id=${CLIENT_ID}" \
			-d 'scope=openid' \
            --insecure \
			"${AUTHURL}")

ACCESS_TOKEN="$(echo "$RESPONSE" | jq -r '.access_token')"
if [ -z "${ACCESS_TOKEN}" ]; then
  echo "FAILED TO LOGIN"
  exit 1
fi

TEST='{
    "query": "mutation CreateOrUpdateActiveIcmpDiscovery($request: IcmpActiveDiscoveryCreateInput\u0021) {upsertIcmpActiveDiscovery(request: $request) {    id    name    ipAddresses    locationId    snmpConfig {      ports      readCommunities    }  }}",
    "variables": {
        "request": {
            "ipAddresses": [
                "OUR_IPADDRESS"
            ],
            "locationId": 1,
            "name": "OUR_DISCOVERYNAME",
            "snmpConfig": {
                "ports": [
                    "161"
                ],
                "readCommunities": [
                    "public"
                ]
            },
            "tags": [
                {
                    "name": "default"
                }
            ]
        }
    }
}'

newStr=${TEST//"OUR_IPADDRESS"/$DISCOVERY_IP}
newStr=${newStr//"OUR_DISCOVERYNAME"/$DISCOVERY_NAME}

RESPONSE=$(curl "${GRAPHURL}" \
  -S \
  -s \
  -H "authorization: Bearer ${ACCESS_TOKEN}" \
  -H 'content-type: application/json' \
  --data-ascii "${newStr}" \
  --insecure)
if [ -z "${RESPONSE}" ]; then
  echo "FAILED TO CREATE ${DISCOVERY_NAME}"
  exit 1
fi
