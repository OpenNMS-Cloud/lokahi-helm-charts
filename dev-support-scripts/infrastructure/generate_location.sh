#!/bin/bash

LOCATION_NAME="e2e-test"


USERNAME="admin"
PASSWORD="admin"
CLIENT_ID="lokahi"
KUBERNETES_NAMESPACE="-n default"

API_BASE_URL="https://onmshs"
AUTH_REALM="opennms"
AUTHURL="${API_BASE_URL}/auth/realms/${AUTH_REALM}/protocol/openid-connect/token"
GRAPHURL="${API_BASE_URL}/api/graphql"

CLIENT_TRUSTSTORE="$(pwd)/../tmp/ca.crt"
CLIENT_KEYSTORE="$(pwd)/../tmp/minion1.p12"

kubectl get secret root-ca-certificate ${KUBERNETES_NAMESPACE} -o go-template='{{index .data "ca.crt" }}' | base64 --decode > "${CLIENT_TRUSTSTORE}"

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
            --cacert ${CLIENT_TRUSTSTORE} \
			"${AUTHURL}")

ACCESS_TOKEN="$(echo "$RESPONSE" | jq -r '.access_token')"
if [ -z "${ACCESS_TOKEN}" ]; then
  echo "FAILED TO LOGIN"
  exit 1
fi

# TEMPLATES
TEMPLATE_LOOKUP_LOCATION_GQL='
	query { locationByName(locationName: "%s") { id } }
	'
TEMPLATE_CREATE_LOCATION_GQL='
	mutation createLocation { createLocation(location: { location: "%s" }) { id } }
	'
TEMPLATE_GET_CERTIFICATE_GQL='
	query { getMinionCertificate(locationId: %d) { certificate, password } }
'

lookup_location(){
LOOKUP_LOCATION_GQL=$(printf "${TEMPLATE_LOOKUP_LOCATION_GQL}" "${LOCATION_NAME}")
gql_formatted_query_envelope="$(echo "$LOOKUP_LOCATION_GQL" | jq -R 'select(length > 0) | { query: . }')"
RESPONSE=$(curl \
			-S \
			-s \
			-f \
			-X POST \
			-H 'Content-Type: application/json' \
			-H "Authorization: Bearer ${ACCESS_TOKEN}" \
			--data-ascii "${gql_formatted_query_envelope}" \
			--cacert ${CLIENT_TRUSTSTORE} \
			"${GRAPHURL}")
LOCATION_ID="$(echo "${RESPONSE}" | jq -r '.data.locationByName.id')"
}

create_location(){	
CREATE_LOCATION_GQL=$(printf "${TEMPLATE_CREATE_LOCATION_GQL}" "${LOCATION_NAME}")
gql_formatted_query_envelope="$(echo "$CREATE_LOCATION_GQL" | jq -R 'select(length > 0) | { query: . }')"
RESPONSE=$(curl \
			-S \
			-s \
			-f \
			-X POST \
			-H 'Content-Type: application/json' \
			-H "Authorization: Bearer ${ACCESS_TOKEN}" \
			--data-ascii "${gql_formatted_query_envelope}" \
			--cacert ${CLIENT_TRUSTSTORE} \
			"${GRAPHURL}")
}

retrieve_certificate(){
    GET_CERTIFICATE_GQL=$(printf "${TEMPLATE_GET_CERTIFICATE_GQL}" "${LOCATION_ID}")
gql_formatted_query_envelope="$(echo "$GET_CERTIFICATE_GQL" | jq -R 'select(length > 0) | { query: . }')"
RESPONSE=$(curl \
			-S \
			-s \
			-f \
			-X POST \
			-H 'Content-Type: application/json' \
			-H "Authorization: Bearer ${ACCESS_TOKEN}" \
			--data-ascii "${gql_formatted_query_envelope}" \
			--cacert ${CLIENT_TRUSTSTORE} \
			"${GRAPHURL}")
		CERTIFICATE_DATA="$(echo "${RESPONSE}" | jq -r '.data.getMinionCertificate.certificate')"
		CERTIFICATE_PASSWORD="$(echo "${RESPONSE}" | jq -r '.data.getMinionCertificate.password')"

}

store_certificate ()
{
    echo "${CERTIFICATE_DATA}" | base64 --decode >"/tmp/cert.zip"
    unzip -o -p /tmp/cert.zip storage/minion1-${LOCATION_NAME}.p12 >"${CLIENT_KEYSTORE}"
}

lookup_location
create_location
lookup_location
retrieve_certificate
store_certificate

if [[ "$OSTYPE" == "darwin"* ]]; then
OURIP="$(ipconfig getifaddr en0)"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
OURIP="$(hostname -I)"
fi

sed "s/grpcClientKeystorePassword: \"\"/grpcClientKeystorePassword: \"${CERTIFICATE_PASSWORD}\"/g" ../../lokahi-minion/values.yaml > ../tmp/minion.yaml
sed "s/customCertificateAuthority: false/customCertificateAuthority: true/g" ../tmp/minion.yaml > ../tmp/minion2.yaml
sed 's/customHostAliases: \[\]/customHostAliases: \
      - ip: "OURIP" \
        hostnames: \
        - "minion.onmshs"/g' ../tmp/minion2.yaml >../tmp/minion.yaml
sed "s/OURIP/${OURIP}/g" ../tmp/minion.yaml > ../tmp/minion2.yaml
mv ../tmp/minion2.yaml ../tmp/minion.yaml

mv ../tmp/ca.crt ../../lokahi-minion/certs/ca.crt
mv ../tmp/minion1.p12 ../../lokahi-minion/certs/minion1.p12