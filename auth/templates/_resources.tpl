{{/* vim: set filetype=mustache: */}}
{{/*
Return the proper resource map
*/}}
{{- define "common.resources" -}}
{{- if .Values.resources -}}
limits:
  cpu: {{ .Values.resources.limits.cpu }}
  memory: {{ .Values.resources.limits.memory }}
requests:
  cpu: {{ .Values.resources.requests.cpu }}
  memory: {{ .Values.resources.requests.memory }}
{{- else if .Values.global -}}
limits:
  cpu: {{ .Values.global.resources.limits.cpu }}
  memory: {{ .Values.global.resources.limits.memory }}
requests:
  cpu: {{ .Values.global.resources.requests.cpu }}
  memory: {{ .Values.global.resources.requests.memory }}
{{- end -}}
{{- end -}}

{{- define "logSideCar.resources" -}}
{{- if .Values.global.logSideCar.resources -}}
limits:
  cpu: {{ .Values.global.logSideCar.resources.limits.cpu }}
  memory: {{ .Values.global.logSideCar.resources.limits.memory }}
requests:
  cpu: {{ .Values.global.logSideCar.resources.requests.cpu }}
  memory: {{ .Values.global.logSideCar.resources.requests.memory }}
{{- end -}}
{{- end -}}