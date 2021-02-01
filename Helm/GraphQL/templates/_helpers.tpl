#=======================Configmap=========================#
# data
{{- define "andromeda.charts.configmap.data" }}
 {{- range $key, $val := .Values.ConfigMap.data }}
  {{- if eq $key "DEV_GRAPHQL_GENERATE_SOURCEMAP" }}
   {{ $key }}: {{ $val | quote }}
  {{- else}}
   {{ $key }}: {{ $val}}
  {{- end }}
 {{- end }}
{{- end }}

#========================Secrets==========================#
# data
{{- define "andromeda.charts.secrets.data" }}
 {{- range $key, $val := .Values.Secrets.data }}
  {{ $key }}: {{ $val}}
 {{- end }}
{{- end }}

#=========================Pods=============================#
# labels
{{- define "andromeda.charts.pod.label" }}
  app: {{ .Release.Name }}-pod
  tier: {{ .Values.Deployment.pod.tier }}
  version: {{ .Values.Deployment.pod.version }}
{{- end }}

#==========================Node============================#
# affinity
{{- define "andromeda.charts.node.affinity" }}
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
          - matchExpressions:
              - key: {{ .Values.Deployment.pod.affinity.key }}
                operator: {{ .Values.Deployment.pod.affinity.operator }}
                values:
                {{- range .Values.Deployment.pod.affinity.values }}
                - {{ . }}
                {{- end }}
{{- end }}

#======================annotations=========================#
# Stage 0
{{- define "andromeda.charts.annotations.stage0" }}
 {{- range $key, $val := .Values.Annotation_Common.Stage0 }}
  {{- if eq $key "helm.sh/hook-weight" }}
   {{ $key }}: {{ $val | quote }}
  {{- else}}
   {{ $key }}: {{ $val}}
  {{- end }}
 {{- end }}
{{- end }}

# Stage 1
{{- define "andromeda.charts.annotations.stage1" }}
 {{- range $key, $val := .Values.Annotation_Common.Stage1 }}
  {{- if eq $key "helm.sh/hook-weight" }}
   {{ $key }}: {{ $val | quote }}
  {{- else}}
   {{ $key }}: {{ $val}}
  {{- end }}
 {{- end }}
{{- end }}

# Stage 2
{{- define "andromeda.charts.annotations.stage2" }}
 {{- range $key, $val := .Values.Annotation_Common.Stage2 }}
  {{- if eq $key "helm.sh/hook-weight" }}
   {{ $key }}: {{ $val | quote }}
  {{- else}}
   {{ $key }}: {{ $val}}
  {{- end }}
 {{- end }}
{{- end }}

# Stage 3
{{- define "andromeda.charts.annotations.stage3" }}
 {{- range $key, $val := .Values.Annotation_Common.Stage3 }}
  {{- if eq $key "helm.sh/hook-weight" }}
   {{ $key }}: {{ $val | quote }}
  {{- else}}
   {{ $key }}: {{ $val}}
  {{- end }}
 {{- end }}
{{- end }}