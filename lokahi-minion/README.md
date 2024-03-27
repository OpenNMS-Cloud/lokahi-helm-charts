# Lokahi Minion Helm Chart
Installs Lokahi Minion on a local environment

## Requirements
* Kubectl
* Helm3

## Tested platforms
| Platform    | Supported   | Tested Version     |
| ----------- | ----------- | ----------- |
| Kubernetes  | [x]       | 1.29.1     |
| OpenShift   | [ ]        | N/A     |

## Installing the Chart
### Step 1: Setting up Certificates
```
$ cd lokahi-minion
$ mkdir certs
# Download the Minion bundle from Lokahi 
$ unzip -p minion-default.zip storage/minion1-default.p12 > certs/minion1.p12
# view the GRPC_CLIENT_KEYSTORE_PASSWORD; Copy the value into grpcClientKeystorePassword into value.yaml file
$ unzip -p minion-default.zip docker-compose.yaml |grep "GRPC_CLIENT_KEYSTORE_PASSWORD"
# if using self-sign authority, extract CA Certificate from the kubernetes server
$ kubectl get secret root-ca-certificate -ogo-template='{{index .data "ca.crt" }}' | base64 --decode > certs/ca.crt
```
### Step 2: Install the Helm Chart
```
$ cd lokahi-minion
$ helm install lokahi-minion . -f examples/lokahi-minion-values.yaml --wait
```
