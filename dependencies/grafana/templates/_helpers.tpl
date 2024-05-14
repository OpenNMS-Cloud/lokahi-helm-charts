{{- /*
lokahi.image: return the docker image name including tag for the service
argument: a dictionary with Values and "thisService" rooted at the values
for the service.
example:
	image: {{ include "lokahi.image" (dict "Values" .Values "thisService" .Values.OpenNMS.Alert) | quote }}

Precedence for image (first wins):
1. thisService.Image
2. OpenNMS.global.image.repository + "/" + image short name + "/" + tag

image short name:
1. thisService.imageShortName
2. thisService.serviceName

tag:
1. OpenNMS.global.image.tag
2. "latest"

TODO: The default tag should eventually be .Chart.AppVersion, but we
aren't versioning the chart yet.
*/}}
{{- define "lokahi.image" }}
{{- if .thisService.image -}}
{{- .thisService.image -}}
{{- else -}}
{{- $imageShortName := .thisService.imageShortName | default .thisService.serviceName -}}
{{- printf "%s/%s:" .Values.global.image.repository $imageShortName -}}
{{- end -}}
{{- end -}}