#!/bin/bash

SECONDS=0
EXECTIME="$(date +%Y%m%d_%H%M%S)"


if [ "$#" -ne 5 ]; then
echo "Illegal number of parameters"
fi

DOMAIN="$1"; shift
PORT="$1"; shift
NAMESPACE="$1"; shift
LOGFILE="$1"; shift
CLUSTERENVIRONMENT="$1"; shift
LOKAHIVALUEFILE="../../examples/lokahi-values.yaml"
INGRESSVALUEFILE="../../examples/ingress-nginx-values.yaml"


sed "s/  hostname: onmshs/  hostname: $DOMAIN/g" ${LOKAHIVALUEFILE} > ../tmp/lokahi.yaml
LOKAHIVALUEFILE="../tmp/lokahi.yaml"


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
msg "Environment: ${CLUSTERENVIRONMENT}"

if [ "$NAMESPACE" != "default" ]; then
 msg "Creating ${NAMESPACE} namespace"
 kubectl create namespace "${NAMESPACE}"
fi

if [ "$CLUSTERENVIRONMENT" == "kind" ] || [ "$CLUSTERENVIRONMENT" == "Kind" ]; then
 INGRESS_ADDITIONAL_OPTIONS="--set controller.hostPort.enabled=true --set controller.service.type=ClusterIP"
else
 INGRESS_ADDITIONAL_OPTIONS=""
fi

msg "Setting up certificates"
cd ../../support-scripts || exit
mkdir tmp
./load-or-generate-secret.sh "opennms-ca" "root-ca-certificate" "tmp/server-ca.key" "tmp/server-ca.crt" -n "$NAMESPACE" >> "${LOGFILE}" 2>&1
./generate-and-sign-certificate.sh "minion.$DOMAIN" "opennms-minion-gateway-certificate" "tmp/server-ca.key" "tmp/server-ca.crt" -n "$NAMESPACE" >> "${LOGFILE}" 2>&1
./generate-and-sign-certificate.sh "$DOMAIN" "opennms-ui-certificate" "tmp/server-ca.key" "tmp/server-ca.crt" -n "$NAMESPACE" >> "${LOGFILE}" 2>&1
./load-or-generate-secret.sh "client-ca" "client-root-ca-certificate" "tmp/client-ca.key" "tmp/client-ca.crt" -n "$NAMESPACE" >> "${LOGFILE}" 2>&1
#rm -r tmp
cd - >> "${LOGFILE}" 2>&1 || exit

msg "Setting up Ingress Nginx and Cert-manager"
helm install ingress-nginx ingress-nginx-repo/ingress-nginx --version=4.7.0 --values="${INGRESSVALUEFILE}" --timeout=60s --set allowSnippetAnnotations=true  ${INGRESS_ADDITIONAL_OPTIONS}   >> "${LOGFILE}" 2>&1
helm install cert-manager jetstack/cert-manager --set installCRDs=true --set cainjector.extraArgs={--leader-elect=false} --namespace "${NAMESPACE}" >> "${LOGFILE}" 2>&1

msg "Waiting for ingress-nginx-controller pod to be ready"
kubectl wait --for=condition=ready "$(kubectl get pods -o name --no-headers=true |grep "ingress-nginx-controller")" >> "${LOGFILE}" 2>&1

msg "Installing Dependencies" 
msg " Tempo" 
helm install tempo tempo/tempo --set tempo.metricsGenerator.enabled=True --set tempo.metricsGenerator.remoteWriteUrl=http://prometheus:9090/prometheus/api/v1/write  --namespace "${NAMESPACE}" >> "${LOGFILE}" 2>&1
cd ../../lokahi >> "${LOGFILE}" 2>&1 || exit 1
rm Chart.lock >> "${LOGFILE}" 2>&1
helm dependency build >> "${LOGFILE}" 2>&1
cd - >> "${LOGFILE}" 2>&1 || exit 1
msg "Installing Lokahi" 
helm install lokahi ../../lokahi -f "${LOKAHIVALUEFILE}" --namespace "${NAMESPACE}" --timeout 1200s --wait >> "${LOGFILE}" 2>&1
return_code=$?
DURATION=$SECONDS
msg "It took $((DURATION / 60)) minutes and $((DURATION % 60)) seconds to install Lokahi Helm Chart"
exit $return_code