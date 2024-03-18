#!/bin/bash

USERNAME="admin"
PASSWORD="admin" #grep "openNMSPassword" examples/lokahi-values.yaml | awk '{print $2}'
CLIENT_ID="lokahi"

API_BASE_URL="https://onmshs"
AUTH_REALM="opennms"
AUTHURL="${API_BASE_URL}/auth/realms/${AUTH_REALM}/protocol/openid-connect/token"
GRAPHURL="${API_BASE_URL}/api/graphql"

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

NodeID=$((1 + $RANDOM % 11))
NodeAlias="RandomLabel$((1 + $RANDOM % 2000))"

echo ">> Updating node with ID $NodeID to $NodeAlias alias"
Update_nodeAlias(){
    if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters"
    exit 1
    fi

    TEMPLATE_QUERY='
    {
    "query": "mutation UpdateNode($node: NodeUpdateInput!) {  updateNode(node: $node)}",
    "variables": {
        "node": {
            "id": NODEID,
            "nodeAlias": "NODEALIAS"
        }
    }
}'

newStr=${TEMPLATE_QUERY//"NODEID"/$1}
newStr=${newStr//"NODEALIAS"/$2}
#gql_formatted_query_envelope="$(echo "$TEMPLATE_QUERY" | jq -R 'select(length > 0) | { query: . }')"
RESPONSE=$(curl \
			-S \
			-s \
			-f \
			-X POST \
			-H 'Content-Type: application/json' \
			-H "Authorization: Bearer ${ACCESS_TOKEN}" \
			--data-ascii "${newStr}" \
            --insecure \
			"${GRAPHURL}")

}

Update_nodeAlias $NodeID $NodeAlias
