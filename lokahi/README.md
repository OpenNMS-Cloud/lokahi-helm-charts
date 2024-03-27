# Lokahi Helm Chart
Installs Lokahi on a local environment

## Requirements
* Kubectl
* Helm3
* OpenSSL

## Tested platforms
| Platform    | Supported   | Tested Version     |
| ----------- | ----------- | ----------- |
| Kubernetes  | [x]       | 1.29.1     |
| OpenShift   | [ ]        | N/A     |

## Installing the Chart
### Step 1: Generating self signed certificates for Lokahi and Minion
```
$ cd support-scripts
$ export DOMAIN="onmshs"
$ ./load-or-generate-secret.sh "opennms-ca" "root-ca-certificate" "tmp/ca.key" "tmp/ca.crt"
$ ./generate-and-sign-certificate.sh "minion.$DOMAIN" "opennms-minion-gateway-certificate" "tmp/ca.key" "tmp/ca.crt" 
$ ./generate-and-sign-certificate.sh "$DOMAIN" "opennms-ui-certificate" "tmp/ca.key" "tmp/ca.crt"
$ ./load-or-generate-secret.sh "client-ca" "client-root-ca-certificate" "tmp/client-ca.key" "tmp/client-ca.crt" 
```

#### Alternate: Using existing Certification
```
.... TODO ....
```


### Step 2: Install Ingress Nginx and Certificate Manager
```
$ export MYVALUES2="examples/ingress-nginx-values.yaml"
$ helm install ingress-nginx ingress-nginx-repo/ingress-nginx --version=4.7.0 --values="${MYVALUES2}" --timeout=60s --set allowSnippetAnnotations=true
$ helm install cert-manager jetstack/cert-manager --set installCRDs=true --set cainjector.extraArgs={--leader-elect=false} 
```

### Step 3: Install dependencies
```
$
$ export ValuesFile=examples/lokahi-values.yaml
$ cd charts/dependencies
$ helm install citus . -f "${ValuesFile}" --wait
$ cd ../cortex 
$ helm install cortex . -f "${ValuesFile}" --wait
$ cd ../grafana
$ helm install grafana . -f "${ValuesFile}"  --wait
$ cd ../kafka
$ helm install kafka . -f "${ValuesFile}"  --wait
$ cd ../keycloak
$ helm install keycloak . -f "${ValuesFile}"  --wait
$ cd ../prometheus
$ helm install prometheus . -f "${ValuesFile}"  --wait
```

### Step 4: Install Lokahi
```
$ export ValuesFile=examples/lokahi-values.yaml
$ cd charts/lokahi
$ helm install lokahi . -f "${ValuesFile}" --wait
```