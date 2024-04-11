#!/bin/bash
# Expected to be executed from `support-scripts/infrastructure` folder
# This script helps with bringing up an instance of Lokahi and Lokahi Minion

SECONDS=0
export DURATION=0
EXECTIME="$(date +%Y%m%d_%H%M%S)"

LOGFILE="$(pwd)/../logs/${EXECTIME}.log"

# Common properties
export DOMAIN="lokahi.com"
export PORT=443
export NAMESPACE="lokahi"
export MINION_NAMESPACE="${NAMESPACE}"
export CLUSTERTYPE="Kubernetes" #Kubernetes,set value to Kind, when running on kind cluster

command -v helm    >/dev/null 2>&1 || { echo >&2 "helm is required but it's not installed. Aborting."; exit 1; }
command -v kubectl >/dev/null 2>&1 || { echo >&2 "kubectl is required but it's not installed. Aborting."; exit 1; }
command -v openssl >/dev/null 2>&1 || { echo >&2 "openssl is required but it's not installed. Aborting."; exit 1; }


HELMCheckInstalledCharts(){
helm status "$1" 1>/dev/null 2>&1 && echo "Found" || echo "Not Found"
}

if [ ! -d "../logs" ]; then
mkdir ../logs
fi

if grep -q "${DOMAIN}" /etc/hosts; then
    echo >&2 "Found ${DOMAIN} in /etc/hosts";
else
 echo >&2 "Unable to find ${DOMAIN} in /etc/hosts"; exit 1;
fi

declare -a HelmReleaseName=("cert-manager" "citus" "cortex" "grafana" "ingress-nginx" "kafka" "keycloak" "lokahi" "prometheus" "tempo") #mail-server

for i in "${HelmReleaseName[@]}"
do
 if [ "$(HELMCheckInstalledCharts "$i")" == "Found" ]; then
  echo "We found \"${i}\" release, expected a clean environment! Exiting..."
  exit 1
 fi
done

if [ ! -d "../tmp" ]; then
mkdir ../tmp
fi

./install_lokahi.sh "${DOMAIN}" "${PORT}" "${NAMESPACE}" "${LOGFILE}" "${CLUSTERTYPE}"
return_code=$?
if [ $return_code -ne 0 ]; then
 echo "An error while running install_lokahi.sh"
 exit $return_code
fi
echo " " >> "${LOGFILE}" 2>&1
echo "<<------>>" >> "${LOGFILE}" 2>&1
echo " " >> "${LOGFILE}" 2>&1

if [ ! -d "../tmp" ]; then
mkdir ../tmp
fi

kubectl wait --for=condition=ready "$(kubectl get pods -o name --no-headers=true |grep "opennms-ui")" >> "${LOGFILE}" 2>&1
kubectl wait --for=condition=ready "$(kubectl get pods -o name --no-headers=true |grep "onms-keycloak")" >> "${LOGFILE}" 2>&1
sleep 10
until curl -k -s -f -o /dev/null "https://${DOMAIN}"
do
  sleep 10
done

./generate_location.sh "${NAMESPACE}"  "${DOMAIN}"
return_code=$?
if [ $return_code -ne 0 ]; then
 echo "An error while running generate_location.sh"
 exit $return_code
fi

./install_lokahi_minion.sh "${DOMAIN}" "${PORT}" "${MINION_NAMESPACE}" "${LOGFILE}"

echo " " >> "${LOGFILE}" 2>&1
echo "<<------>>" >> "${LOGFILE}" 2>&1
echo " " >> "${LOGFILE}" 2>&1

DURATION=$SECONDS
echo "It took $((DURATION / 60)) minutes and $((DURATION % 60)) seconds to setup and deploy Lokahi and a minion."  | tee -a "${LOGFILE}"

echo " "  | tee -a "${LOGFILE}"

tmp_test=$(kubectl get pods -n "${NAMESPACE}" -o jsonpath='{range .items[*]}{@.status.containerStatuses[?(@.restartCount>0)].name}{" "}{end}' |wc -w)

if [ "$tmp_test" -gt "0" ]; then
echo "The following pods have restarted multiple times"  | tee -a "${LOGFILE}"
tmp_data=$(kubectl get pods -n "${NAMESPACE}" -o jsonpath='{range .items[*]}{@.status.containerStatuses[?(@.restartCount>0)].name}{" "}{end}' | awk '{$1=$1};1')
tmp_data2=($(echo "$tmp_data"))
for i in "${tmp_data2[@]}"
do
echo "* ${i}" | tee -a "${LOGFILE}"
done
fi

if [ -d "../tmp" ]; then
rm -r ../tmp
fi
