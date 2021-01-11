# Configmap - Data
{{- define "andromeda.charts.configmap.data" }}
 {{- range $key, $val := .Values.ConfigMap.data }}
  {{- if eq $key "DEV_GRAPHQL_GENERATE_SOURCEMAP" }}
   {{ $key }}: {{ $val | quote }}
  {{- else}}
   {{ $key }}: {{ $val}}
  {{- end }}
 {{- end }}
{{- end }}

# Secrets - Data
{{- define "andromeda.charts.secrets.data" }}
 {{- range $key, $val := .Values.Secrets.data }}
  {{ $key }}: {{ $val}}
 {{- end }}
{{- end }}

# Pod  - Labels
{{- define "andromeda.charts.pod.label" }}
  app: {{ .Release.Name }}-pod
  tier: {{ .Values.Deployment.pod.tier }}
  version: {{ .Values.Deployment.pod.version }}
{{- end }}