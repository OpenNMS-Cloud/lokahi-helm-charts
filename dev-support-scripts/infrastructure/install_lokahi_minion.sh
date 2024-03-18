#!/bin/bash

SECONDS=0
EXECTIME="$(date +%Y%m%d_%H%M%S)"

DOMAIN="$1"; shift
PORT="$1"; shift
NAMESPACE="$1"; shift
LOGFILE="$1"; shift
LOKAHIMINIONVALUEFILE="$(pwd)/../tmp/minion.yaml"

#LOGFILE="$(pwd)/logs/${EXECTIME}.log" 

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

msg "Create ${NAMESPACE}...N/A"
#kubectl create namespace lokahi


msg "Installing Lokahi Minion" 
# TODO: --namespace "${NAMESPACE}"
helm install lokahi-minion ../../lokahi-minion/ -f "${LOKAHIMINIONVALUEFILE}" --timeout 600s --wait >> "${LOGFILE}" 2>&1
return_code=$?

kubectl wait --for=condition=ready "$(kubectl get pods -o name --no-headers=true |grep "lokahi-minion")" >> "${LOGFILE}" 2>&1


DURATION=$SECONDS
msg "It took $((DURATION / 60)) minutes and $((DURATION % 60)) seconds to install Lokahi minion Helm Chart" 
exit $return_code