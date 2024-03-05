#!/bin/bash

SECONDS=0
EXECTIME="$(date +%Y%m%d_%H%M%S)"

DOMAIN="$1"; shift
PORT="$1"; shift
NAMESPACE="$1"; shift
LOGFILE="$1"; shift
LOKAHIVALUEFILE="../../examples/lokahi-values.yaml"
INGRESSVALUEFILE="../../examples/ingress-nginx-values.yaml"

msg(){
    echo "$1" | tee -a  "${LOGFILE}" 2>&1
}

msg "Lokahi Installation Script" 
msg "EXECTIME: ${EXECTIME}"
msg "DOMAIN: ${DOMAIN}"
msg "PORT:   ${PORT}"
msg "NAMESPACE: ${NAMESPACE}"
msg "LOKAHI VALUE FILE: ${LOKAHIVALUEFILE}"
msg "INGRESS VALUE FILE: ${INGRESSVALUEFILE}"
msg "LOGFILE: ${LOGFILE}"

msg "Create ${NAMESPACE}...N/A"
#kubectl create namespace lokahi

msg "Setting up certificates"
cd ../../support-scripts || exit
mkdir tmp
./load-or-generate-secret.sh "opennms-ca" "root-ca-certificate" "tmp/server-ca.key" "tmp/server-ca.crt" -n "$NAMESPACE" >> "${LOGFILE}" 2>&1
./generate-and-sign-certificate.sh "minion.$DOMAIN" "opennms-minion-gateway-certificate" "tmp/server-ca.key" "tmp/server-ca.crt" -n "$NAMESPACE" >> "${LOGFILE}" 2>&1
./generate-and-sign-certificate.sh "$DOMAIN" "opennms-ui-certificate" "tmp/server-ca.key" "tmp/server-ca.crt" -n "$NAMESPACE" >> "${LOGFILE}" 2>&1
./load-or-generate-secret.sh "client-ca" "client-root-ca-certificate" "tmp/client-ca.key" "tmp/client-ca.crt" -n "$NAMESPACE" >> "${LOGFILE}" 2>&1
rm -r tmp
cd - >> "${LOGFILE}" 2>&1 || exit

msg "Setting up Ingress Nginx and Cert-manager"
helm install ingress-nginx ingress-nginx-repo/ingress-nginx --version=4.7.0 --values="${INGRESSVALUEFILE}" --timeout=60s --set allowSnippetAnnotations=true >> "${LOGFILE}" 2>&1
helm install cert-manager jetstack/cert-manager --set installCRDs=true --set cainjector.extraArgs={--leader-elect=false} --namespace "${NAMESPACE}" >> "${LOGFILE}" 2>&1

msg "Waiting for ingress-nginx-controller pod to be ready"
kubectl wait --for=condition=ready "$(kubectl get pods -o name --no-headers=true |grep "ingress-nginx-controller")" >> "${LOGFILE}" 2>&1

msg "Installing Dependencies" 
msg " Tempo" 
helm install tempo tempo/tempo --set tempo.metricsGenerator.enabled=True --set tempo.metricsGenerator.remoteWriteUrl=http://prometheus:9090/prometheus/api/v1/write  --namespace "${NAMESPACE}" >> "${LOGFILE}" 2>&1
msg " Citus" 
helm install citus ../../dependencies/citus -f "${LOKAHIVALUEFILE}" --namespace "${NAMESPACE}" --wait >> "${LOGFILE}" 2>&1
msg " Cortex" 
helm install cortex ../../dependencies/cortex -f "${LOKAHIVALUEFILE}" --namespace "${NAMESPACE}" --wait >> "${LOGFILE}" 2>&1
msg " Grafana" 
helm install grafana ../../dependencies/grafana -f "${LOKAHIVALUEFILE}" --namespace "${NAMESPACE}" --wait >> "${LOGFILE}" 2>&1
msg " Kafka" 
helm install kafka ../../dependencies/kafka -f "${LOKAHIVALUEFILE}" --namespace "${NAMESPACE}" --wait >> "${LOGFILE}" 2>&1
msg " Keycloak" 
helm install keycloak ../../dependencies/keycloak -f "${LOKAHIVALUEFILE}" --namespace "${NAMESPACE}" --wait >> "${LOGFILE}" 2>&1
msg " Prometheus" 
helm install prometheus ../../dependencies/prometheus  -f "${LOKAHIVALUEFILE}" --namespace "${NAMESPACE}" --wait >> "${LOGFILE}" 2>&1
msg "Installing Lokahi" 
helm install lokahi ../../lokahi -f "${LOKAHIVALUEFILE}" --namespace "${NAMESPACE}"  --wait >> "${LOGFILE}" 2>&1

DURATION=$SECONDS
msg "It took $((DURATION / 60)) minutes and $((DURATION % 60)) seconds to install Lokahi Helm Chart"