# Used for Cortex dependency openTelemetry otlpTracesEndpoint, and env OTEL_PROPAGATORS.
{{- define "lokahi.openTelemetry" }}
{{- if  (empty .thisService) -}}
{{- printf "%s" "null" -}}
{{- else -}}
{{- .thisService -}}
{{- end -}}
{{- end -}}