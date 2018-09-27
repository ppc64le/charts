{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "openliberty.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}


{{- define "openliberty.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "open-liberty.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "open-liberty.serviceIP" -}}
{{- if eq .Values.serviceType "ClusterIP" -}}
127.0.0.1
{{- else -}}
{{- index .Values (printf "%sLoadBalancerIP" .Chart.Name) | default "" -}}
{{- end -}}
{{- end -}}

{{/*
Gets the host to be used for this application.
If not using ClusterIP, or if a host or LoadBalancerIP is not defined, the value will be empty.
*/}}

