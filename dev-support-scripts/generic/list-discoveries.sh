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

list_discoveries(){
    TEMPLATE_QUERY_DISCOVERIES='
query ListDiscoveries {  listActiveDiscovery {    details    discoveryType  }}
'
#query ListDiscoveries {  passiveDiscoveries {    id    locationId    name    snmpCommunities    snmpPorts    toggle  }  listActiveDiscovery {    details    discoveryType  }}
 
gql_formatted_query_envelope="$(echo "$TEMPLATE_QUERY_DISCOVERIES" | jq -R 'select(length > 0) | { query: . }')"
RESPONSE=$(curl \
			-S \
			-s \
			-f \
			-X POST \
			-H 'Content-Type: application/json' \
			-H "Authorization: Bearer ${ACCESS_TOKEN}" \
			--data-ascii "${gql_formatted_query_envelope}" \
            --insecure \
			"${GRAPHURL}")

echo "Active Discovery:"
echo " ID  NAME"
echo "${RESPONSE}" | jq -r '.data.listActiveDiscovery[].details | " \(.id) \(.name)"'
}

list_discoveries