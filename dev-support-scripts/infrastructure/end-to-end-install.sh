#!/bin/bash
# Expected to be executed from `dev-support-scripts/infrastructure` folder
# Installs Lokahi
# Installs Lokahi Minion

SECONDS=0
export DURATION=0
EXECTIME="$(date +%Y%m%d_%H%M%S)"

LOGFILE="$(pwd)/../logs/${EXECTIME}.log"

# Common properties
export DOMAIN="onmshs"
export PORT=443
export NAMESPACE="default"

command -v helm    >/dev/null 2>&1 || { echo >&2 "helm is required but it's not installed. Aborting."; exit 1; }
command -v kubectl >/dev/null 2>&1 || { echo >&2 "kubectl is required but it's not installed. Aborting."; exit 1; }
command -v openssl >/dev/null 2>&1 || { echo >&2 "openssl is required but it's not installed. Aborting."; exit 1; }

HELMCheckInstalledCharts(){
helm status "$1" 1>/dev/null 2>&1 && echo "Found" || echo "Not Found"
}

if [ ! -d "../logs" ]; then
mkdir ../logs
fi

if [ ! "$(grep "$DOMAIN" /etc/hosts)" ]; then
  echo "Unable to find ${DOMAIN} in /etc/hosts! Exiting..."
  exit 1
fi

declare -a HelmReleaseName=("cert-manager" "citus" "cortex" "grafana" "ingress-nginx" "kafka" "keycloak" "lokahi" "prometheus" "tempo") #mail-server

for i in "${HelmReleaseName[@]}"
do
 if [ "$(HELMCheckInstalledCharts "$i")" == "Found" ]; then
  echo "We found \"$i\" release, expected a clean environment! Exiting..."
  exit 1
 fi
done

./install_lokahi.sh "${DOMAIN}" "${PORT}" "${NAMESPACE}" "${LOGFILE}"
echo " " >> "${LOGFILE}" 2>&1
echo "<<------>>" >> "${LOGFILE}" 2>&1
echo " " >> "${LOGFILE}" 2>&1

if [ ! -d "../tmp" ]; then
mkdir ../tmp
fi

./generate_location.sh
./install_lokahi_minion.sh "${DOMAIN}" "${PORT}" "${NAMESPACE}" "${LOGFILE}"

echo " " >> "${LOGFILE}" 2>&1
echo "<<------>>" >> "${LOGFILE}" 2>&1
echo " " >> "${LOGFILE}" 2>&1

#rm ../tmp/minion.yaml
rm ../tmp/ca.crt

DURATION=$SECONDS
echo "It took $((DURATION / 60)) minutes and $((DURATION % 60)) seconds to setup and deploy Lokahi and a minion."  | tee -a "${LOGFILE}"