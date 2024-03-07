# lokahi

![Version: 1.0.0-alpha](https://img.shields.io/badge/Version-1.0.0--alpha-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.0.0](https://img.shields.io/badge/AppVersion-v1.0.0-informational?style=flat-square)

A Helm chart for running OpenNMS Lokahi in Kubernetes

**Homepage:** <https://github.com/OpenNMS-Cloud/lokahi>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| The OpenNMS Group Inc. |  | <https://www.opennms.com> |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| OpenNMS.alert.databaseHost | string | `"postgres"` |  |
| OpenNMS.alert.databaseName | string | `"desenv"` |  |
| OpenNMS.alert.databaseSchemaName | string | `"alert"` |  |
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
| OpenNMS.events.imagePullPolicy | string | `"IfNotPresent"` |  |
| OpenNMS.events.imageShortName | string | `"lokahi-events"` |  |
| OpenNMS.events.privateRepoEnabled | bool | `false` |  |
| OpenNMS.events.replicas | int | `1` |  |
| OpenNMS.events.resources.limits.cpu | string | `"2"` |  |
| OpenNMS.events.resources.limits.memory | string | `"4Gi"` |  |
| OpenNMS.events.resources.requests.cpu | string | `"1"` |  |
| OpenNMS.events.resources.requests.memory | string | `"2Gi"` |  |
| OpenNMS.events.serviceName | string | `"opennms-events"` |  |
| OpenNMS.global.developmentMode | bool | `false` |  |
| OpenNMS.global.enableJsonLogging | bool | `false` |  |
| OpenNMS.global.image.repository | string | `"opennms"` |  |
| OpenNMS.global.image.tag | string | `"latest"` |  |
| OpenNMS.global.kafkaClient.bootstrapServers | string | `"onms-kafka:9092"` |  |
| OpenNMS.global.openTelemetry.env.OTEL_PROPAGATORS | string | `"tracecontext,baggage,jaeger"` |  |
| OpenNMS.global.openTelemetry.otlpTracesEndpoint | string | `nil` |  |
| OpenNMS.global.springBoot.env | object | `{}` |  |
| OpenNMS.inventory.databaseHost | string | `"postgres"` |  |
| OpenNMS.inventory.databaseName | string | `"desenv"` |  |
| OpenNMS.inventory.databaseSchemaName | string | `"inventory"` |  |
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
| OpenNMS.minionCertificateManager.caSecretName | string | `""` |  |
| OpenNMS.minionCertificateManager.enabled | bool | `false` |  |
| OpenNMS.minionCertificateManager.imagePullPolicy | string | `"IfNotPresent"` |  |
| OpenNMS.minionCertificateManager.imageShortName | string | `"lokahi-minion-certificate-manager"` |  |
| OpenNMS.minionCertificateManager.mtlsSecretName | string | `"opennms-minion-certificate"` |  |
| OpenNMS.minionCertificateManager.privateRepoEnabled | bool | `false` |  |
| OpenNMS.minionCertificateManager.replicas | int | `1` |  |
| OpenNMS.minionCertificateManager.resources.limits.cpu | string | `"1"` |  |
| OpenNMS.minionCertificateManager.resources.limits.memory | string | `"1Gi"` |  |
| OpenNMS.minionCertificateManager.resources.requests.cpu | string | `"1"` |  |
| OpenNMS.minionCertificateManager.resources.requests.memory | string | `"1Gi"` |  |
| OpenNMS.minionCertificateManager.serviceName | string | `"opennms-minion-certificate-manager"` |  |
| OpenNMS.minionCertificateManager.volumeSize | string | `"1Gi"` |  |
| OpenNMS.minionCertificateVerifier.certificateManagerUrl | string | `""` |  |
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
| OpenNMS.notification.baseUrl.url | string | `"onmshs:443"` |  |
| OpenNMS.notification.databaseHost | string | `"postgres"` |  |
| OpenNMS.notification.databaseName | string | `"desenv"` |  |
| OpenNMS.notification.databaseSchemaName | string | `"notification"` |  |
| OpenNMS.notification.imagePullPolicy | string | `"IfNotPresent"` |  |
| OpenNMS.notification.imageShortName | string | `"lokahi-notification"` |  |
| OpenNMS.notification.kafkaSecretName | string | `nil` |  |
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
| OpenNMS.ui.tlsSecretName | string | `"opennms-ui-certificate"` |  |
| citus.adminPassword | string | `""` |  |
| citus.adminUser | string | `"desenv"` |  |
| citus.enabled | bool | `false` |  |
| cortexClient.hostRead | string | `"cortex"` |  |
| cortexClient.hostWrite | string | `"cortex"` |  |
| cortexClient.pathRead | string | `"/prometheus/api/v1"` |  |
| cortexClient.pathWrite | string | `"/api/v1/push"` |  |
| cortexClient.portRead | int | `9000` |  |
| cortexClient.portWrite | int | `9000` |  |
| cortexClient.protocol | string | `"http"` |  |
| customErrors.debug | bool | `true` |  |
| customErrors.image | string | `"quay.io/kubernetes-ingress-controller/custom-error-pages:0.4"` |  |
| grafana.enabled | bool | `true` |  |
| grafana.path | string | `"/grafana"` |  |
| grafana.port | int | `3000` |  |
| grafana.serviceName | string | `"grafana"` |  |
| hostname | string | `"onmshs"` |  |
| ingress.controllerimage | string | `"registry.k8s.io/ingress-nginx/controller:v1.7.0@sha256:7612338342a1e7b8090bef78f2a04fffcadd548ccaabe8a47bf7758ff549a5f7"` |  |
| ingress.defaultEndpointsEnabled | bool | `true` |  |
| ingress.enabled | bool | `false` |  |
| ingress.httpPort | int | `80` |  |
| ingress.httpsPort | int | `443` |  |
| ingress.secretJobimage | string | `"registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.1.1@sha256:64d8c73dca984af206adf9d6d7e46aa550362b1d7a01f3a0a91b20cc67868660"` |  |
| ingress.webhookPatchJobimage | string | `"registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.1.1@sha256:64d8c73dca984af206adf9d6d7e46aa550362b1d7a01f3a0a91b20cc67868660"` |  |
| keycloak.httpsPort | int | `8443` |  |
| keycloak.path | string | `"/auth"` |  |
| keycloak.port | int | `8080` |  |
| keycloak.realmName | string | `"opennms"` |  |
| keycloak.serviceName | string | `"onms-keycloak"` |  |
| nodeRestrictions.enabled | bool | `false` |  |
| nodeRestrictions.key | string | `"kubernetes.azure.com/scalesetpriority"` |  |
| nodeRestrictions.value | string | `"spot"` |  |
| port | int | `443` |  |
| prometheus.enabled | bool | `true` |  |
| prometheus.path | string | `"/prometheus"` |  |
| prometheus.port | int | `9090` |  |
| prometheus.serviceName | string | `"prometheus"` |  |
| protocol | string | `"https"` |  |
| tls.certificateGeneration | bool | `false` |  |
| tls.enabled | bool | `true` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.3](https://github.com/norwoodj/helm-docs/releases/v1.11.3)
