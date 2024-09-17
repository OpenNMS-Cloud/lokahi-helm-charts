# lokahi

![Version: 1.0.2](https://img.shields.io/badge/Version-1.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.0.61](https://img.shields.io/badge/AppVersion-v0.0.61-informational?style=flat-square)

A Helm chart for running OpenNMS Lokahi in Kubernetes

**Homepage:** <https://github.com/OpenNMS-Cloud/lokahi>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| The OpenNMS Group Inc. |  | <https://www.opennms.com> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../dependencies/citus | Citus | 12.1-alpine |
| file://../dependencies/cortex | Cortex | 1.14.0 |
| file://../dependencies/grafana | Grafana | 0.0.60 |
| file://../dependencies/kafka | Kafka | 3.3.2 |
| file://../dependencies/keycloak | Keycloak | 0.0.60 |
| file://../dependencies/prometheus | Prometheus | 2.39.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| Citus.adminPassword | string | `"notset"` |  |
| Citus.adminUser | string | `"desenv"` |  |
| Citus.enabled | bool | `true` |  |
| Cortex.enabled | bool | `true` |  |
| Cortex.minio.serviceName | string | `"minio"` |  |
| Cortex.minio.enabled | bool | `false` |  |
| Cortex.minio.password | string | `"minio123"` |  |
| Cortex.minio.username | string | `"minio"` |  |
| Grafana.enabled | bool | `true` |  |
| Grafana.imageShortName | string | `"lokahi-grafana"` |  |
| Grafana.path | string | `"/grafana"` |  |
| Grafana.port | int | `3000` |  |
| Grafana.serviceName | string | `"grafana"` |  |
| Kafka.enabled | bool | `true` |  |
| Keycloak.adminPassword | string | `"notset"` |  |
| Keycloak.adminUsername | string | `"admin"` |  |
| Keycloak.enabled | bool | `true` |  |
| Keycloak.httpsPort | int | `8443` |  |
| Keycloak.imageShortName | string | `"lokahi-keycloak"` |  |
| Keycloak.path | string | `"/auth"` |  |
| Keycloak.port | int | `8080` |  |
| Keycloak.realmName | string | `"opennms"` |  |
| Keycloak.serviceName | string | `"onms-keycloak"` |  |
| OpenNMS.alert.databaseHost | string | `"postgres"` |  |
| OpenNMS.alert.databaseName | string | `"desenv"` |  |
| OpenNMS.alert.databaseSchemaName | string | `"alert"` |  |
| OpenNMS.alert.debug.enabled | bool | `false` |  |
| OpenNMS.alert.debug.java.javaAgentPath | string | `"agent/opentelemetry-javaagent.jar"` |  |
| OpenNMS.alert.debug.java.preferIPv4Stack | bool | `false` |  |
| OpenNMS.alert.debug.port | int | `5005` |  |
| OpenNMS.alert.debug.quiet | bool | `true` |  |
| OpenNMS.alert.debug.server | bool | `true` |  |
| OpenNMS.alert.debug.suspend | bool | `true` |  |
| OpenNMS.alert.debug.transport | string | `"dt_socket"` |  |
| OpenNMS.alert.imagePullPolicy | string | `"IfNotPresent"` |  |
| OpenNMS.alert.imageShortName | string | `"lokahi-alert"` |  |
| OpenNMS.alert.kafkaSecretName | string | `nil` |  |
| OpenNMS.alert.privateRepoEnabled | bool | `false` |  |
| OpenNMS.alert.replicas | int | `1` |  |
| OpenNMS.alert.resources.limits.cpu | string | `"2"` |  |
| OpenNMS.alert.resources.limits.memory | string | `"4Gi"` |  |
| OpenNMS.alert.resources.requests.cpu | string | `"1"` |  |
| OpenNMS.alert.resources.requests.memory | string | `"2Gi"` |  |
| OpenNMS.alert.serviceName | string | `"opennms-alert"` |  |
| OpenNMS.api.certificateManagerUrl | string | `""` |  |
| OpenNMS.api.debug.enabled | bool | `false` |  |
| OpenNMS.api.debug.java.javaAgentPath | string | `"agent/opentelemetry-javaagent.jar"` |  |
| OpenNMS.api.debug.java.preferIPv4Stack | bool | `false` |  |
| OpenNMS.api.debug.port | int | `5005` |  |
| OpenNMS.api.debug.quiet | bool | `true` |  |
| OpenNMS.api.debug.server | bool | `true` |  |
| OpenNMS.api.debug.suspend | bool | `true` |  |
| OpenNMS.api.debug.transport | string | `"dt_socket"` |  |
| OpenNMS.api.flowsTlsEnabled | bool | `false` |  |
| OpenNMS.api.flowsUrl | string | `"SOME-EXTERNAL-FLOW-SERVER:80"` |  |
| OpenNMS.api.imagePullPolicy | string | `"IfNotPresent"` |  |
| OpenNMS.api.imageShortName | string | `"lokahi-rest-server"` |  |
| OpenNMS.api.introspectionEnabled | bool | `false` |  |
| OpenNMS.api.maxAliasOccurrence | int | `5` |  |
| OpenNMS.api.maxComplexity | int | `60` |  |
| OpenNMS.api.maxDirectiveOccurrence | int | `5` |  |
| OpenNMS.api.maxFieldOccurrence | int | `5` |  |
| OpenNMS.api.maxQueryDepth | int | `5` |  |
| OpenNMS.api.minionEndpoint | string | `"host.docker.internal"` |  |
| OpenNMS.api.packagedminionFile | string | `"run-minion-docker-compose.yaml"` |  |
| OpenNMS.api.path | string | `"/api"` |  |
| OpenNMS.api.playgroundGuiEnabled | bool | `false` |  |
| OpenNMS.api.privateRepoEnabled | bool | `false` |  |
| OpenNMS.api.replicas | int | `1` |  |
| OpenNMS.api.resources.limits.cpu | string | `"1"` |  |
| OpenNMS.api.resources.limits.memory | string | `"2Gi"` |  |
| OpenNMS.api.resources.requests.cpu | string | `"1"` |  |
| OpenNMS.api.resources.requests.memory | string | `"2Gi"` |  |
| OpenNMS.api.serviceName | string | `"opennms-rest-server"` |  |
| OpenNMS.dataChoices.databaseHost | string | `"postgres"` |  |
| OpenNMS.dataChoices.databaseName | string | `"desenv"` |  |
| OpenNMS.dataChoices.databaseSchemaName | string | `"datachoices"` |  |
| OpenNMS.dataChoices.debug.enabled | bool | `false` |  |
| OpenNMS.dataChoices.debug.java.javaAgentPath | string | `"agent/opentelemetry-javaagent.jar"` |  |
| OpenNMS.dataChoices.debug.java.preferIPv4Stack | bool | `false` |  |
| OpenNMS.dataChoices.debug.port | int | `5005` |  |
| OpenNMS.dataChoices.debug.quiet | bool | `true` |  |
| OpenNMS.dataChoices.debug.server | bool | `true` |  |
| OpenNMS.dataChoices.debug.suspend | bool | `true` |  |
| OpenNMS.dataChoices.debug.transport | string | `"dt_socket"` |  |
| OpenNMS.dataChoices.imagePullPolicy | string | `"IfNotPresent"` |  |
| OpenNMS.dataChoices.imageShortName | string | `"lokahi-datachoices"` |  |
| OpenNMS.dataChoices.privateRepoEnabled | bool | `false` |  |
| OpenNMS.dataChoices.replicas | int | `1` |  |
| OpenNMS.dataChoices.resources.limits.cpu | string | `"1"` |  |
| OpenNMS.dataChoices.resources.limits.memory | string | `"1Gi"` |  |
| OpenNMS.dataChoices.resources.requests.cpu | string | `"1"` |  |
| OpenNMS.dataChoices.resources.requests.memory | string | `"1Gi"` |  |
| OpenNMS.dataChoices.serviceName | string | `"opennms-datachoices"` |  |
| OpenNMS.events.databaseHost | string | `"postgres"` |  |
| OpenNMS.events.databaseName | string | `"desenv"` |  |
| OpenNMS.events.databaseSchemaName | string | `"events"` |  |
| OpenNMS.events.debug.enabled | bool | `false` |  |
| OpenNMS.events.debug.java.javaAgentPath | string | `"agent/opentelemetry-javaagent.jar"` |  |
| OpenNMS.events.debug.java.preferIPv4Stack | bool | `false` |  |
| OpenNMS.events.debug.port | int | `5005` |  |
| OpenNMS.events.debug.quiet | bool | `true` |  |
| OpenNMS.events.debug.server | bool | `true` |  |
| OpenNMS.events.debug.suspend | bool | `true` |  |
| OpenNMS.events.debug.transport | string | `"dt_socket"` |  |
| OpenNMS.events.imagePullPolicy | string | `"IfNotPresent"` |  |
| OpenNMS.events.imageShortName | string | `"lokahi-events"` |  |
| OpenNMS.events.privateRepoEnabled | bool | `false` |  |
| OpenNMS.events.replicas | int | `1` |  |
| OpenNMS.events.resources.limits.cpu | string | `"2"` |  |
| OpenNMS.events.resources.limits.memory | string | `"4Gi"` |  |
| OpenNMS.events.resources.requests.cpu | string | `"1"` |  |
| OpenNMS.events.resources.requests.memory | string | `"2Gi"` |  |
| OpenNMS.events.serviceName | string | `"opennms-events"` |  |
| OpenNMS.inventory.databaseHost | string | `"postgres"` |  |
| OpenNMS.inventory.databaseName | string | `"desenv"` |  |
| OpenNMS.inventory.databaseSchemaName | string | `"inventory"` |  |
| OpenNMS.inventory.debug.enabled | bool | `false` |  |
| OpenNMS.inventory.debug.java.javaAgentPath | string | `"agent/opentelemetry-javaagent.jar"` |  |
| OpenNMS.inventory.debug.java.preferIPv4Stack | bool | `false` |  |
| OpenNMS.inventory.debug.port | int | `5005` |  |
| OpenNMS.inventory.debug.quiet | bool | `true` |  |
| OpenNMS.inventory.debug.server | bool | `true` |  |
| OpenNMS.inventory.debug.suspend | bool | `true` |  |
| OpenNMS.inventory.debug.transport | string | `"dt_socket"` |  |
| OpenNMS.inventory.encryptionKey | string | `nil` |  |
| OpenNMS.inventory.imagePullPolicy | string | `"IfNotPresent"` |  |
| OpenNMS.inventory.imageShortName | string | `"lokahi-inventory"` |  |
| OpenNMS.inventory.kafkaSecretName | string | `nil` |  |
| OpenNMS.inventory.privateRepoEnabled | bool | `false` |  |
| OpenNMS.inventory.replicas | int | `1` |  |
| OpenNMS.inventory.resources.limits.cpu | string | `"2"` |  |
| OpenNMS.inventory.resources.limits.memory | string | `"4Gi"` |  |
| OpenNMS.inventory.resources.requests.cpu | string | `"1"` |  |
| OpenNMS.inventory.resources.requests.memory | string | `"2Gi"` |  |
| OpenNMS.inventory.serviceName | string | `"opennms-inventory"` |  |
| OpenNMS.metricsProcessor.debug.enabled | bool | `false` |  |
| OpenNMS.metricsProcessor.debug.java.javaAgentPath | string | `"agent/opentelemetry-javaagent.jar"` |  |
| OpenNMS.metricsProcessor.debug.java.preferIPv4Stack | bool | `false` |  |
| OpenNMS.metricsProcessor.debug.port | int | `5005` |  |
| OpenNMS.metricsProcessor.debug.quiet | bool | `true` |  |
| OpenNMS.metricsProcessor.debug.server | bool | `true` |  |
| OpenNMS.metricsProcessor.debug.suspend | bool | `true` |  |
| OpenNMS.metricsProcessor.debug.transport | string | `"dt_socket"` |  |
| OpenNMS.metricsProcessor.flowIngestorUrl | string | `"SOME-EXTERNAL-FLOW-SERVER:80"` |  |
| OpenNMS.metricsProcessor.flowTlsEnabled | bool | `false` |  |
| OpenNMS.metricsProcessor.imagePullPolicy | string | `"IfNotPresent"` |  |
| OpenNMS.metricsProcessor.imageShortName | string | `"lokahi-metrics-processor"` |  |
| OpenNMS.metricsProcessor.kafkaSecretName | string | `nil` |  |
| OpenNMS.metricsProcessor.privateRepoEnabled | bool | `false` |  |
| OpenNMS.metricsProcessor.replicas | int | `1` |  |
| OpenNMS.metricsProcessor.resources.limits.cpu | string | `"2"` |  |
| OpenNMS.metricsProcessor.resources.limits.memory | string | `"4Gi"` |  |
| OpenNMS.metricsProcessor.resources.requests.cpu | string | `"1"` |  |
| OpenNMS.metricsProcessor.resources.requests.memory | string | `"2Gi"` |  |
| OpenNMS.metricsProcessor.serviceName | string | `"opennms-metrics-processor"` |  |
| OpenNMS.metricsthresholdprocessor.enabled | bool | `false` |  |
| OpenNMS.metricsthresholdprocessor.debug.enabled | bool | `false` |  |
| OpenNMS.metricsthresholdprocessor.debug.java.javaAgentPath | string | `"agent/opentelemetry-javaagent.jar"` |  |
| OpenNMS.metricsthresholdprocessor.debug.java.preferIPv4Stack | bool | `false` |  |
| OpenNMS.metricsthresholdprocessor.debug.port | int | `5005` |  |
| OpenNMS.metricsthresholdprocessor.debug.quiet | bool | `true` |  |
| OpenNMS.metricsthresholdprocessor.debug.server | bool | `true` |  |
| OpenNMS.metricsthresholdprocessor.debug.suspend | bool | `true` |  |
| OpenNMS.metricsthresholdprocessor.imagePullPolicy | string | `"IfNotPresent"` |  |
| OpenNMS.metricsthresholdprocessor.imageShortName | string | `"lokahi-metrics-threshold-processor"` |  |
| OpenNMS.metricsthresholdprocessor.privateRepoEnabled | bool | `false` |  |
| OpenNMS.metricsthresholdprocessor.replicas | int | `1` |  |
| OpenNMS.metricsthresholdprocessor.resources.limits.cpu | string | `"2"` |  |
| OpenNMS.metricsthresholdprocessor.resources.limits.memory | string | `"4Gi"` |  |
| OpenNMS.metricsthresholdprocessor.resources.requests.cpu | string | `"1"` |  |
| OpenNMS.metricsthresholdprocessor.resources.requests.memory | string | `"2Gi"` |  |
| OpenNMS.metricsthresholdprocessor.serviceName | string | `"opennms-metrics-threshold-processor"` |  |
| OpenNMS.minionCertificateManager.caSecretName | string | `"root-ca-certificate"` |  |
| OpenNMS.minionCertificateManager.debug.enabled | bool | `false` |  |
| OpenNMS.minionCertificateManager.debug.java.javaAgentPath | string | `"agent/opentelemetry-javaagent.jar"` |  |
| OpenNMS.minionCertificateManager.debug.java.preferIPv4Stack | bool | `false` |  |
| OpenNMS.minionCertificateManager.debug.port | int | `5005` |  |
| OpenNMS.minionCertificateManager.debug.quiet | bool | `true` |  |
| OpenNMS.minionCertificateManager.debug.server | bool | `true` |  |
| OpenNMS.minionCertificateManager.debug.suspend | bool | `true` |  |
| OpenNMS.minionCertificateManager.debug.transport | string | `"dt_socket"` |  |
| OpenNMS.minionCertificateManager.enabled | bool | `true` |  |
| OpenNMS.minionCertificateManager.imagePullPolicy | string | `"IfNotPresent"` |  |
| OpenNMS.minionCertificateManager.imageShortName | string | `"lokahi-minion-certificate-manager"` |  |
| OpenNMS.minionCertificateManager.mtlsSecretName | string | `"client-root-ca-certificate"` |  |
| OpenNMS.minionCertificateManager.privateRepoEnabled | bool | `false` |  |
| OpenNMS.minionCertificateManager.replicas | int | `1` |  |
| OpenNMS.minionCertificateManager.resources.limits.cpu | string | `"1"` |  |
| OpenNMS.minionCertificateManager.resources.limits.memory | string | `"1Gi"` |  |
| OpenNMS.minionCertificateManager.resources.requests.cpu | string | `"1"` |  |
| OpenNMS.minionCertificateManager.resources.requests.memory | string | `"1Gi"` |  |
| OpenNMS.minionCertificateManager.serviceName | string | `"opennms-minion-certificate-manager"` |  |
| OpenNMS.minionCertificateManager.volumeSize | string | `"1Gi"` |  |
| OpenNMS.minionCertificateVerifier.certificateManagerUrl | string | `""` |  |
| OpenNMS.minionCertificateVerifier.debug.enabled | bool | `false` |  |
| OpenNMS.minionCertificateVerifier.debug.java.javaAgentPath | string | `"agent/opentelemetry-javaagent.jar"` |  |
| OpenNMS.minionCertificateVerifier.debug.java.preferIPv4Stack | bool | `false` |  |
| OpenNMS.minionCertificateVerifier.debug.port | int | `5005` |  |
| OpenNMS.minionCertificateVerifier.debug.quiet | bool | `true` |  |
| OpenNMS.minionCertificateVerifier.debug.server | bool | `true` |  |
| OpenNMS.minionCertificateVerifier.debug.suspend | bool | `true` |  |
| OpenNMS.minionCertificateVerifier.debug.transport | string | `"dt_socket"` |  |
| OpenNMS.minionCertificateVerifier.imagePullPolicy | string | `"IfNotPresent"` |  |
| OpenNMS.minionCertificateVerifier.imageShortName | string | `"lokahi-minion-certificate-verifier"` |  |
| OpenNMS.minionCertificateVerifier.privateRepoEnabled | bool | `false` |  |
| OpenNMS.minionCertificateVerifier.replicas | int | `1` |  |
| OpenNMS.minionCertificateVerifier.resources.limits.cpu | string | `"1"` |  |
| OpenNMS.minionCertificateVerifier.resources.limits.memory | string | `"1Gi"` |  |
| OpenNMS.minionCertificateVerifier.resources.requests.cpu | string | `"1"` |  |
| OpenNMS.minionCertificateVerifier.resources.requests.memory | string | `"1Gi"` |  |
| OpenNMS.minionCertificateVerifier.serviceName | string | `"opennms-minion-certificate-verifier"` |  |
| OpenNMS.minionGateway.databaseHost | string | `"postgres"` |  |
| OpenNMS.minionGateway.databaseName | string | `"desenv"` |  |
| OpenNMS.minionGateway.databaseSchemaName | string | `"minion_gateway"` |  |
| OpenNMS.minionGateway.debug.enabled | bool | `false` |  |
| OpenNMS.minionGateway.debug.java.javaAgentPath | string | `"agent/opentelemetry-javaagent.jar"` |  |
| OpenNMS.minionGateway.debug.java.preferIPv4Stack | bool | `true` |  |
| OpenNMS.minionGateway.debug.port | int | `5005` |  |
| OpenNMS.minionGateway.debug.quiet | bool | `true` |  |
| OpenNMS.minionGateway.debug.server | bool | `true` |  |
| OpenNMS.minionGateway.debug.suspend | bool | `true` |  |
| OpenNMS.minionGateway.debug.transport | string | `"dt_socket"` |  |
| OpenNMS.minionGateway.imagePullPolicy | string | `"IfNotPresent"` |  |
| OpenNMS.minionGateway.imageShortName | string | `"lokahi-minion-gateway"` |  |
| OpenNMS.minionGateway.ingressAnnotations."nginx.ingress.kubernetes.io/auth-response-headers" | string | `"tenant-id, location-id"` |  |
| OpenNMS.minionGateway.ingressAnnotations."nginx.ingress.kubernetes.io/auth-tls-pass-certificate-to-upstream" | bool | `true` |  |
| OpenNMS.minionGateway.ingressAnnotations."nginx.ingress.kubernetes.io/auth-tls-secret" | string | `"default/client-root-ca-certificate"` |  |
| OpenNMS.minionGateway.ingressAnnotations."nginx.ingress.kubernetes.io/auth-tls-verify-client" | string | `"on"` |  |
| OpenNMS.minionGateway.ingressAnnotations."nginx.ingress.kubernetes.io/auth-tls-verify-depth" | string | `"1"` |  |
| OpenNMS.minionGateway.ingressAnnotations."nginx.ingress.kubernetes.io/auth-url" | string | `"http://opennms-minion-certificate-verifier.default.svc.cluster.local:8080/certificate/debug"` |  |
| OpenNMS.minionGateway.ingressAnnotations."nginx.ingress.kubernetes.io/proxy-body-size" | string | `"0"` |  |
| OpenNMS.minionGateway.ingressAnnotations."nginx.ingress.kubernetes.io/server-snippet" | string | `"grpc_read_timeout \"1200s\";\ngrpc_send_timeout \"1200s\";\nclient_body_timeout \"1200s\";\n"` |  |
| OpenNMS.minionGateway.internalGrpcPort | int | `8991` |  |
| OpenNMS.minionGateway.kafkaSecretName | string | `nil` |  |
| OpenNMS.minionGateway.privateRepoEnabled | bool | `false` |  |
| OpenNMS.minionGateway.replicas | int | `1` |  |
| OpenNMS.minionGateway.resources.limits.cpu | string | `"2"` |  |
| OpenNMS.minionGateway.resources.limits.memory | string | `"4Gi"` |  |
| OpenNMS.minionGateway.resources.requests.cpu | string | `"1"` |  |
| OpenNMS.minionGateway.resources.requests.memory | string | `"2Gi"` |  |
| OpenNMS.minionGateway.serviceName | string | `"opennms-minion-gateway"` |  |
| OpenNMS.minionGateway.tlsSecretName | string | `"opennms-minion-gateway-certificate"` |  |
| OpenNMS.minionGateway.useKubernetes | string | `"true"` |  |
| OpenNMS.notification.acsConnectionSecretName | object | `{}` |  |
| OpenNMS.notification.baseUrl.appendTenantId | bool | `false` |  |
| OpenNMS.notification.baseUrl.port | int | `443` |  |
| OpenNMS.notification.databaseHost | string | `"postgres"` |  |
| OpenNMS.notification.databaseName | string | `"desenv"` |  |
| OpenNMS.notification.databaseSchemaName | string | `"notification"` |  |
| OpenNMS.notification.debug.enabled | bool | `false` |  |
| OpenNMS.notification.debug.java.javaAgentPath | string | `"agent/opentelemetry-javaagent.jar"` |  |
| OpenNMS.notification.debug.java.preferIPv4Stack | bool | `false` |  |
| OpenNMS.notification.debug.port | int | `5005` |  |
| OpenNMS.notification.debug.quiet | bool | `true` |  |
| OpenNMS.notification.debug.server | bool | `true` |  |
| OpenNMS.notification.debug.suspend | bool | `true` |  |
| OpenNMS.notification.debug.transport | string | `"dt_socket"` |  |
| OpenNMS.notification.imagePullPolicy | string | `"IfNotPresent"` |  |
| OpenNMS.notification.imageShortName | string | `"lokahi-notification"` |  |
| OpenNMS.notification.kafkaSecretName | string | `nil` |  |
| OpenNMS.notification.mailFrom | string | `""` |  |
| OpenNMS.notification.privateRepoEnabled | bool | `false` |  |
| OpenNMS.notification.replicas | int | `1` |  |
| OpenNMS.notification.resources.limits.cpu | string | `"2"` |  |
| OpenNMS.notification.resources.limits.memory | string | `"4Gi"` |  |
| OpenNMS.notification.resources.requests.cpu | string | `"1"` |  |
| OpenNMS.notification.resources.requests.memory | string | `"2Gi"` |  |
| OpenNMS.notification.retry.delay | int | `1000` |  |
| OpenNMS.notification.retry.max | int | `10` |  |
| OpenNMS.notification.retry.maxDelay | int | `60000` |  |
| OpenNMS.notification.retry.multiplier | int | `2` |  |
| OpenNMS.notification.serviceName | string | `"opennms-notifications"` |  |
| OpenNMS.notification.smtpAuth | bool | `false` |  |
| OpenNMS.notification.smtpHost | string | `""` |  |
| OpenNMS.notification.smtpPassword | string | `""` |  |
| OpenNMS.notification.smtpPort | string | `""` |  |
| OpenNMS.notification.smtpStartTls | bool | `false` |  |
| OpenNMS.notification.smtpUsername | string | `""` |  |
| OpenNMS.ui.imagePullPolicy | string | `"IfNotPresent"` |  |
| OpenNMS.ui.imageShortName | string | `"lokahi-ui"` |  |
| OpenNMS.ui.ingressAnnotations."nginx.ingress.kubernetes.io/client-body-buffer-size" | string | `"4k"` |  |
| OpenNMS.ui.ingressAnnotations."nginx.ingress.kubernetes.io/client-header-buffer-size" | string | `"4k"` |  |
| OpenNMS.ui.ingressAnnotations."nginx.ingress.kubernetes.io/configuration-snippet" | string | `"add_header X-Content-Type-Options \"nosniff\";\nadd_header X-Frame-Options \"sameorigin\";\nadd_header server_tokens \"off\";\n"` |  |
| OpenNMS.ui.ingressAnnotations."nginx.ingress.kubernetes.io/large-client-header-buffers" | string | `"4 16k"` |  |
| OpenNMS.ui.ingressAnnotations."nginx.ingress.kubernetes.io/proxy-body-size" | string | `"4m"` |  |
| OpenNMS.ui.ingressAnnotations."nginx.ingress.kubernetes.io/proxy-buffer-size" | string | `"6k"` |  |
| OpenNMS.ui.path | string | `"/"` |  |
| OpenNMS.ui.port | int | `8080` |  |
| OpenNMS.ui.privateRepoEnabled | bool | `false` |  |
| OpenNMS.ui.replicas | int | `1` |  |
| OpenNMS.ui.resources.limits.cpu | string | `"1"` |  |
| OpenNMS.ui.resources.limits.memory | string | `"512Mi"` |  |
| OpenNMS.ui.resources.requests.cpu | string | `"100m"` |  |
| OpenNMS.ui.resources.requests.memory | string | `"256Mi"` |  |
| OpenNMS.ui.serviceName | string | `"opennms-ui"` |  |
| OpenNMS.ui.tlsSecretName | string | `"root-ca-certificate"` |  |
| Prometheus.auth.externalSecret | string | `""` |  |
| Prometheus.auth.password | string | `"notset"` |  |
| Prometheus.auth.username | string | `"admin"` |  |
| Prometheus.enabled | bool | `true` |  |
| Prometheus.path | string | `"/prometheus"` |  |
| Prometheus.port | int | `9090` |  |
| Prometheus.serviceName | string | `"prometheus"` |  |
| cortexClient.hostRead | string | `"cortex"` |  |
| cortexClient.hostWrite | string | `"cortex"` |  |
| cortexClient.pathRead | string | `"/prometheus/api/v1"` |  |
| cortexClient.pathWrite | string | `"/api/v1/push"` |  |
| cortexClient.portRead | int | `9000` |  |
| cortexClient.portWrite | int | `9000` |  |
| cortexClient.protocol | string | `"http"` |  |
| customErrors.debug | bool | `true` |  |
| customErrors.image | string | `"quay.io/kubernetes-ingress-controller/custom-error-pages:0.4"` |  |
| global.enableJsonLogging | bool | `false` |  |
| global.hostname | string | `"onmshs"` |  |
| global.image.repository | string | `"opennms"` |  |
| global.image.tag | string | `"v0.0.61"` |  |
| global.kafkaClient.bootstrapServers | string | `"onms-kafka:9092"` |  |
| global.openTelemetry.env.OTEL_PROPAGATORS | string | `"tracecontext,baggage,jaeger"` |  |
| global.openTelemetry.otlpTracesEndpoint | string | `nil` |  |
| global.port | int | `443` |  |
| global.protocol | string | `"https"` |  |
| global.springBoot.env | object | `{}` |  |
| ingress.controllerimage | string | `"registry.k8s.io/ingress-nginx/controller:v1.7.0@sha256:7612338342a1e7b8090bef78f2a04fffcadd548ccaabe8a47bf7758ff549a5f7"` |  |
| ingress.defaultEndpointsEnabled | bool | `true` |  |
| ingress.enabled | bool | `false` |  |
| ingress.httpPort | int | `80` |  |
| ingress.httpsPort | int | `443` |  |
| ingress.secretJobimage | string | `"registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.1.1@sha256:64d8c73dca984af206adf9d6d7e46aa550362b1d7a01f3a0a91b20cc67868660"` |  |
| ingress.webhookPatchJobimage | string | `"registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.1.1@sha256:64d8c73dca984af206adf9d6d7e46aa550362b1d7a01f3a0a91b20cc67868660"` |  |
| letsencrypt.enabled | bool | `false` |  |
| nodeRestrictions.enabled | bool | `false` |  |
| nodeRestrictions.key | string | `"kubernetes.azure.com/scalesetpriority"` |  |
| nodeRestrictions.value | string | `"spot"` |  |
| tls.certificateGeneration | bool | `false` |  |
| tls.enabled | bool | `true` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.3](https://github.com/norwoodj/helm-docs/releases/v1.11.3)
