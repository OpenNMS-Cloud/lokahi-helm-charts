

## Steps to run
### Dependency
```
```
### Install
```
helm install cortex .   -n lokahi
```
### Uninstall
```
helm uninstall cortex -n lokahi
```
## Steps to run Minio Dependency
```
helm install --set rootUser=minio,rootPassword=minio123 --set operator.minio.tls=false  minio  minio/operator
```
```
helm install minio-tenant minio/tenant
```