{{- define ".environment" -}}
{{- .Values.environmentOverride | default .Values.clusterName | default "" }}
{{- end }}

{{ define ".syncPolicy" }}
{{- if not (.Values.disableAutoSync) }}
automated:
  prune: true
{{- end }}
syncOptions:
  - CreateNamespace=true
retry:
  limit: 1
  backoff:
    duration: 5s
    factor: 2
    maxDuration: 1m
{{- end }}
