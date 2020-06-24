{{/*
Common helper templates/"functions" for use in the other files in this directory.
/*}}

{{/*
Built full docker image name, including sha reference or tag
*/}}
{{- define "docker-image" -}}
{{- if hasKey .Values "dockerSha" -}}
  {{- printf "%s@%s" .Values.dockerImage .Values.dockerSha | quote -}}
{{- else if hasKey .Values "dockerTag" -}}
  {{- printf "%s:%s" .Values.dockerImage .Values.dockerTag | quote -}}
{{- else -}}
  {{- printf "%s:latest" .Values.dockerImage | quote -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
