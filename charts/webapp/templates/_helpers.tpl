{{- define "cluster_name" -}}
{{- $matches := split "." ( .Values.spec.destination.server | toString ) -}}
{{- $matches._1 -}}
{{- end -}}

{{- define "cluster_fqdn" -}}
{{- $match := .Values.spec.destination.server | toString | regexFind "api.*:" -}}
{{- $match | trimAll ":" | trimAll "api." -}}
{{- end -}}

{{- define "edge_image" -}}
{{- with .Values.image}}
{{- printf "{\"%s\"} .name| regexMatch "\\[^\\]*$" | trimAll "\"}
{{- end -}}
