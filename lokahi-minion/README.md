# lokahi-minion

![Version: 1.0.1](https://img.shields.io/badge/Version-1.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.0.60](https://img.shields.io/badge/AppVersion-v0.0.60-informational?style=flat-square)

A Helm chart for running OpenNMS Lokahi minion in Kubernetes

**Homepage:** <https://github.com/OpenNMS-Cloud/lokahi>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| The OpenNMS Group Inc. |  | <https://www.opennms.com> |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| customCertificateAuthority | bool | `false` |  |
| customHostAliases | list | `[]` |  |
| debug.enabled | bool | `false` |  |
| debug.java.javaAgentPath | string | `"agent/opentelemetry-javaagent.jar"` |  |
| debug.java.preferIPv4Stack | bool | `true` |  |
| debug.port | int | `5005` |  |
| debug.quiet | bool | `true` |  |
| debug.server | bool | `true` |  |
| debug.suspend | bool | `true` |  |
| debug.transport | string | `"dt_socket"` |  |
| extraInitContainers | list | `[]` |  |
| extraMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| gatewayHost | string | `""` |  |
| global.hostname | string | `"onmshs"` |  |
| global.image.repository | string | `"opennms"` |  |
| global.image.tag | string | `"v0.0.60"` |  |
| global.openTelemetry.env.OTEL_PROPAGATORS | string | `"tracecontext,baggage,jaeger"` |  |
| global.openTelemetry.otlpTracesEndpoint | string | `nil` |  |
| global.port | int | `443` |  |
| global.protocol | string | `"https"` |  |
| grpcClientKeystorePassword | string | `""` |  |
| id | string | `""` |  |
| imagePullPolicy | string | `"IfNotPresent"` |  |
| imageShortName | string | `"lokahi-minion"` |  |
| logLevel | string | `""` |  |
| minionAppSecrets | string | `""` |  |
| netflow5ListenerPort | int | `8877` |  |
| netflow9ListenerPort | int | `4729` |  |
| netflowListenerPort | int | `9999` |  |
| nodeRestrictions.enabled | bool | `false` |  |
| nodeRestrictions.key | string | `"kubernetes.azure.com/scalesetpriority"` |  |
| nodeRestrictions.value | string | `"spot"` |  |
| port | int | `8181` |  |
| replicas | int | `1` |  |
| resources.limits.cpu | string | `"2"` |  |
| resources.limits.memory | string | `"1Gi"` |  |
| resources.requests.cpu | string | `"1"` |  |
| resources.requests.memory | string | `"1Gi"` |  |
| serviceName | string | `"opennms-minion"` |  |
| sshPort | int | `8101` |  |
| trapsListenerPort | int | `1162` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.3](https://github.com/norwoodj/helm-docs/releases/v1.11.3)
