# Keycloak

![Version: 0.9.1](https://img.shields.io/badge/Version-0.9.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.9.1](https://img.shields.io/badge/AppVersion-v0.9.1-informational?style=flat-square)

Keycloak for Lokahi

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| OpenNMS.global.enableJsonLogging | bool | `false` |  |
| OpenNMS.global.image.repository | string | `"opennms"` |  |
| OpenNMS.global.image.tag | string | `"latest"` |  |
| OpenNMS.global.openTelemetry.env.OTEL_PROPAGATORS | string | `"tracecontext,baggage,jaeger"` |  |
| OpenNMS.global.openTelemetry.otlpTracesEndpoint | string | `nil` |  |
| citus.adminPassword | string | `""` |  |
| citus.adminUser | string | `"desenv"` |  |
| citus.enabled | bool | `false` |  |
| hostname | string | `"onmshs"` |  |
| kafka.enabled | bool | `true` |  |
| kafka.serviceName | string | `"onms-kafka"` |  |
| keycloak.adminPassword | string | `""` |  |
| keycloak.adminUsername | string | `"admin"` |  |
| keycloak.configmapName | string | `"keycloak-realm-configmap"` |  |
| keycloak.databaseHost | string | `"postgres"` |  |
| keycloak.databaseName | string | `"desenv"` |  |
| keycloak.databaseSchemaName | string | `"keycloak"` |  |
| keycloak.dynamicRealmConfig | bool | `true` |  |
| keycloak.environment | object | `{}` |  |
| keycloak.hostnameAdminUrl | string | `nil` |  |
| keycloak.hostnamePort | string | `nil` |  |
| keycloak.httpsPort | int | `8443` |  |
| keycloak.imagePullPolicy | string | `"IfNotPresent"` |  |
| keycloak.imageShortName | string | `"lokahi-keycloak"` |  |
| keycloak.path | string | `"/auth"` |  |
| keycloak.port | int | `8080` |  |
| keycloak.privateRepoEnabled | bool | `false` |  |
| keycloak.realmName | string | `"opennms"` |  |
| keycloak.replicas | int | `1` |  |
| keycloak.resources.limits.cpu | string | `"1"` |  |
| keycloak.resources.limits.memory | string | `"2Gi"` |  |
| keycloak.resources.requests.cpu | string | `"1"` |  |
| keycloak.resources.requests.memory | string | `"1Gi"` |  |
| keycloak.serviceName | string | `"onms-keycloak"` |  |
| keycloak.tlsSecretName | string | `nil` |  |
| nodeRestrictions.enabled | bool | `false` |  |
| nodeRestrictions.key | string | `"kubernetes.azure.com/scalesetpriority"` |  |
| nodeRestrictions.value | string | `"spot"` |  |
| port | int | `443` |  |
| protocol | string | `"https"` |  |
| tls.certificateGeneration | bool | `false` |  |
| tls.enabled | bool | `true` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.3](https://github.com/norwoodj/helm-docs/releases/v1.11.3)