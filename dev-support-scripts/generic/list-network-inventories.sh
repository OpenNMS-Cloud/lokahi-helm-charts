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

list_networkinventories(){
    TEMPLATE_QUERY='
query BuildNetworkInventoryPage {findAllNodes {    id    ipInterfaces {      id      ipAddress      nodeId      snmpPrimary    }    location {      id      location    }    tags {      id      name    }    monitoredState    monitoringLocationId    nodeLabel    scanType    nodeAlias  }  allMetrics: metric(name: "response_time_msec") {    status    data {      resultType      result {        metric        value        values      }    }  }}
'
gql_formatted_query_envelope="$(echo "$TEMPLATE_QUERY" | jq -R 'select(length > 0) | { query: . }')"
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

echo "ID NodeLabel NodeAlias ScanType IpInterface Location MonitoredState"
echo "${RESPONSE}" | jq -r '.data.findAllNodes[] | " \(.id) \(.nodeLabel) \(.nodeAlias) \(.scanType) \(.ipInterfaces[].ipAddress) \(.location.location) \(.monitoredState) "'
}

list_networkinventories