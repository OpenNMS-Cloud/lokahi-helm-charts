#!/bin/bash

SECONDS=0
EXECTIME="$(date +%Y%m%d_%H%M%S)"

if [ "$#" -ne 4 ]; then
echo "Illegal number of parameters"
fi


DOMAIN="$1"; shift
PORT="$1"; shift
NAMESPACE="$1"; shift
LOGFILE="$1"; shift
LOKAHIMINIONVALUEFILE="$(pwd)/../tmp/minion.yaml"


msg(){
    echo "$1" | tee -a  "${LOGFILE}" 2>&1
}

msg "Lokahi Minion Installation Script" 
msg "EXECTIME: ${EXECTIME}"
msg "DOMAIN: ${DOMAIN}"
msg "PORT:   ${PORT}"
msg "NAMESPACE: ${NAMESPACE}"
msg "LOKAHI MINION VALUE FILE: ${LOKAHIMINIONVALUEFILE}"
msg "LOGFILE: ${LOGFILE}"

if [ "$NAMESPACE" != "default" ]; then
 if [ "$(kubectl get namespace  --no-headers -o custom-columns=":metadata.name" | grep "^$NAMESPACE")" != "$NAMESPACE" ]; then
  msg "Creating ${NAMESPACE} namespace"
  kubectl create namespace "${NAMESPACE}"
 fi
fi

msg "Installing Lokahi Minion" 
helm install lokahi-minion ../../lokahi-minion/ -f "${LOKAHIMINIONVALUEFILE}" --namespace "${NAMESPACE}" --timeout 600s --wait >> "${LOGFILE}" 2>&1
return_code=$?

kubectl wait --for=condition=ready "$(kubectl get pods -o name --no-headers=true |grep "lokahi-minion")" >> "${LOGFILE}" 2>&1

rm "${LOKAHIMINIONVALUEFILE}"
rm "../../lokahi-minion/certs/ca.crt"
rm "../../lokahi-minion/certs/minion.p12"

DURATION=$SECONDS
msg "It took $((DURATION / 60)) minutes and $((DURATION % 60)) seconds to install Lokahi minion Helm Chart" 
exit $return_code
