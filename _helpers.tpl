{{- define "my-chart.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name }}
{{- end -}}

{{- define "my-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "my-chart.configmapChecksum" -}}
{{- $configMap := lookup "v1" "ConfigMap" .Release.Namespace "my-configmap" -}}
{{- $checksum := ($configMap.Data | toJson) | sha256sum -}}
{{- printf "%x" $checksum -}}
{{- end -}}



{{- define "my-chart.secretChecksum" -}}
{{- $secret := lookup "v1" "Secret" .Release.Namespace "my-secret" -}}
{{- $checksum := ($secret.Data | toJson) | sha256sum -}}
{{- printf "%x" $checksum -}}
{{- end -}}
