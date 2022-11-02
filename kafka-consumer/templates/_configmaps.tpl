{{/* vim: set filetype=mustache: */}}
{{/*
Return the proper config name
{{ include "common.configs.config" ( dict "configRoot" .Values.path.to.the.config) }}
*/}}
{{- define "common.configs.config" -}}
{{- $configMapName := .configRoot.name -}}
{{- $separator := "-" -}}
{{- printf "%s%s" $separator $configMapName -}}
{{- end -}}