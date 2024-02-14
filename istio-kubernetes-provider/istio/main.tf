resource "kubernetes_namespace" "istio_system" {
  metadata {
    name = "istio-system"
  }
}

resource "kubernetes_manifest" "serviceaccount_istio_system_istio_reader_service_account" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "ServiceAccount"
    "metadata" = {
      "labels" = {
        "app" = "istio-reader"
        "release" = "istio"
      }
      "name" = "istio-reader-service-account"
      "namespace" = "istio-system"
    }
  }
}

resource "kubernetes_manifest" "serviceaccount_istio_system_istiod" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "ServiceAccount"
    "metadata" = {
      "labels" = {
        "app" = "istiod"
        "release" = "istio"
      }
      "name" = "istiod"
      "namespace" = "istio-system"
    }
  }
}

resource "kubernetes_manifest" "clusterrole_istio_reader_clusterrole_istio_system" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "ClusterRole"
    "metadata" = {
      "labels" = {
        "app" = "istio-reader"
        "release" = "istio"
      }
      "name" = "istio-reader-clusterrole-istio-system"
    }
    "rules" = [
      {
        "apiGroups" = [
          "config.istio.io",
          "security.istio.io",
          "networking.istio.io",
          "authentication.istio.io",
          "rbac.istio.io",
        ]
        "resources" = [
          "*",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "endpoints",
          "pods",
          "services",
          "nodes",
          "replicationcontrollers",
          "namespaces",
          "secrets",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
      {
        "apiGroups" = [
          "networking.istio.io",
        ]
        "resources" = [
          "workloadentries",
        ]
        "verbs" = [
          "get",
          "watch",
          "list",
        ]
      },
      {
        "apiGroups" = [
          "networking.x-k8s.io",
          "gateway.networking.k8s.io",
        ]
        "resources" = [
          "gateways",
        ]
        "verbs" = [
          "get",
          "watch",
          "list",
        ]
      },
      {
        "apiGroups" = [
          "apiextensions.k8s.io",
        ]
        "resources" = [
          "customresourcedefinitions",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
      {
        "apiGroups" = [
          "discovery.k8s.io",
        ]
        "resources" = [
          "endpointslices",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
      {
        "apiGroups" = [
          "multicluster.x-k8s.io",
        ]
        "resources" = [
          "serviceexports",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
          "create",
          "delete",
        ]
      },
      {
        "apiGroups" = [
          "multicluster.x-k8s.io",
        ]
        "resources" = [
          "serviceimports",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
      {
        "apiGroups" = [
          "apps",
        ]
        "resources" = [
          "replicasets",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
      {
        "apiGroups" = [
          "authentication.k8s.io",
        ]
        "resources" = [
          "tokenreviews",
        ]
        "verbs" = [
          "create",
        ]
      },
      {
        "apiGroups" = [
          "authorization.k8s.io",
        ]
        "resources" = [
          "subjectaccessreviews",
        ]
        "verbs" = [
          "create",
        ]
      },
    ]
  }
}

resource "kubernetes_manifest" "clusterrole_istiod_clusterrole_istio_system" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "ClusterRole"
    "metadata" = {
      "labels" = {
        "app" = "istiod"
        "release" = "istio"
      }
      "name" = "istiod-clusterrole-istio-system"
    }
    "rules" = [
      {
        "apiGroups" = [
          "admissionregistration.k8s.io",
        ]
        "resources" = [
          "mutatingwebhookconfigurations",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
          "update",
          "patch",
        ]
      },
      {
        "apiGroups" = [
          "admissionregistration.k8s.io",
        ]
        "resources" = [
          "validatingwebhookconfigurations",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
          "update",
        ]
      },
      {
        "apiGroups" = [
          "config.istio.io",
          "security.istio.io",
          "networking.istio.io",
          "authentication.istio.io",
          "rbac.istio.io",
          "telemetry.istio.io",
          "extensions.istio.io",
        ]
        "resources" = [
          "*",
        ]
        "verbs" = [
          "get",
          "watch",
          "list",
        ]
      },
      {
        "apiGroups" = [
          "networking.istio.io",
        ]
        "resources" = [
          "workloadentries",
        ]
        "verbs" = [
          "get",
          "watch",
          "list",
          "update",
          "patch",
          "create",
          "delete",
        ]
      },
      {
        "apiGroups" = [
          "networking.istio.io",
        ]
        "resources" = [
          "workloadentries/status",
        ]
        "verbs" = [
          "get",
          "watch",
          "list",
          "update",
          "patch",
          "create",
          "delete",
        ]
      },
      {
        "apiGroups" = [
          "apiextensions.k8s.io",
        ]
        "resources" = [
          "customresourcedefinitions",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "pods",
          "nodes",
          "services",
          "namespaces",
          "endpoints",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
      {
        "apiGroups" = [
          "discovery.k8s.io",
        ]
        "resources" = [
          "endpointslices",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
      {
        "apiGroups" = [
          "networking.k8s.io",
        ]
        "resources" = [
          "ingresses",
          "ingressclasses",
        ]
        "verbs" = [
          "get",
          "list",
          "watch",
        ]
      },
      {
        "apiGroups" = [
          "networking.k8s.io",
        ]
        "resources" = [
          "ingresses/status",
        ]
        "verbs" = [
          "*",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "configmaps",
        ]
        "verbs" = [
          "create",
          "get",
          "list",
          "watch",
          "update",
        ]
      },
      {
        "apiGroups" = [
          "authentication.k8s.io",
        ]
        "resources" = [
          "tokenreviews",
        ]
        "verbs" = [
          "create",
        ]
      },
      {
        "apiGroups" = [
          "authorization.k8s.io",
        ]
        "resources" = [
          "subjectaccessreviews",
        ]
        "verbs" = [
          "create",
        ]
      },
      {
        "apiGroups" = [
          "networking.x-k8s.io",
          "gateway.networking.k8s.io",
        ]
        "resources" = [
          "*",
        ]
        "verbs" = [
          "get",
          "watch",
          "list",
        ]
      },
      {
        "apiGroups" = [
          "networking.x-k8s.io",
          "gateway.networking.k8s.io",
        ]
        "resources" = [
          "*",
        ]
        "verbs" = [
          "update",
          "patch",
        ]
      },
      {
        "apiGroups" = [
          "gateway.networking.k8s.io",
        ]
        "resources" = [
          "gatewayclasses",
        ]
        "verbs" = [
          "create",
          "update",
          "patch",
          "delete",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "secrets",
        ]
        "verbs" = [
          "get",
          "watch",
          "list",
        ]
      },
      {
        "apiGroups" = [
          "multicluster.x-k8s.io",
        ]
        "resources" = [
          "serviceexports",
        ]
        "verbs" = [
          "get",
          "watch",
          "list",
          "create",
          "delete",
        ]
      },
      {
        "apiGroups" = [
          "multicluster.x-k8s.io",
        ]
        "resources" = [
          "serviceimports",
        ]
        "verbs" = [
          "get",
          "watch",
          "list",
        ]
      },
    ]
  }
}

resource "kubernetes_manifest" "clusterrole_istiod_gateway_controller_istio_system" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "ClusterRole"
    "metadata" = {
      "labels" = {
        "app" = "istiod"
        "release" = "istio"
      }
      "name" = "istiod-gateway-controller-istio-system"
    }
    "rules" = [
      {
        "apiGroups" = [
          "apps",
        ]
        "resources" = [
          "deployments",
        ]
        "verbs" = [
          "get",
          "watch",
          "list",
          "update",
          "patch",
          "create",
          "delete",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "services",
        ]
        "verbs" = [
          "get",
          "watch",
          "list",
          "update",
          "patch",
          "create",
          "delete",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "serviceaccounts",
        ]
        "verbs" = [
          "get",
          "watch",
          "list",
          "update",
          "patch",
          "create",
          "delete",
        ]
      },
    ]
  }
}

resource "kubernetes_manifest" "clusterrolebinding_istio_reader_clusterrole_istio_system" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "ClusterRoleBinding"
    "metadata" = {
      "labels" = {
        "app" = "istio-reader"
        "release" = "istio"
      }
      "name" = "istio-reader-clusterrole-istio-system"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "ClusterRole"
      "name" = "istio-reader-clusterrole-istio-system"
    }
    "subjects" = [
      {
        "kind" = "ServiceAccount"
        "name" = "istio-reader-service-account"
        "namespace" = "istio-system"
      },
    ]
  }
}

resource "kubernetes_manifest" "clusterrolebinding_istiod_clusterrole_istio_system" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "ClusterRoleBinding"
    "metadata" = {
      "labels" = {
        "app" = "istiod"
        "release" = "istio"
      }
      "name" = "istiod-clusterrole-istio-system"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "ClusterRole"
      "name" = "istiod-clusterrole-istio-system"
    }
    "subjects" = [
      {
        "kind" = "ServiceAccount"
        "name" = "istiod"
        "namespace" = "istio-system"
      },
    ]
  }
}

resource "kubernetes_manifest" "clusterrolebinding_istiod_gateway_controller_istio_system" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "ClusterRoleBinding"
    "metadata" = {
      "labels" = {
        "app" = "istiod"
        "release" = "istio"
      }
      "name" = "istiod-gateway-controller-istio-system"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "ClusterRole"
      "name" = "istiod-gateway-controller-istio-system"
    }
    "subjects" = [
      {
        "kind" = "ServiceAccount"
        "name" = "istiod"
        "namespace" = "istio-system"
      },
    ]
  }
}

resource "kubernetes_manifest" "validatingwebhookconfiguration_istio_validator_istio_system" {
  manifest = {
    "apiVersion" = "admissionregistration.k8s.io/v1"
    "kind" = "ValidatingWebhookConfiguration"
    "metadata" = {
      "labels" = {
        "app" = "istiod"
        "istio" = "istiod"
        "istio.io/rev" = "default"
        "release" = "istio"
      }
      "name" = "istio-validator-istio-system"
    }
    "webhooks" = [
      {
        "admissionReviewVersions" = [
          "v1beta1",
          "v1",
        ]
        "clientConfig" = {
          "service" = {
            "name" = "istiod"
            "namespace" = "istio-system"
            "path" = "/validate"
          }
        }
        // "failurePolicy" = "Ignore"
        "name" = "rev.validation.istio.io"
        "objectSelector" = {
          "matchExpressions" = [
            {
              "key" = "istio.io/rev"
              "operator" = "In"
              "values" = [
                "default",
              ]
            },
          ]
        }
        "rules" = [
          {
            "apiGroups" = [
              "security.istio.io",
              "networking.istio.io",
              "telemetry.istio.io",
              "extensions.istio.io",
            ]
            "apiVersions" = [
              "*",
            ]
            "operations" = [
              "CREATE",
              "UPDATE",
            ]
            "resources" = [
              "*",
            ]
          },
        ]
        "sideEffects" = "None"
      },
    ]
  }
}

resource "kubernetes_manifest" "configmap_istio_system_istio" {
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "mesh" = <<-EOT
      defaultConfig:
        discoveryAddress: istiod.istio-system.svc:15012
        proxyMetadata: {}
        tracing:
          zipkin:
            address: zipkin.istio-system:9411
      defaultProviders:
        metrics:
        - prometheus
      enablePrometheusMerge: true
      rootNamespace: istio-system
      trustDomain: cluster.local
      EOT
      "meshNetworks" = "networks: {}"
    }
    "kind" = "ConfigMap"
    "metadata" = {
      "labels" = {
        "install.operator.istio.io/owning-resource" = "unknown"
        "istio.io/rev" = "default"
        "operator.istio.io/component" = "Pilot"
        "release" = "istio"
      }
      "name" = "istio"
      "namespace" = "istio-system"
    }
  }
}

resource "kubernetes_manifest" "configmap_istio_system_istio_sidecar_injector" {
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "config" = <<-EOT
      # defaultTemplates defines the default template to use for pods that do not explicitly specify a template
      defaultTemplates: [sidecar]
      policy: enabled
      alwaysInjectSelector:
        []
      neverInjectSelector:
        []
      injectedAnnotations:
      template: "{{ Template_Version_And_Istio_Version_Mismatched_Check_Installation }}"
      templates:
        sidecar: |
          {{- define "resources"  }}
            {{- if or (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyCPU`) (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyMemory`) (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyCPULimit`) (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyMemoryLimit`) }}
              {{- if or (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyCPU`) (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyMemory`) }}
                requests:
                  {{ if (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyCPU`) -}}
                  cpu: "{{ index .ObjectMeta.Annotations `sidecar.istio.io/proxyCPU` }}"
                  {{ end }}
                  {{ if (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyMemory`) -}}
                  memory: "{{ index .ObjectMeta.Annotations `sidecar.istio.io/proxyMemory` }}"
                  {{ end }}
              {{- end }}
              {{- if or (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyCPULimit`) (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyMemoryLimit`) }}
                limits:
                  {{ if (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyCPULimit`) -}}
                  cpu: "{{ index .ObjectMeta.Annotations `sidecar.istio.io/proxyCPULimit` }}"
                  {{ end }}
                  {{ if (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyMemoryLimit`) -}}
                  memory: "{{ index .ObjectMeta.Annotations `sidecar.istio.io/proxyMemoryLimit` }}"
                  {{ end }}
              {{- end }}
            {{- else }}
              {{- if .Values.global.proxy.resources }}
                {{ toYaml .Values.global.proxy.resources | indent 6 }}
              {{- end }}
            {{- end }}
          {{- end }}
          {{ $nativeSidecar := (eq (env "ENABLE_NATIVE_SIDECARS" "false") "true") }}
          {{- $containers := list }}
          {{- range $index, $container := .Spec.Containers }}{{ if not (eq $container.Name "istio-proxy") }}{{ $containers = append $containers $container.Name }}{{end}}{{- end}}
          metadata:
            labels:
              security.istio.io/tlsMode: {{ index .ObjectMeta.Labels `security.istio.io/tlsMode` | default "istio"  | quote }}
              {{- if eq (index .ProxyConfig.ProxyMetadata "ISTIO_META_ENABLE_HBONE") "true" }}
              networking.istio.io/tunnel: {{ index .ObjectMeta.Labels `networking.istio.io/tunnel` | default "http"  | quote }}
              {{- end }}
              service.istio.io/canonical-name: {{ index .ObjectMeta.Labels `service.istio.io/canonical-name` | default (index .ObjectMeta.Labels `app.kubernetes.io/name`) | default (index .ObjectMeta.Labels `app`) | default .DeploymentMeta.Name  | quote }}
              service.istio.io/canonical-revision: {{ index .ObjectMeta.Labels `service.istio.io/canonical-revision` | default (index .ObjectMeta.Labels `app.kubernetes.io/version`) | default (index .ObjectMeta.Labels `version`) | default "latest"  | quote }}
            annotations: {
              istio.io/rev: {{ .Revision | default "default" | quote }},
              {{- if ge (len $containers) 1 }}
              {{- if not (isset .ObjectMeta.Annotations `kubectl.kubernetes.io/default-logs-container`) }}
              kubectl.kubernetes.io/default-logs-container: "{{ index $containers 0 }}",
              {{- end }}
              {{- if not (isset .ObjectMeta.Annotations `kubectl.kubernetes.io/default-container`) }}
              kubectl.kubernetes.io/default-container: "{{ index $containers 0 }}",
              {{- end }}
              {{- end }}
          {{- if .Values.istio_cni.enabled }}
              {{- if not .Values.istio_cni.chained }}
              k8s.v1.cni.cncf.io/networks: '{{ appendMultusNetwork (index .ObjectMeta.Annotations `k8s.v1.cni.cncf.io/networks`) `default/istio-cni` }}',
              {{- end }}
              sidecar.istio.io/interceptionMode: "{{ annotation .ObjectMeta `sidecar.istio.io/interceptionMode` .ProxyConfig.InterceptionMode }}",
              {{ with annotation .ObjectMeta `traffic.sidecar.istio.io/includeOutboundIPRanges` .Values.global.proxy.includeIPRanges }}traffic.sidecar.istio.io/includeOutboundIPRanges: "{{.}}",{{ end }}
              {{ with annotation .ObjectMeta `traffic.sidecar.istio.io/excludeOutboundIPRanges` .Values.global.proxy.excludeIPRanges }}traffic.sidecar.istio.io/excludeOutboundIPRanges: "{{.}}",{{ end }}
              {{ with annotation .ObjectMeta `traffic.sidecar.istio.io/includeInboundPorts` .Values.global.proxy.includeInboundPorts }}traffic.sidecar.istio.io/includeInboundPorts: "{{.}}",{{ end }}
              traffic.sidecar.istio.io/excludeInboundPorts: "{{ excludeInboundPort (annotation .ObjectMeta `status.sidecar.istio.io/port` .Values.global.proxy.statusPort) (annotation .ObjectMeta `traffic.sidecar.istio.io/excludeInboundPorts` .Values.global.proxy.excludeInboundPorts) }}",
              {{ if or (isset .ObjectMeta.Annotations `traffic.sidecar.istio.io/includeOutboundPorts`) (ne (valueOrDefault .Values.global.proxy.includeOutboundPorts "") "") }}
              traffic.sidecar.istio.io/includeOutboundPorts: "{{ annotation .ObjectMeta `traffic.sidecar.istio.io/includeOutboundPorts` .Values.global.proxy.includeOutboundPorts }}",
              {{- end }}
              {{ if or (isset .ObjectMeta.Annotations `traffic.sidecar.istio.io/excludeOutboundPorts`) (ne .Values.global.proxy.excludeOutboundPorts "") }}
              traffic.sidecar.istio.io/excludeOutboundPorts: "{{ annotation .ObjectMeta `traffic.sidecar.istio.io/excludeOutboundPorts` .Values.global.proxy.excludeOutboundPorts }}",
              {{- end }}
              {{ with index .ObjectMeta.Annotations `traffic.sidecar.istio.io/kubevirtInterfaces` }}traffic.sidecar.istio.io/kubevirtInterfaces: "{{.}}",{{ end }}
              {{ with index .ObjectMeta.Annotations `traffic.sidecar.istio.io/excludeInterfaces` }}traffic.sidecar.istio.io/excludeInterfaces: "{{.}}",{{ end }}
          {{- end }}
            }
          spec:
            {{- $holdProxy := or .ProxyConfig.HoldApplicationUntilProxyStarts.GetValue .Values.global.proxy.holdApplicationUntilProxyStarts }}
            initContainers:
            {{ if ne (annotation .ObjectMeta `sidecar.istio.io/interceptionMode` .ProxyConfig.InterceptionMode) `NONE` }}
            {{ if .Values.istio_cni.enabled -}}
            - name: istio-validation
            {{ else -}}
            - name: istio-init
            {{ end -}}
            {{- if contains "/" (annotation .ObjectMeta `sidecar.istio.io/proxyImage` .Values.global.proxy_init.image) }}
              image: "{{ annotation .ObjectMeta `sidecar.istio.io/proxyImage` .Values.global.proxy_init.image }}"
            {{- else }}
              image: "{{ .ProxyImage }}"
            {{- end }}
              args:
              - istio-iptables
              - "-p"
              - {{ .MeshConfig.ProxyListenPort | default "15001" | quote }}
              - "-z"
              - {{ .MeshConfig.ProxyInboundListenPort | default "15006" | quote }}
              - "-u"
              - {{ .ProxyUID | default "1337" | quote }}
              - "-m"
              - "{{ annotation .ObjectMeta `sidecar.istio.io/interceptionMode` .ProxyConfig.InterceptionMode }}"
              - "-i"
              - "{{ annotation .ObjectMeta `traffic.sidecar.istio.io/includeOutboundIPRanges` .Values.global.proxy.includeIPRanges }}"
              - "-x"
              - "{{ annotation .ObjectMeta `traffic.sidecar.istio.io/excludeOutboundIPRanges` .Values.global.proxy.excludeIPRanges }}"
              - "-b"
              - "{{ annotation .ObjectMeta `traffic.sidecar.istio.io/includeInboundPorts` .Values.global.proxy.includeInboundPorts }}"
              - "-d"
            {{- if excludeInboundPort (annotation .ObjectMeta `status.sidecar.istio.io/port` .Values.global.proxy.statusPort) (annotation .ObjectMeta `traffic.sidecar.istio.io/excludeInboundPorts` .Values.global.proxy.excludeInboundPorts) }}
              - "15090,15021,{{ excludeInboundPort (annotation .ObjectMeta `status.sidecar.istio.io/port` .Values.global.proxy.statusPort) (annotation .ObjectMeta `traffic.sidecar.istio.io/excludeInboundPorts` .Values.global.proxy.excludeInboundPorts) }}"
            {{- else }}
              - "15090,15021"
            {{- end }}
              {{ if or (isset .ObjectMeta.Annotations `traffic.sidecar.istio.io/includeOutboundPorts`) (ne (valueOrDefault .Values.global.proxy.includeOutboundPorts "") "") -}}
              - "-q"
              - "{{ annotation .ObjectMeta `traffic.sidecar.istio.io/includeOutboundPorts` .Values.global.proxy.includeOutboundPorts }}"
              {{ end -}}
              {{ if or (isset .ObjectMeta.Annotations `traffic.sidecar.istio.io/excludeOutboundPorts`) (ne (valueOrDefault .Values.global.proxy.excludeOutboundPorts "") "") -}}
              - "-o"
              - "{{ annotation .ObjectMeta `traffic.sidecar.istio.io/excludeOutboundPorts` .Values.global.proxy.excludeOutboundPorts }}"
              {{ end -}}
              {{ if (isset .ObjectMeta.Annotations `traffic.sidecar.istio.io/kubevirtInterfaces`) -}}
              - "-k"
              - "{{ index .ObjectMeta.Annotations `traffic.sidecar.istio.io/kubevirtInterfaces` }}"
              {{ end -}}
               {{ if (isset .ObjectMeta.Annotations `traffic.sidecar.istio.io/excludeInterfaces`) -}}
              - "-c"
              - "{{ index .ObjectMeta.Annotations `traffic.sidecar.istio.io/excludeInterfaces` }}"
              {{ end -}}
              - "--log_output_level={{ annotation .ObjectMeta `sidecar.istio.io/agentLogLevel` .Values.global.logging.level }}"
              {{ if .Values.global.logAsJson -}}
              - "--log_as_json"
              {{ end -}}
              {{ if .Values.istio_cni.enabled -}}
              - "--run-validation"
              - "--skip-rule-apply"
              {{ end -}}
              {{with .Values.global.imagePullPolicy }}imagePullPolicy: "{{.}}"{{end}}
            {{- if .ProxyConfig.ProxyMetadata }}
              env:
              {{- range $key, $value := .ProxyConfig.ProxyMetadata }}
              - name: {{ $key }}
                value: "{{ $value }}"
              {{- end }}
            {{- end }}
              resources:
            {{ template "resources" . }}
              securityContext:
                allowPrivilegeEscalation: {{ .Values.global.proxy.privileged }}
                privileged: {{ .Values.global.proxy.privileged }}
                capabilities:
              {{- if not .Values.istio_cni.enabled }}
                  add:
                  - NET_ADMIN
                  - NET_RAW
              {{- end }}
                  drop:
                  - ALL
              {{- if not .Values.istio_cni.enabled }}
                readOnlyRootFilesystem: false
                runAsGroup: 0
                runAsNonRoot: false
                runAsUser: 0
              {{- else }}
                readOnlyRootFilesystem: true
                runAsGroup: {{ .ProxyGID | default "1337" }}
                runAsUser: {{ .ProxyUID | default "1337" }}
                runAsNonRoot: true
              {{- end }}
            {{ end -}}
            {{- if eq (annotation .ObjectMeta `sidecar.istio.io/enableCoreDump` .Values.global.proxy.enableCoreDump) "true" }}
            - name: enable-core-dump
              args:
              - -c
              - sysctl -w kernel.core_pattern=/var/lib/istio/data/core.proxy && ulimit -c unlimited
              command:
                - /bin/sh
            {{- if contains "/" (annotation .ObjectMeta `sidecar.istio.io/proxyImage` .Values.global.proxy_init.image) }}
              image: "{{ annotation .ObjectMeta `sidecar.istio.io/proxyImage` .Values.global.proxy_init.image }}"
            {{- else }}
              image: "{{ .ProxyImage }}"
            {{- end }}
              {{with .Values.global.imagePullPolicy }}imagePullPolicy: "{{.}}"{{end}}
              resources:
            {{ template "resources" . }}
              securityContext:
                allowPrivilegeEscalation: true
                capabilities:
                  add:
                  - SYS_ADMIN
                  drop:
                  - ALL
                privileged: true
                readOnlyRootFilesystem: false
                runAsGroup: 0
                runAsNonRoot: false
                runAsUser: 0
            {{ end }}
            {{ if not $nativeSidecar }}
            containers:
            {{ end }}
            - name: istio-proxy
            {{- if contains "/" (annotation .ObjectMeta `sidecar.istio.io/proxyImage` .Values.global.proxy.image) }}
              image: "{{ annotation .ObjectMeta `sidecar.istio.io/proxyImage` .Values.global.proxy.image }}"
            {{- else }}
              image: "{{ .ProxyImage }}"
            {{- end }}
              {{ if $nativeSidecar }}restartPolicy: Always{{end}}
              ports:
              - containerPort: 15090
                protocol: TCP
                name: http-envoy-prom
              args:
              - proxy
              - sidecar
              - --domain
              - $(POD_NAMESPACE).svc.{{ .Values.global.proxy.clusterDomain }}
              - --proxyLogLevel={{ annotation .ObjectMeta `sidecar.istio.io/logLevel` .Values.global.proxy.logLevel }}
              - --proxyComponentLogLevel={{ annotation .ObjectMeta `sidecar.istio.io/componentLogLevel` .Values.global.proxy.componentLogLevel }}
              - --log_output_level={{ annotation .ObjectMeta `sidecar.istio.io/agentLogLevel` .Values.global.logging.level }}
            {{- if .Values.global.sts.servicePort }}
              - --stsPort={{ .Values.global.sts.servicePort }}
            {{- end }}
            {{- if .Values.global.logAsJson }}
              - --log_as_json
            {{- end }}
            {{- if .Values.global.proxy.lifecycle }}
              lifecycle:
                {{ toYaml .Values.global.proxy.lifecycle | indent 6 }}
            {{- else if $holdProxy }}
              lifecycle:
                postStart:
                  exec:
                    command:
                    - pilot-agent
                    - wait
            {{- end }}
              env:
              {{- if eq (env "PILOT_ENABLE_INBOUND_PASSTHROUGH" "true") "false" }}
              - name: REWRITE_PROBE_LEGACY_LOCALHOST_DESTINATION
                value: "true"
              {{- end }}
              - name: JWT_POLICY
                value: {{ .Values.global.jwtPolicy }}
              - name: PILOT_CERT_PROVIDER
                value: {{ .Values.global.pilotCertProvider }}
              - name: CA_ADDR
              {{- if .Values.global.caAddress }}
                value: {{ .Values.global.caAddress }}
              {{- else }}
                value: istiod{{- if not (eq .Values.revision "") }}-{{ .Values.revision }}{{- end }}.{{ .Values.global.istioNamespace }}.svc:15012
              {{- end }}
              - name: POD_NAME
                valueFrom:
                  fieldRef:
                    fieldPath: metadata.name
              - name: POD_NAMESPACE
                valueFrom:
                  fieldRef:
                    fieldPath: metadata.namespace
              - name: INSTANCE_IP
                valueFrom:
                  fieldRef:
                    fieldPath: status.podIP
              - name: SERVICE_ACCOUNT
                valueFrom:
                  fieldRef:
                    fieldPath: spec.serviceAccountName
              - name: HOST_IP
                valueFrom:
                  fieldRef:
                    fieldPath: status.hostIP
              - name: ISTIO_CPU_LIMIT
                valueFrom:
                  resourceFieldRef:
                    resource: limits.cpu
              - name: PROXY_CONFIG
                value: |
                       {{ protoToJSON .ProxyConfig }}
              - name: ISTIO_META_POD_PORTS
                value: |-
                  [
                  {{- $first := true }}
                  {{- range $index1, $c := .Spec.Containers }}
                    {{- range $index2, $p := $c.Ports }}
                      {{- if (structToJSON $p) }}
                      {{if not $first}},{{end}}{{ structToJSON $p }}
                      {{- $first = false }}
                      {{- end }}
                    {{- end}}
                  {{- end}}
                  ]
              - name: ISTIO_META_APP_CONTAINERS
                value: "{{ $containers | join "," }}"
              - name: GOMEMLIMIT
                valueFrom:
                  resourceFieldRef:
                    resource: limits.memory
              - name: GOMAXPROCS
                valueFrom:
                  resourceFieldRef:
                    resource: limits.cpu
              - name: ISTIO_META_CLUSTER_ID
                value: "{{ valueOrDefault .Values.global.multiCluster.clusterName `Kubernetes` }}"
              - name: ISTIO_META_NODE_NAME
                valueFrom:
                  fieldRef:
                    fieldPath: spec.nodeName
              - name: ISTIO_META_INTERCEPTION_MODE
                value: "{{ or (index .ObjectMeta.Annotations `sidecar.istio.io/interceptionMode`) .ProxyConfig.InterceptionMode.String }}"
              {{- if .Values.global.network }}
              - name: ISTIO_META_NETWORK
                value: "{{ .Values.global.network }}"
              {{- end }}
              {{- if .DeploymentMeta.Name }}
              - name: ISTIO_META_WORKLOAD_NAME
                value: "{{ .DeploymentMeta.Name }}"
              {{ end }}
              {{- if and .TypeMeta.APIVersion .DeploymentMeta.Name }}
              - name: ISTIO_META_OWNER
                value: kubernetes://apis/{{ .TypeMeta.APIVersion }}/namespaces/{{ valueOrDefault .DeploymentMeta.Namespace `default` }}/{{ toLower .TypeMeta.Kind}}s/{{ .DeploymentMeta.Name }}
              {{- end}}
              {{- if (isset .ObjectMeta.Annotations `sidecar.istio.io/bootstrapOverride`) }}
              - name: ISTIO_BOOTSTRAP_OVERRIDE
                value: "/etc/istio/custom-bootstrap/custom_bootstrap.json"
              {{- end }}
              {{- if .Values.global.meshID }}
              - name: ISTIO_META_MESH_ID
                value: "{{ .Values.global.meshID }}"
              {{- else if (valueOrDefault .MeshConfig.TrustDomain .Values.global.trustDomain) }}
              - name: ISTIO_META_MESH_ID
                value: "{{ (valueOrDefault .MeshConfig.TrustDomain .Values.global.trustDomain) }}"
              {{- end }}
              {{- with (valueOrDefault .MeshConfig.TrustDomain .Values.global.trustDomain)  }}
              - name: TRUST_DOMAIN
                value: "{{ . }}"
              {{- end }}
              {{- if and (eq .Values.global.proxy.tracer "datadog") (isset .ObjectMeta.Annotations `apm.datadoghq.com/env`) }}
              {{- range $key, $value := fromJSON (index .ObjectMeta.Annotations `apm.datadoghq.com/env`) }}
              - name: {{ $key }}
                value: "{{ $value }}"
              {{- end }}
              {{- end }}
              {{- range $key, $value := .ProxyConfig.ProxyMetadata }}
              - name: {{ $key }}
                value: "{{ $value }}"
              {{- end }}
              {{with .Values.global.imagePullPolicy }}imagePullPolicy: "{{.}}"{{end}}
              {{ if ne (annotation .ObjectMeta `status.sidecar.istio.io/port` .Values.global.proxy.statusPort) `0` }}
            {{ if .Values.global.proxy.startupProbe.enabled }}
              startupProbe:
                httpGet:
                  path: /healthz/ready
                  port: 15021
                initialDelaySeconds: 0
                periodSeconds: 1
                timeoutSeconds: 3
                failureThreshold: {{ .Values.global.proxy.startupProbe.failureThreshold }}
            {{ end }}
              readinessProbe:
                httpGet:
                  path: /healthz/ready
                  port: 15021
                initialDelaySeconds: {{ annotation .ObjectMeta `readiness.status.sidecar.istio.io/initialDelaySeconds` .Values.global.proxy.readinessInitialDelaySeconds }}
                periodSeconds: {{ annotation .ObjectMeta `readiness.status.sidecar.istio.io/periodSeconds` .Values.global.proxy.readinessPeriodSeconds }}
                timeoutSeconds: 3
                failureThreshold: {{ annotation .ObjectMeta `readiness.status.sidecar.istio.io/failureThreshold` .Values.global.proxy.readinessFailureThreshold }}
              {{ end -}}
              securityContext:
                {{- if eq (index .ProxyConfig.ProxyMetadata "IPTABLES_TRACE_LOGGING") "true" }}
                allowPrivilegeEscalation: true
                capabilities:
                  add:
                  - NET_ADMIN
                  drop:
                  - ALL
                privileged: true
                readOnlyRootFilesystem: {{ ne (annotation .ObjectMeta `sidecar.istio.io/enableCoreDump` .Values.global.proxy.enableCoreDump) "true" }}
                runAsGroup: {{ .ProxyGID | default "1337" }}
                runAsNonRoot: false
                runAsUser: 0
                {{- else }}
                allowPrivilegeEscalation: {{ .Values.global.proxy.privileged }}
                capabilities:
                  {{ if or (eq (annotation .ObjectMeta `sidecar.istio.io/interceptionMode` .ProxyConfig.InterceptionMode) `TPROXY`) (eq (annotation .ObjectMeta `sidecar.istio.io/capNetBindService` .Values.global.proxy.capNetBindService) `true`) -}}
                  add:
                  {{ if eq (annotation .ObjectMeta `sidecar.istio.io/interceptionMode` .ProxyConfig.InterceptionMode) `TPROXY` -}}
                  - NET_ADMIN
                  {{- end }}
                  {{ if eq (annotation .ObjectMeta `sidecar.istio.io/capNetBindService` .Values.global.proxy.capNetBindService) `true` -}}
                  - NET_BIND_SERVICE
                  {{- end }}
                  {{- end }}
                  drop:
                  - ALL
                privileged: {{ .Values.global.proxy.privileged }}
                readOnlyRootFilesystem: {{ ne (annotation .ObjectMeta `sidecar.istio.io/enableCoreDump` .Values.global.proxy.enableCoreDump) "true" }}
                runAsGroup: {{ .ProxyGID | default "1337" }}
                {{ if or (eq (annotation .ObjectMeta `sidecar.istio.io/interceptionMode` .ProxyConfig.InterceptionMode) `TPROXY`) (eq (annotation .ObjectMeta `sidecar.istio.io/capNetBindService` .Values.global.proxy.capNetBindService) `true`) -}}
                runAsNonRoot: false
                runAsUser: 0
                {{- else -}}
                runAsNonRoot: true
                runAsUser: {{ .ProxyUID | default "1337" }}
                {{- end }}
                {{- end }}
              resources:
            {{ template "resources" . }}
              volumeMounts:
              - name: workload-socket
                mountPath: /var/run/secrets/workload-spiffe-uds
              - name: credential-socket
                mountPath: /var/run/secrets/credential-uds
              {{- if eq .Values.global.caName "GkeWorkloadCertificate" }}
              - name: gke-workload-certificate
                mountPath: /var/run/secrets/workload-spiffe-credentials
                readOnly: true
              {{- else }}
              - name: workload-certs
                mountPath: /var/run/secrets/workload-spiffe-credentials
              {{- end }}
              {{- if eq .Values.global.pilotCertProvider "istiod" }}
              - mountPath: /var/run/secrets/istio
                name: istiod-ca-cert
              {{- end }}
              {{- if eq .Values.global.pilotCertProvider "kubernetes" }}
              - mountPath: /var/run/secrets/istio/kubernetes
                name: kube-ca-cert
              {{- end }}
              - mountPath: /var/lib/istio/data
                name: istio-data
              {{ if (isset .ObjectMeta.Annotations `sidecar.istio.io/bootstrapOverride`) }}
              - mountPath: /etc/istio/custom-bootstrap
                name: custom-bootstrap-volume
              {{- end }}
              # SDS channel between istioagent and Envoy
              - mountPath: /etc/istio/proxy
                name: istio-envoy
              {{- if eq .Values.global.jwtPolicy "third-party-jwt" }}
              - mountPath: /var/run/secrets/tokens
                name: istio-token
              {{- end }}
              {{- if .Values.global.mountMtlsCerts }}
              # Use the key and cert mounted to /etc/certs/ for the in-cluster mTLS communications.
              - mountPath: /etc/certs/
                name: istio-certs
                readOnly: true
              {{- end }}
              - name: istio-podinfo
                mountPath: /etc/istio/pod
               {{- if and (eq .Values.global.proxy.tracer "lightstep") .ProxyConfig.GetTracing.GetTlsSettings }}
              - mountPath: {{ directory .ProxyConfig.GetTracing.GetTlsSettings.GetCaCertificates }}
                name: lightstep-certs
                readOnly: true
              {{- end }}
                {{- if isset .ObjectMeta.Annotations `sidecar.istio.io/userVolumeMount` }}
                {{ range $index, $value := fromJSON (index .ObjectMeta.Annotations `sidecar.istio.io/userVolumeMount`) }}
              - name: "{{  $index }}"
                {{ toYaml $value | indent 6 }}
                {{ end }}
                {{- end }}
            volumes:
            - emptyDir:
              name: workload-socket
            - emptyDir:
              name: credential-socket
            {{- if eq .Values.global.caName "GkeWorkloadCertificate" }}
            - name: gke-workload-certificate
              csi:
                driver: workloadcertificates.security.cloud.google.com
            {{- else }}
            - emptyDir:
              name: workload-certs
            {{- end }}
            {{- if (isset .ObjectMeta.Annotations `sidecar.istio.io/bootstrapOverride`) }}
            - name: custom-bootstrap-volume
              configMap:
                name: {{ annotation .ObjectMeta `sidecar.istio.io/bootstrapOverride` "" }}
            {{- end }}
            # SDS channel between istioagent and Envoy
            - emptyDir:
                medium: Memory
              name: istio-envoy
            - name: istio-data
              emptyDir: {}
            - name: istio-podinfo
              downwardAPI:
                items:
                  - path: "labels"
                    fieldRef:
                      fieldPath: metadata.labels
                  - path: "annotations"
                    fieldRef:
                      fieldPath: metadata.annotations
            {{- if eq .Values.global.jwtPolicy "third-party-jwt" }}
            - name: istio-token
              projected:
                sources:
                - serviceAccountToken:
                    path: istio-token
                    expirationSeconds: 43200
                    audience: {{ .Values.global.sds.token.aud }}
            {{- end }}
            {{- if eq .Values.global.pilotCertProvider "istiod" }}
            - name: istiod-ca-cert
              configMap:
                name: istio-ca-root-cert
            {{- end }}
            {{- if eq .Values.global.pilotCertProvider "kubernetes" }}
            - name: kube-ca-cert
              configMap:
                name: kube-root-ca.crt
            {{- end }}
            {{- if .Values.global.mountMtlsCerts }}
            # Use the key and cert mounted to /etc/certs/ for the in-cluster mTLS communications.
            - name: istio-certs
              secret:
                optional: true
                {{ if eq .Spec.ServiceAccountName "" }}
                secretName: istio.default
                {{ else -}}
                secretName: {{  printf "istio.%s" .Spec.ServiceAccountName }}
                {{  end -}}
            {{- end }}
              {{- if isset .ObjectMeta.Annotations `sidecar.istio.io/userVolume` }}
              {{range $index, $value := fromJSON (index .ObjectMeta.Annotations `sidecar.istio.io/userVolume`) }}
            - name: "{{ $index }}"
              {{ toYaml $value | indent 4 }}
              {{ end }}
              {{ end }}
            {{- if and (eq .Values.global.proxy.tracer "lightstep") .ProxyConfig.GetTracing.GetTlsSettings }}
            - name: lightstep-certs
              secret:
                optional: true
                secretName: lightstep.cacert
            {{- end }}
            {{- if .Values.global.imagePullSecrets }}
            imagePullSecrets:
              {{- range .Values.global.imagePullSecrets }}
              - name: {{ . }}
              {{- end }}
            {{- end }}
        gateway: |
          {{- $containers := list }}
          {{- range $index, $container := .Spec.Containers }}{{ if not (eq $container.Name "istio-proxy") }}{{ $containers = append $containers $container.Name }}{{end}}{{- end}}
          metadata:
            labels:
              service.istio.io/canonical-name: {{ index .ObjectMeta.Labels `service.istio.io/canonical-name` | default (index .ObjectMeta.Labels `app.kubernetes.io/name`) | default (index .ObjectMeta.Labels `app`) | default .DeploymentMeta.Name  | quote }}
              service.istio.io/canonical-revision: {{ index .ObjectMeta.Labels `service.istio.io/canonical-revision` | default (index .ObjectMeta.Labels `app.kubernetes.io/version`) | default (index .ObjectMeta.Labels `version`) | default "latest"  | quote }}
            annotations: {
              istio.io/rev: {{ .Revision | default "default" | quote }},
              {{- if eq (len $containers) 1 }}
              kubectl.kubernetes.io/default-logs-container: "{{ index $containers 0 }}",
              kubectl.kubernetes.io/default-container: "{{ index $containers 0 }}",
              {{ end }}
            }
          spec:
            securityContext:
              sysctls:
              - name: net.ipv4.ip_unprivileged_port_start
                value: "0"
            containers:
            - name: istio-proxy
            {{- if contains "/" .Values.global.proxy.image }}
              image: "{{ annotation .ObjectMeta `sidecar.istio.io/proxyImage` .Values.global.proxy.image }}"
            {{- else }}
              image: "{{ .ProxyImage }}"
            {{- end }}
              ports:
              - containerPort: 15090
                protocol: TCP
                name: http-envoy-prom
              args:
              - proxy
              - router
              - --domain
              - $(POD_NAMESPACE).svc.{{ .Values.global.proxy.clusterDomain }}
              - --proxyLogLevel={{ annotation .ObjectMeta `sidecar.istio.io/logLevel` .Values.global.proxy.logLevel }}
              - --proxyComponentLogLevel={{ annotation .ObjectMeta `sidecar.istio.io/componentLogLevel` .Values.global.proxy.componentLogLevel }}
              - --log_output_level={{ annotation .ObjectMeta `sidecar.istio.io/agentLogLevel` .Values.global.logging.level }}
            {{- if .Values.global.sts.servicePort }}
              - --stsPort={{ .Values.global.sts.servicePort }}
            {{- end }}
            {{- if .Values.global.logAsJson }}
              - --log_as_json
            {{- end }}
            {{- if .Values.global.proxy.lifecycle }}
              lifecycle:
                {{ toYaml .Values.global.proxy.lifecycle | indent 6 }}
            {{- end }}
              securityContext:
                runAsUser: {{ .ProxyUID | default "1337" }}
                runAsGroup: {{ .ProxyGID | default "1337" }}
              env:
              - name: JWT_POLICY
                value: {{ .Values.global.jwtPolicy }}
              - name: PILOT_CERT_PROVIDER
                value: {{ .Values.global.pilotCertProvider }}
              - name: CA_ADDR
              {{- if .Values.global.caAddress }}
                value: {{ .Values.global.caAddress }}
              {{- else }}
                value: istiod{{- if not (eq .Values.revision "") }}-{{ .Values.revision }}{{- end }}.{{ .Values.global.istioNamespace }}.svc:15012
              {{- end }}
              - name: POD_NAME
                valueFrom:
                  fieldRef:
                    fieldPath: metadata.name
              - name: POD_NAMESPACE
                valueFrom:
                  fieldRef:
                    fieldPath: metadata.namespace
              - name: INSTANCE_IP
                valueFrom:
                  fieldRef:
                    fieldPath: status.podIP
              - name: SERVICE_ACCOUNT
                valueFrom:
                  fieldRef:
                    fieldPath: spec.serviceAccountName
              - name: HOST_IP
                valueFrom:
                  fieldRef:
                    fieldPath: status.hostIP
              - name: ISTIO_CPU_LIMIT
                valueFrom:
                  resourceFieldRef:
                    resource: limits.cpu
              - name: PROXY_CONFIG
                value: |
                       {{ protoToJSON .ProxyConfig }}
              - name: ISTIO_META_POD_PORTS
                value: |-
                  [
                  {{- $first := true }}
                  {{- range $index1, $c := .Spec.Containers }}
                    {{- range $index2, $p := $c.Ports }}
                      {{- if (structToJSON $p) }}
                      {{if not $first}},{{end}}{{ structToJSON $p }}
                      {{- $first = false }}
                      {{- end }}
                    {{- end}}
                  {{- end}}
                  ]
              - name: GOMEMLIMIT
                valueFrom:
                  resourceFieldRef:
                    resource: limits.memory
              - name: GOMAXPROCS
                valueFrom:
                  resourceFieldRef:
                    resource: limits.cpu
              - name: ISTIO_META_APP_CONTAINERS
                value: "{{ $containers | join "," }}"
              - name: ISTIO_META_CLUSTER_ID
                value: "{{ valueOrDefault .Values.global.multiCluster.clusterName `Kubernetes` }}"
              - name: ISTIO_META_NODE_NAME
                valueFrom:
                  fieldRef:
                    fieldPath: spec.nodeName
              - name: ISTIO_META_INTERCEPTION_MODE
                value: "{{ .ProxyConfig.InterceptionMode.String }}"
              {{- if .Values.global.network }}
              - name: ISTIO_META_NETWORK
                value: "{{ .Values.global.network }}"
              {{- end }}
              {{- if .DeploymentMeta.Name }}
              - name: ISTIO_META_WORKLOAD_NAME
                value: "{{ .DeploymentMeta.Name }}"
              {{ end }}
              {{- if and .TypeMeta.APIVersion .DeploymentMeta.Name }}
              - name: ISTIO_META_OWNER
                value: kubernetes://apis/{{ .TypeMeta.APIVersion }}/namespaces/{{ valueOrDefault .DeploymentMeta.Namespace `default` }}/{{ toLower .TypeMeta.Kind}}s/{{ .DeploymentMeta.Name }}
              {{- end}}
              {{- if .Values.global.meshID }}
              - name: ISTIO_META_MESH_ID
                value: "{{ .Values.global.meshID }}"
              {{- else if (valueOrDefault .MeshConfig.TrustDomain .Values.global.trustDomain) }}
              - name: ISTIO_META_MESH_ID
                value: "{{ (valueOrDefault .MeshConfig.TrustDomain .Values.global.trustDomain) }}"
              {{- end }}
              {{- with (valueOrDefault .MeshConfig.TrustDomain .Values.global.trustDomain)  }}
              - name: TRUST_DOMAIN
                value: "{{ . }}"
              {{- end }}
              {{- range $key, $value := .ProxyConfig.ProxyMetadata }}
              - name: {{ $key }}
                value: "{{ $value }}"
              {{- end }}
              {{with .Values.global.imagePullPolicy }}imagePullPolicy: "{{.}}"{{end}}
              readinessProbe:
                httpGet:
                  path: /healthz/ready
                  port: 15021
                initialDelaySeconds: {{.Values.global.proxy.readinessInitialDelaySeconds }}
                periodSeconds: {{ .Values.global.proxy.readinessPeriodSeconds }}
                timeoutSeconds: 3
                failureThreshold: {{ .Values.global.proxy.readinessFailureThreshold }}
              volumeMounts:
              - name: workload-socket
                mountPath: /var/run/secrets/workload-spiffe-uds
              - name: credential-socket
                mountPath: /var/run/secrets/credential-uds
              {{- if eq .Values.global.caName "GkeWorkloadCertificate" }}
              - name: gke-workload-certificate
                mountPath: /var/run/secrets/workload-spiffe-credentials
                readOnly: true
              {{- else }}
              - name: workload-certs
                mountPath: /var/run/secrets/workload-spiffe-credentials
              {{- end }}
              {{- if eq .Values.global.pilotCertProvider "istiod" }}
              - mountPath: /var/run/secrets/istio
                name: istiod-ca-cert
              {{- end }}
              - mountPath: /var/lib/istio/data
                name: istio-data
              # SDS channel between istioagent and Envoy
              - mountPath: /etc/istio/proxy
                name: istio-envoy
              {{- if eq .Values.global.jwtPolicy "third-party-jwt" }}
              - mountPath: /var/run/secrets/tokens
                name: istio-token
              {{- end }}
              {{- if .Values.global.mountMtlsCerts }}
              # Use the key and cert mounted to /etc/certs/ for the in-cluster mTLS communications.
              - mountPath: /etc/certs/
                name: istio-certs
                readOnly: true
              {{- end }}
              - name: istio-podinfo
                mountPath: /etc/istio/pod
            volumes:
            - emptyDir: {}
              name: workload-socket
            - emptyDir: {}
              name: credential-socket
            {{- if eq .Values.global.caName "GkeWorkloadCertificate" }}
            - name: gke-workload-certificate
              csi:
                driver: workloadcertificates.security.cloud.google.com
            {{- else}}
            - emptyDir: {}
              name: workload-certs
            {{- end }}
            # SDS channel between istioagent and Envoy
            - emptyDir:
                medium: Memory
              name: istio-envoy
            - name: istio-data
              emptyDir: {}
            - name: istio-podinfo
              downwardAPI:
                items:
                  - path: "labels"
                    fieldRef:
                      fieldPath: metadata.labels
                  - path: "annotations"
                    fieldRef:
                      fieldPath: metadata.annotations
            {{- if eq .Values.global.jwtPolicy "third-party-jwt" }}
            - name: istio-token
              projected:
                sources:
                - serviceAccountToken:
                    path: istio-token
                    expirationSeconds: 43200
                    audience: {{ .Values.global.sds.token.aud }}
            {{- end }}
            {{- if eq .Values.global.pilotCertProvider "istiod" }}
            - name: istiod-ca-cert
              configMap:
                name: istio-ca-root-cert
            {{- end }}
            {{- if .Values.global.mountMtlsCerts }}
            # Use the key and cert mounted to /etc/certs/ for the in-cluster mTLS communications.
            - name: istio-certs
              secret:
                optional: true
                {{ if eq .Spec.ServiceAccountName "" }}
                secretName: istio.default
                {{ else -}}
                secretName: {{  printf "istio.%s" .Spec.ServiceAccountName }}
                {{  end -}}
            {{- end }}
            {{- if .Values.global.imagePullSecrets }}
            imagePullSecrets:
              {{- range .Values.global.imagePullSecrets }}
              - name: {{ . }}
              {{- end }}
            {{- end }}
        grpc-simple: |
          metadata:
            annotations:
              sidecar.istio.io/rewriteAppHTTPProbers: "false"
          spec:
            initContainers:
              - name: grpc-bootstrap-init
                image: busybox:1.28
                volumeMounts:
                  - mountPath: /var/lib/grpc/data/
                    name: grpc-io-proxyless-bootstrap
                env:
                  - name: INSTANCE_IP
                    valueFrom:
                      fieldRef:
                        fieldPath: status.podIP
                  - name: POD_NAME
                    valueFrom:
                      fieldRef:
                        fieldPath: metadata.name
                  - name: POD_NAMESPACE
                    valueFrom:
                      fieldRef:
                        fieldPath: metadata.namespace
                  - name: ISTIO_NAMESPACE
                    value: |
                       {{ .Values.global.istioNamespace }}
                command:
                  - sh
                  - "-c"
                  - |-
                    NODE_ID="sidecar~$${INSTANCE_IP}~$${POD_NAME}.$${POD_NAMESPACE}~cluster.local"
                    SERVER_URI="dns:///istiod.$${ISTIO_NAMESPACE}.svc:15010"
                    echo '
                    {
                      "xds_servers": [
                        {
                          "server_uri": "'$${SERVER_URI}'",
                          "channel_creds": [{"type": "insecure"}],
                          "server_features" : ["xds_v3"]
                        }
                      ],
                      "node": {
                        "id": "'$${NODE_ID}'",
                        "metadata": {
                          "GENERATOR": "grpc"
                        }
                      }
                    }' > /var/lib/grpc/data/bootstrap.json
            containers:
            {{- range $index, $container := .Spec.Containers }}
            - name: {{ $container.Name }}
              env:
                - name: GRPC_XDS_BOOTSTRAP
                  value: /var/lib/grpc/data/bootstrap.json
                - name: GRPC_GO_LOG_VERBOSITY_LEVEL
                  value: "99"
                - name: GRPC_GO_LOG_SEVERITY_LEVEL
                  value: info
              volumeMounts:
                - mountPath: /var/lib/grpc/data/
                  name: grpc-io-proxyless-bootstrap
            {{- end }}
            volumes:
              - name: grpc-io-proxyless-bootstrap
                emptyDir: {}
        grpc-agent: |
          {{- define "resources"  }}
            {{- if or (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyCPU`) (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyMemory`) (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyCPULimit`) (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyMemoryLimit`) }}
              {{- if or (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyCPU`) (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyMemory`) }}
                requests:
                  {{ if (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyCPU`) -}}
                  cpu: "{{ index .ObjectMeta.Annotations `sidecar.istio.io/proxyCPU` }}"
                  {{ end }}
                  {{ if (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyMemory`) -}}
                  memory: "{{ index .ObjectMeta.Annotations `sidecar.istio.io/proxyMemory` }}"
                  {{ end }}
              {{- end }}
              {{- if or (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyCPULimit`) (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyMemoryLimit`) }}
                limits:
                  {{ if (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyCPULimit`) -}}
                  cpu: "{{ index .ObjectMeta.Annotations `sidecar.istio.io/proxyCPULimit` }}"
                  {{ end }}
                  {{ if (isset .ObjectMeta.Annotations `sidecar.istio.io/proxyMemoryLimit`) -}}
                  memory: "{{ index .ObjectMeta.Annotations `sidecar.istio.io/proxyMemoryLimit` }}"
                  {{ end }}
              {{- end }}
            {{- else }}
              {{- if .Values.global.proxy.resources }}
                {{ toYaml .Values.global.proxy.resources | indent 6 }}
              {{- end }}
            {{- end }}
          {{- end }}
          {{- $containers := list }}
          {{- range $index, $container := .Spec.Containers }}{{ if not (eq $container.Name "istio-proxy") }}{{ $containers = append $containers $container.Name }}{{end}}{{- end}}
          metadata:
            labels:
              {{/* security.istio.io/tlsMode: istio must be set by user, if gRPC is using mTLS initialization code. We can't set it automatically. */}}
              service.istio.io/canonical-name: {{ index .ObjectMeta.Labels `service.istio.io/canonical-name` | default (index .ObjectMeta.Labels `app.kubernetes.io/name`) | default (index .ObjectMeta.Labels `app`) | default .DeploymentMeta.Name  | quote }}
              service.istio.io/canonical-revision: {{ index .ObjectMeta.Labels `service.istio.io/canonical-revision` | default (index .ObjectMeta.Labels `app.kubernetes.io/version`) | default (index .ObjectMeta.Labels `version`) | default "latest"  | quote }}
            annotations: {
              istio.io/rev: {{ .Revision | default "default" }},
              {{- if ge (len $containers) 1 }}
              {{- if not (isset .ObjectMeta.Annotations `kubectl.kubernetes.io/default-logs-container`) }}
              kubectl.kubernetes.io/default-logs-container: "{{ index $containers 0 }}",
              {{- end }}
              {{- if not (isset .ObjectMeta.Annotations `kubectl.kubernetes.io/default-container`) }}
              kubectl.kubernetes.io/default-container: "{{ index $containers 0 }}",
              {{- end }}
              {{- end }}
              sidecar.istio.io/rewriteAppHTTPProbers: "false",
            }
          spec:
            containers:
            - name: istio-proxy
            {{- if contains "/" (annotation .ObjectMeta `sidecar.istio.io/proxyImage` .Values.global.proxy.image) }}
              image: "{{ annotation .ObjectMeta `sidecar.istio.io/proxyImage` .Values.global.proxy.image }}"
            {{- else }}
              image: "{{ .ProxyImage }}"
            {{- end }}
              ports:
              - containerPort: 15020
                protocol: TCP
                name: mesh-metrics
              args:
              - proxy
              - sidecar
              - --domain
              - $(POD_NAMESPACE).svc.{{ .Values.global.proxy.clusterDomain }}
              - --proxyLogLevel={{ annotation .ObjectMeta `sidecar.istio.io/logLevel` .Values.global.proxy.logLevel }}
              - --proxyComponentLogLevel={{ annotation .ObjectMeta `sidecar.istio.io/componentLogLevel` .Values.global.proxy.componentLogLevel }}
              - --log_output_level={{ annotation .ObjectMeta `sidecar.istio.io/agentLogLevel` .Values.global.logging.level }}
            {{- if .Values.global.sts.servicePort }}
              - --stsPort={{ .Values.global.sts.servicePort }}
            {{- end }}
            {{- if .Values.global.logAsJson }}
              - --log_as_json
            {{- end }}
              lifecycle:
                postStart:
                  exec:
                    command:
                    - pilot-agent
                    - wait
                    - --url=http://localhost:15020/healthz/ready
              env:
              - name: ISTIO_META_GENERATOR
                value: grpc
              - name: OUTPUT_CERTS
                value: /var/lib/istio/data
              {{- if eq (env "PILOT_ENABLE_INBOUND_PASSTHROUGH" "true") "false" }}
              - name: REWRITE_PROBE_LEGACY_LOCALHOST_DESTINATION
                value: "true"
              {{- end }}
              - name: JWT_POLICY
                value: {{ .Values.global.jwtPolicy }}
              - name: PILOT_CERT_PROVIDER
                value: {{ .Values.global.pilotCertProvider }}
              - name: CA_ADDR
              {{- if .Values.global.caAddress }}
                value: {{ .Values.global.caAddress }}
              {{- else }}
                value: istiod{{- if not (eq .Values.revision "") }}-{{ .Values.revision }}{{- end }}.{{ .Values.global.istioNamespace }}.svc:15012
              {{- end }}
              - name: POD_NAME
                valueFrom:
                  fieldRef:
                    fieldPath: metadata.name
              - name: POD_NAMESPACE
                valueFrom:
                  fieldRef:
                    fieldPath: metadata.namespace
              - name: INSTANCE_IP
                valueFrom:
                  fieldRef:
                    fieldPath: status.podIP
              - name: SERVICE_ACCOUNT
                valueFrom:
                  fieldRef:
                    fieldPath: spec.serviceAccountName
              - name: HOST_IP
                valueFrom:
                  fieldRef:
                    fieldPath: status.hostIP
              - name: PROXY_CONFIG
                value: |
                       {{ protoToJSON .ProxyConfig }}
              - name: ISTIO_META_POD_PORTS
                value: |-
                  [
                  {{- $first := true }}
                  {{- range $index1, $c := .Spec.Containers }}
                    {{- range $index2, $p := $c.Ports }}
                      {{- if (structToJSON $p) }}
                      {{if not $first}},{{end}}{{ structToJSON $p }}
                      {{- $first = false }}
                      {{- end }}
                    {{- end}}
                  {{- end}}
                  ]
              - name: ISTIO_META_APP_CONTAINERS
                value: "{{ $containers | join "," }}"
              - name: ISTIO_META_CLUSTER_ID
                value: "{{ valueOrDefault .Values.global.multiCluster.clusterName `Kubernetes` }}"
              - name: ISTIO_META_NODE_NAME
                valueFrom:
                  fieldRef:
                    fieldPath: spec.nodeName
              {{- if .Values.global.network }}
              - name: ISTIO_META_NETWORK
                value: "{{ .Values.global.network }}"
              {{- end }}
              {{- if .DeploymentMeta.Name }}
              - name: ISTIO_META_WORKLOAD_NAME
                value: "{{ .DeploymentMeta.Name }}"
              {{ end }}
              {{- if and .TypeMeta.APIVersion .DeploymentMeta.Name }}
              - name: ISTIO_META_OWNER
                value: kubernetes://apis/{{ .TypeMeta.APIVersion }}/namespaces/{{ valueOrDefault .DeploymentMeta.Namespace `default` }}/{{ toLower .TypeMeta.Kind}}s/{{ .DeploymentMeta.Name }}
              {{- end}}
              {{- if .Values.global.meshID }}
              - name: ISTIO_META_MESH_ID
                value: "{{ .Values.global.meshID }}"
              {{- else if (valueOrDefault .MeshConfig.TrustDomain .Values.global.trustDomain) }}
              - name: ISTIO_META_MESH_ID
                value: "{{ (valueOrDefault .MeshConfig.TrustDomain .Values.global.trustDomain) }}"
              {{- end }}
              {{- with (valueOrDefault .MeshConfig.TrustDomain .Values.global.trustDomain)  }}
              - name: TRUST_DOMAIN
                value: "{{ . }}"
              {{- end }}
              {{- range $key, $value := .ProxyConfig.ProxyMetadata }}
              - name: {{ $key }}
                value: "{{ $value }}"
              {{- end }}
              # grpc uses xds:/// to resolve – no need to resolve VIP
              - name: ISTIO_META_DNS_CAPTURE
                value: "false"
              - name: DISABLE_ENVOY
                value: "true"
              {{with .Values.global.imagePullPolicy }}imagePullPolicy: "{{.}}"{{end}}
              {{ if ne (annotation .ObjectMeta `status.sidecar.istio.io/port` .Values.global.proxy.statusPort) `0` }}
              readinessProbe:
                httpGet:
                  path: /healthz/ready
                  port: 15020
                initialDelaySeconds: {{ annotation .ObjectMeta `readiness.status.sidecar.istio.io/initialDelaySeconds` .Values.global.proxy.readinessInitialDelaySeconds }}
                periodSeconds: {{ annotation .ObjectMeta `readiness.status.sidecar.istio.io/periodSeconds` .Values.global.proxy.readinessPeriodSeconds }}
                timeoutSeconds: 3
                failureThreshold: {{ annotation .ObjectMeta `readiness.status.sidecar.istio.io/failureThreshold` .Values.global.proxy.readinessFailureThreshold }}
              resources:
            {{ template "resources" . }}
              volumeMounts:
              - name: workload-socket
                mountPath: /var/run/secrets/workload-spiffe-uds
              {{- if eq .Values.global.caName "GkeWorkloadCertificate" }}
              - name: gke-workload-certificate
                mountPath: /var/run/secrets/workload-spiffe-credentials
                readOnly: true
              {{- else }}
              - name: workload-certs
                mountPath: /var/run/secrets/workload-spiffe-credentials
              {{- end }}
              {{- if eq .Values.global.pilotCertProvider "istiod" }}
              - mountPath: /var/run/secrets/istio
                name: istiod-ca-cert
              {{- end }}
              - mountPath: /var/lib/istio/data
                name: istio-data
              # UDS channel between istioagent and gRPC client for XDS/SDS
              - mountPath: /etc/istio/proxy
                name: istio-xds
              {{- if eq .Values.global.jwtPolicy "third-party-jwt" }}
              - mountPath: /var/run/secrets/tokens
                name: istio-token
              {{- end }}
              {{- if .Values.global.mountMtlsCerts }}
              # Use the key and cert mounted to /etc/certs/ for the in-cluster mTLS communications.
              - mountPath: /etc/certs/
                name: istio-certs
                readOnly: true
              {{- end }}
              - name: istio-podinfo
                mountPath: /etc/istio/pod
              {{- end }}
                {{- if isset .ObjectMeta.Annotations `sidecar.istio.io/userVolumeMount` }}
                {{ range $index, $value := fromJSON (index .ObjectMeta.Annotations `sidecar.istio.io/userVolumeMount`) }}
              - name: "{{  $index }}"
                {{ toYaml $value | indent 6 }}
                {{ end }}
                {{- end }}
          {{- range $index, $container := .Spec.Containers  }}
          {{ if not (eq $container.Name "istio-proxy") }}
            - name: {{ $container.Name }}
              env:
                - name: "GRPC_XDS_EXPERIMENTAL_SECURITY_SUPPORT"
                  value: "true"
                - name: "GRPC_XDS_BOOTSTRAP"
                  value: "/etc/istio/proxy/grpc-bootstrap.json"
              volumeMounts:
                - mountPath: /var/lib/istio/data
                  name: istio-data
                # UDS channel between istioagent and gRPC client for XDS/SDS
                - mountPath: /etc/istio/proxy
                  name: istio-xds
                {{- if eq $.Values.global.caName "GkeWorkloadCertificate" }}
                - name: gke-workload-certificate
                  mountPath: /var/run/secrets/workload-spiffe-credentials
                  readOnly: true
                {{- else }}
                - name: workload-certs
                  mountPath: /var/run/secrets/workload-spiffe-credentials
                {{- end }}
          {{- end }}
          {{- end }}
            volumes:
            - emptyDir:
              name: workload-socket
            {{- if eq .Values.global.caName "GkeWorkloadCertificate" }}
            - name: gke-workload-certificate
              csi:
                driver: workloadcertificates.security.cloud.google.com
            {{- else }}
            - emptyDir:
              name: workload-certs
            {{- end }}
            {{- if (isset .ObjectMeta.Annotations `sidecar.istio.io/bootstrapOverride`) }}
            - name: custom-bootstrap-volume
              configMap:
                name: {{ annotation .ObjectMeta `sidecar.istio.io/bootstrapOverride` "" }}
            {{- end }}
            # SDS channel between istioagent and Envoy
            - emptyDir:
                medium: Memory
              name: istio-xds
            - name: istio-data
              emptyDir: {}
            - name: istio-podinfo
              downwardAPI:
                items:
                  - path: "labels"
                    fieldRef:
                      fieldPath: metadata.labels
                  - path: "annotations"
                    fieldRef:
                      fieldPath: metadata.annotations
            {{- if eq .Values.global.jwtPolicy "third-party-jwt" }}
            - name: istio-token
              projected:
                sources:
                - serviceAccountToken:
                    path: istio-token
                    expirationSeconds: 43200
                    audience: {{ .Values.global.sds.token.aud }}
            {{- end }}
            {{- if eq .Values.global.pilotCertProvider "istiod" }}
            - name: istiod-ca-cert
              configMap:
                name: istio-ca-root-cert
            {{- end }}
            {{- if .Values.global.mountMtlsCerts }}
            # Use the key and cert mounted to /etc/certs/ for the in-cluster mTLS communications.
            - name: istio-certs
              secret:
                optional: true
                {{ if eq .Spec.ServiceAccountName "" }}
                secretName: istio.default
                {{ else -}}
                secretName: {{  printf "istio.%s" .Spec.ServiceAccountName }}
                {{  end -}}
            {{- end }}
              {{- if isset .ObjectMeta.Annotations `sidecar.istio.io/userVolume` }}
              {{range $index, $value := fromJSON (index .ObjectMeta.Annotations `sidecar.istio.io/userVolume`) }}
            - name: "{{ $index }}"
              {{ toYaml $value | indent 4 }}
              {{ end }}
              {{ end }}
            {{- if .Values.global.imagePullSecrets }}
            imagePullSecrets:
              {{- range .Values.global.imagePullSecrets }}
              - name: {{ . }}
              {{- end }}
            {{- end }}
        waypoint: |
          apiVersion: v1
          kind: ServiceAccount
          metadata:
            name: {{.ServiceAccount | quote}}
            namespace: {{.Namespace | quote}}
          ---
          apiVersion: apps/v1
          kind: Deployment
          metadata:
            name: {{.DeploymentName | quote}}
            namespace: {{.Namespace | quote}}
            annotations:
              {{- toJsonMap (omit .Annotations "kubectl.kubernetes.io/last-applied-configuration" "gateway.istio.io/name-override" "gateway.istio.io/service-account" "gateway.istio.io/controller-version") | nindent 4 }}
            labels:
              {{- toJsonMap .Labels | nindent 4 }}
            ownerReferences:
            - apiVersion: gateway.networking.k8s.io/v1beta1
              kind: Gateway
              name: "{{.Name}}"
              uid: "{{.UID}}"
          spec:
            selector:
              matchLabels:
                istio.io/gateway-name: "{{.Name}}"
            template:
              metadata:
                annotations:
                  {{- toJsonMap
                    (omit .Annotations "kubectl.kubernetes.io/last-applied-configuration" "gateway.istio.io/name-override" "gateway.istio.io/service-account" "gateway.istio.io/controller-version")
                    (strdict "istio.io/rev" (.Revision | default "default"))
                    (strdict
                      "ambient.istio.io/redirection" "disabled"
                      "prometheus.io/path" "/stats/prometheus"
                      "prometheus.io/port" "15020"
                      "prometheus.io/scrape" "true"
                    ) | nindent 8 }}
                labels:
                  {{- toJsonMap
                    (strdict
                      "sidecar.istio.io/inject" "false"
                      "service.istio.io/canonical-name" .DeploymentName
                      "service.istio.io/canonical-revision" "latest"
                     )
                    .Labels
                    (strdict
                      "istio.io/gateway-name" .Name
                      "gateway.istio.io/managed" "istio.io-mesh-controller"
                    ) | nindent 8}}
              spec:
                terminationGracePeriodSeconds: 2
                serviceAccountName: {{.ServiceAccount | quote}}
                containers:
                - name: istio-proxy
                  ports:
                  - containerPort: 15021
                    name: status-port
                    protocol: TCP
                  - containerPort: 15090
                    protocol: TCP
                    name: http-envoy-prom
                  {{- if contains "/" (annotation .ObjectMeta `sidecar.istio.io/proxyImage` .Values.global.proxy.image) }}
                  image: "{{ annotation .ObjectMeta `sidecar.istio.io/proxyImage` .Values.global.proxy.image }}"
                  {{- else }}
                  image: "{{ .ProxyImage }}"
                  {{- end }}
                  {{with .Values.global.imagePullPolicy }}imagePullPolicy: "{{.}}"{{end}}
                  args:
                  - proxy
                  - waypoint
                  - --domain
                  - $(POD_NAMESPACE).svc.{{ .Values.global.proxy.clusterDomain }}
                  - --serviceCluster
                  - {{.ServiceAccount}}.$(POD_NAMESPACE)
                  - --proxyLogLevel
                  - {{ annotation .ObjectMeta `sidecar.istio.io/logLevel` .Values.global.proxy.logLevel | quote}}
                  - --proxyComponentLogLevel
                  - {{ annotation .ObjectMeta `sidecar.istio.io/componentLogLevel` .Values.global.proxy.componentLogLevel | quote}}
                  - --log_output_level
                  - {{ annotation .ObjectMeta `sidecar.istio.io/agentLogLevel` .Values.global.logging.level | quote}}
                  {{- if .Values.global.logAsJson }}
                  - --log_as_json
                  {{- end }}
                  env:
                  - name: ISTIO_META_SERVICE_ACCOUNT
                    valueFrom:
                      fieldRef:
                        fieldPath: spec.serviceAccountName
                  - name: ISTIO_META_NODE_NAME
                    valueFrom:
                      fieldRef:
                        fieldPath: spec.nodeName
                  - name: JWT_POLICY
                    value: {{ .Values.global.jwtPolicy }}
                  - name: PILOT_CERT_PROVIDER
                    value: {{ .Values.global.pilotCertProvider }}
                  - name: CA_ADDR
                  {{- if .Values.global.caAddress }}
                    value: {{ .Values.global.caAddress }}
                  {{- else }}
                    value: istiod{{- if not (eq .Values.revision "") }}-{{ .Values.revision }}{{- end }}.{{ .Values.global.istioNamespace }}.svc:15012
                  {{- end }}
                  - name: POD_NAME
                    valueFrom:
                      fieldRef:
                        fieldPath: metadata.name
                  - name: POD_NAMESPACE
                    valueFrom:
                      fieldRef:
                        fieldPath: metadata.namespace
                  - name: INSTANCE_IP
                    valueFrom:
                      fieldRef:
                        fieldPath: status.podIP
                  - name: SERVICE_ACCOUNT
                    valueFrom:
                      fieldRef:
                        fieldPath: spec.serviceAccountName
                  - name: HOST_IP
                    valueFrom:
                      fieldRef:
                        fieldPath: status.hostIP
                  - name: ISTIO_CPU_LIMIT
                    valueFrom:
                      resourceFieldRef:
                        resource: limits.cpu
                  - name: PROXY_CONFIG
                    value: |
                           {{ protoToJSON .ProxyConfig }}
                  - name: GOMEMLIMIT
                    valueFrom:
                      resourceFieldRef:
                        resource: limits.memory
                  - name: GOMAXPROCS
                    valueFrom:
                      resourceFieldRef:
                        resource: limits.cpu
                  - name: ISTIO_META_CLUSTER_ID
                    value: "{{ valueOrDefault .Values.global.multiCluster.clusterName `Kubernetes` }}"
                  {{- $network := valueOrDefault (index .Labels `topology.istio.io/network`) .Values.global.network }}
                  {{- if $network }}
                  - name: ISTIO_META_NETWORK
                    value: "{{ $network }}"
                  {{- end }}
                  - name: ISTIO_META_INTERCEPTION_MODE
                    value: REDIRECT
                  - name: ISTIO_META_WORKLOAD_NAME
                    value: {{.DeploymentName}}
                  - name: ISTIO_META_OWNER
                    value: kubernetes://apis/apps/v1/namespaces/{{.Namespace}}/deployments/{{.DeploymentName}}
                  {{- if .Values.global.meshID }}
                  - name: ISTIO_META_MESH_ID
                    value: "{{ .Values.global.meshID }}"
                  {{- else if (valueOrDefault .MeshConfig.TrustDomain .Values.global.trustDomain) }}
                  - name: ISTIO_META_MESH_ID
                    value: "{{ (valueOrDefault .MeshConfig.TrustDomain .Values.global.trustDomain) }}"
                  {{- end }}
                  resources:
                    limits:
                      cpu: "2"
                      memory: 1Gi
                    requests:
                      cpu: 100m
                      memory: 128Mi
                  startupProbe:
                    failureThreshold: 30
                    httpGet:
                      path: /healthz/ready
                      port: 15021
                      scheme: HTTP
                    initialDelaySeconds: 1
                    periodSeconds: 1
                    successThreshold: 1
                    timeoutSeconds: 1
                  readinessProbe:
                    failureThreshold: 4
                    httpGet:
                      path: /healthz/ready
                      port: 15021
                      scheme: HTTP
                    initialDelaySeconds: 0
                    periodSeconds: 15
                    successThreshold: 1
                    timeoutSeconds: 1
                  securityContext:
                    privileged: true
                    runAsGroup: 1337
                    runAsUser: 0
                    capabilities:
                      add:
                      - NET_ADMIN
                      - NET_RAW
                  volumeMounts:
                  - mountPath: /var/run/secrets/istio
                    name: istiod-ca-cert
                  - mountPath: /var/lib/istio/data
                    name: istio-data
                  - mountPath: /etc/istio/proxy
                    name: istio-envoy
                  - mountPath: /var/run/secrets/tokens
                    name: istio-token
                  - mountPath: /etc/istio/pod
                    name: istio-podinfo
                volumes:
                - emptyDir:
                    medium: Memory
                  name: istio-envoy
                - emptyDir:
                    medium: Memory
                  name: go-proxy-envoy
                - emptyDir: {}
                  name: istio-data
                - emptyDir: {}
                  name: go-proxy-data
                - downwardAPI:
                    items:
                    - fieldRef:
                        fieldPath: metadata.labels
                      path: labels
                    - fieldRef:
                        fieldPath: metadata.annotations
                      path: annotations
                  name: istio-podinfo
                - name: istio-token
                  projected:
                    sources:
                    - serviceAccountToken:
                        audience: istio-ca
                        expirationSeconds: 43200
                        path: istio-token
                - configMap:
                    name: istio-ca-root-cert
                  name: istiod-ca-cert
                {{- if .Values.global.imagePullSecrets }}
                imagePullSecrets:
                  {{- range .Values.global.imagePullSecrets }}
                  - name: {{ . }}
                  {{- end }}
                {{- end }}
          ---
          apiVersion: v1
          kind: Service
          metadata:
            annotations:
              {{ toJsonMap (omit .Annotations "kubectl.kubernetes.io/last-applied-configuration" "gateway.istio.io/name-override" "gateway.istio.io/service-account" "gateway.istio.io/controller-version") | nindent 4 }}
            labels:
              {{ toJsonMap .Labels | nindent 4}}
            name: {{.DeploymentName | quote}}
            namespace: {{.Namespace | quote}}
            ownerReferences:
            - apiVersion: gateway.networking.k8s.io/v1beta1
              kind: Gateway
              name: "{{.Name}}"
              uid: "{{.UID}}"
          spec:
            ports:
            {{- range $key, $val := .Ports }}
            - name: {{ $val.Name | quote }}
              port: {{ $val.Port }}
              protocol: TCP
              appProtocol: {{ $val.AppProtocol }}
            {{- end }}
            selector:
              istio.io/gateway-name: "{{.Name}}"
            {{- if and (.Spec.Addresses) (eq .ServiceType "LoadBalancer") }}
            loadBalancerIP: {{ (index .Spec.Addresses 0).Value | quote}}
            {{- end }}
            type: {{ .ServiceType | quote }}
          ---
        kube-gateway: |
          apiVersion: v1
          kind: ServiceAccount
          metadata:
            name: {{.ServiceAccount | quote}}
            namespace: {{.Namespace | quote}}
          ---
          apiVersion: apps/v1
          kind: Deployment
          metadata:
            name: {{.DeploymentName | quote}}
            namespace: {{.Namespace | quote}}
            annotations:
              {{- toJsonMap (omit .Annotations "kubectl.kubernetes.io/last-applied-configuration" "gateway.istio.io/name-override" "gateway.istio.io/service-account" "gateway.istio.io/controller-version") | nindent 4 }}
            labels:
              {{- toJsonMap .Labels | nindent 4 }}
            ownerReferences:
            - apiVersion: gateway.networking.k8s.io/v1beta1
              kind: Gateway
              name: {{.Name}}
              uid: "{{.UID}}"
          spec:
            selector:
              matchLabels:
                istio.io/gateway-name: {{.Name}}
            template:
              metadata:
                annotations:
                  {{- toJsonMap
                    (omit .Annotations "kubectl.kubernetes.io/last-applied-configuration" "gateway.istio.io/name-override" "gateway.istio.io/service-account" "gateway.istio.io/controller-version")
                    (strdict "istio.io/rev" (.Revision | default "default"))
                    (strdict
                      "prometheus.io/path" "/stats/prometheus"
                      "prometheus.io/port" "15020"
                      "prometheus.io/scrape" "true"
                    ) | nindent 8 }}
                labels:
                  {{- toJsonMap
                    (strdict
                      "sidecar.istio.io/inject" "false"
                      "service.istio.io/canonical-name" .DeploymentName
                      "service.istio.io/canonical-revision" "latest"
                     )
                    .Labels
                    (strdict "istio.io/gateway-name" .Name) | nindent 8}}
              spec:
                {{- if .KubeVersion122 }}
                {{/* safe since 1.22: https://github.com/kubernetes/kubernetes/pull/103326. */}}
                securityContext:
                  sysctls:
                  - name: net.ipv4.ip_unprivileged_port_start
                    value: "0"
                {{- end }}
                serviceAccountName: {{.ServiceAccount | quote}}
                containers:
                - name: istio-proxy
                {{- if contains "/" (annotation .ObjectMeta `sidecar.istio.io/proxyImage` .Values.global.proxy.image) }}
                  image: "{{ annotation .ObjectMeta `sidecar.istio.io/proxyImage` .Values.global.proxy.image }}"
                {{- else }}
                  image: "{{ .ProxyImage }}"
                {{- end }}
                  {{- if .Values.global.proxy.resources }}
                  resources:
                    {{- toYaml .Values.global.proxy.resources | nindent 10 }}
                  {{- end }}
                  {{with .Values.global.imagePullPolicy }}imagePullPolicy: "{{.}}"{{end}}
                  securityContext:
                  {{- if .KubeVersion122 }}
                    # Safe since 1.22: https://github.com/kubernetes/kubernetes/pull/103326
                    capabilities:
                      drop:
                      - ALL
                    allowPrivilegeEscalation: false
                    privileged: false
                    readOnlyRootFilesystem: true
                    runAsUser: {{ .ProxyUID | default "1337" }}
                    runAsGroup: {{ .ProxyGID | default "1337" }}
                    runAsNonRoot: true
                  {{- else }}
                    capabilities:
                      drop:
                      - ALL
                      add:
                      - NET_BIND_SERVICE
                    runAsUser: 0
                    runAsGroup: 1337
                    runAsNonRoot: false
                    allowPrivilegeEscalation: true
                    readOnlyRootFilesystem: true
                  {{- end }}
                  ports:
                  - containerPort: 15021
                    name: status-port
                    protocol: TCP
                  - containerPort: 15090
                    protocol: TCP
                    name: http-envoy-prom
                  args:
                  - proxy
                  - router
                  - --domain
                  - $(POD_NAMESPACE).svc.{{ .Values.global.proxy.clusterDomain }}
                  - --proxyLogLevel
                  - {{ annotation .ObjectMeta `sidecar.istio.io/logLevel` .Values.global.proxy.logLevel | quote}}
                  - --proxyComponentLogLevel
                  - {{ annotation .ObjectMeta `sidecar.istio.io/componentLogLevel` .Values.global.proxy.componentLogLevel | quote}}
                  - --log_output_level
                  - {{ annotation .ObjectMeta `sidecar.istio.io/agentLogLevel` .Values.global.logging.level | quote}}
                {{- if .Values.global.sts.servicePort }}
                  - --stsPort={{ .Values.global.sts.servicePort }}
                {{- end }}
                {{- if .Values.global.logAsJson }}
                  - --log_as_json
                {{- end }}
                {{- if .Values.global.proxy.lifecycle }}
                  lifecycle:
                    {{ toYaml .Values.global.proxy.lifecycle | indent 6 }}
                {{- end }}
                  env:
                  - name: JWT_POLICY
                    value: {{ .Values.global.jwtPolicy }}
                  - name: PILOT_CERT_PROVIDER
                    value: {{ .Values.global.pilotCertProvider }}
                  - name: CA_ADDR
                  {{- if .Values.global.caAddress }}
                    value: {{ .Values.global.caAddress }}
                  {{- else }}
                    value: istiod{{- if not (eq .Values.revision "") }}-{{ .Values.revision }}{{- end }}.{{ .Values.global.istioNamespace }}.svc:15012
                  {{- end }}
                  - name: POD_NAME
                    valueFrom:
                      fieldRef:
                        fieldPath: metadata.name
                  - name: POD_NAMESPACE
                    valueFrom:
                      fieldRef:
                        fieldPath: metadata.namespace
                  - name: INSTANCE_IP
                    valueFrom:
                      fieldRef:
                        fieldPath: status.podIP
                  - name: SERVICE_ACCOUNT
                    valueFrom:
                      fieldRef:
                        fieldPath: spec.serviceAccountName
                  - name: HOST_IP
                    valueFrom:
                      fieldRef:
                        fieldPath: status.hostIP
                  - name: ISTIO_CPU_LIMIT
                    valueFrom:
                      resourceFieldRef:
                        resource: limits.cpu
                  - name: PROXY_CONFIG
                    value: |
                           {{ protoToJSON .ProxyConfig }}
                  - name: ISTIO_META_POD_PORTS
                    value: "[]"
                  - name: ISTIO_META_APP_CONTAINERS
                    value: ""
                  - name: GOMEMLIMIT
                    valueFrom:
                      resourceFieldRef:
                        resource: limits.memory
                  - name: GOMAXPROCS
                    valueFrom:
                      resourceFieldRef:
                        resource: limits.cpu
                  - name: ISTIO_META_CLUSTER_ID
                    value: "{{ valueOrDefault .Values.global.multiCluster.clusterName .ClusterID }}"
                  - name: ISTIO_META_NODE_NAME
                    valueFrom:
                      fieldRef:
                        fieldPath: spec.nodeName
                  - name: ISTIO_META_INTERCEPTION_MODE
                    value: "{{ .ProxyConfig.InterceptionMode.String }}"
                  {{- with (valueOrDefault  (index .Labels "topology.istio.io/network") .Values.global.network) }}
                  - name: ISTIO_META_NETWORK
                    value: {{.|quote}}
                  {{- end }}
                  - name: ISTIO_META_WORKLOAD_NAME
                    value: {{.DeploymentName|quote}}
                  - name: ISTIO_META_OWNER
                    value: "kubernetes://apis/apps/v1/namespaces/{{.Namespace}}/deployments/{{.DeploymentName}}"
                  {{- if .Values.global.meshID }}
                  - name: ISTIO_META_MESH_ID
                    value: "{{ .Values.global.meshID }}"
                  {{- else if (valueOrDefault .MeshConfig.TrustDomain .Values.global.trustDomain) }}
                  - name: ISTIO_META_MESH_ID
                    value: "{{ (valueOrDefault .MeshConfig.TrustDomain .Values.global.trustDomain) }}"
                  {{- end }}
                  {{- with (valueOrDefault .MeshConfig.TrustDomain .Values.global.trustDomain)  }}
                  - name: TRUST_DOMAIN
                    value: "{{ . }}"
                  {{- end }}
                  {{- range $key, $value := .ProxyConfig.ProxyMetadata }}
                  - name: {{ $key }}
                    value: "{{ $value }}"
                  {{- end }}
                  {{- with (index .Labels "topology.istio.io/network") }}
                  - name: ISTIO_META_REQUESTED_NETWORK_VIEW
                    value: {{.|quote}}
                  {{- end }}
                  startupProbe:
                    failureThreshold: 30
                    httpGet:
                      path: /healthz/ready
                      port: 15021
                      scheme: HTTP
                    initialDelaySeconds: 1
                    periodSeconds: 1
                    successThreshold: 1
                    timeoutSeconds: 1
                  readinessProbe:
                    failureThreshold: 4
                    httpGet:
                      path: /healthz/ready
                      port: 15021
                      scheme: HTTP
                    initialDelaySeconds: 0
                    periodSeconds: 15
                    successThreshold: 1
                    timeoutSeconds: 1
                  volumeMounts:
                  - name: workload-socket
                    mountPath: /var/run/secrets/workload-spiffe-uds
                  - name: credential-socket
                    mountPath: /var/run/secrets/credential-uds
                  {{- if eq .Values.global.caName "GkeWorkloadCertificate" }}
                  - name: gke-workload-certificate
                    mountPath: /var/run/secrets/workload-spiffe-credentials
                    readOnly: true
                  {{- else }}
                  - name: workload-certs
                    mountPath: /var/run/secrets/workload-spiffe-credentials
                  {{- end }}
                  {{- if eq .Values.global.pilotCertProvider "istiod" }}
                  - mountPath: /var/run/secrets/istio
                    name: istiod-ca-cert
                  {{- end }}
                  - mountPath: /var/lib/istio/data
                    name: istio-data
                  # SDS channel between istioagent and Envoy
                  - mountPath: /etc/istio/proxy
                    name: istio-envoy
                  {{- if eq .Values.global.jwtPolicy "third-party-jwt" }}
                  - mountPath: /var/run/secrets/tokens
                    name: istio-token
                  {{- end }}
                  - name: istio-podinfo
                    mountPath: /etc/istio/pod
                volumes:
                - emptyDir: {}
                  name: workload-socket
                - emptyDir: {}
                  name: credential-socket
                {{- if eq .Values.global.caName "GkeWorkloadCertificate" }}
                - name: gke-workload-certificate
                  csi:
                    driver: workloadcertificates.security.cloud.google.com
                {{- else}}
                - emptyDir: {}
                  name: workload-certs
                {{- end }}
                # SDS channel between istioagent and Envoy
                - emptyDir:
                    medium: Memory
                  name: istio-envoy
                - name: istio-data
                  emptyDir: {}
                - name: istio-podinfo
                  downwardAPI:
                    items:
                      - path: "labels"
                        fieldRef:
                          fieldPath: metadata.labels
                      - path: "annotations"
                        fieldRef:
                          fieldPath: metadata.annotations
                {{- if eq .Values.global.jwtPolicy "third-party-jwt" }}
                - name: istio-token
                  projected:
                    sources:
                    - serviceAccountToken:
                        path: istio-token
                        expirationSeconds: 43200
                        audience: {{ .Values.global.sds.token.aud }}
                {{- end }}
                {{- if eq .Values.global.pilotCertProvider "istiod" }}
                - name: istiod-ca-cert
                  configMap:
                    name: istio-ca-root-cert
                {{- end }}
                {{- if .Values.global.imagePullSecrets }}
                imagePullSecrets:
                  {{- range .Values.global.imagePullSecrets }}
                  - name: {{ . }}
                  {{- end }}
                {{- end }}
          ---
          apiVersion: v1
          kind: Service
          metadata:
            annotations:
              {{ toJsonMap (omit .Annotations "kubectl.kubernetes.io/last-applied-configuration" "gateway.istio.io/name-override" "gateway.istio.io/service-account" "gateway.istio.io/controller-version") | nindent 4 }}
            labels:
              {{ toJsonMap .Labels | nindent 4}}
            name: {{.DeploymentName | quote}}
            namespace: {{.Namespace | quote}}
            ownerReferences:
            - apiVersion: gateway.networking.k8s.io/v1beta1
              kind: Gateway
              name: {{.Name}}
              uid: {{.UID}}
          spec:
            ports:
            {{- range $key, $val := .Ports }}
            - name: {{ $val.Name | quote }}
              port: {{ $val.Port }}
              protocol: TCP
              appProtocol: {{ $val.AppProtocol }}
            {{- end }}
            selector:
              istio.io/gateway-name: {{.Name}}
            {{- if and (.Spec.Addresses) (eq .ServiceType "LoadBalancer") }}
            loadBalancerIP: {{ (index .Spec.Addresses 0).Value | quote}}
            {{- end }}
            type: {{ .ServiceType | quote }}
          ---
      EOT
      "values" = <<-EOT
      {
        "global": {
          "autoscalingv2API": true,
          "caAddress": "",
          "caName": "",
          "certSigners": [],
          "configCluster": false,
          "configValidation": true,
          "defaultNodeSelector": {},
          "defaultPodDisruptionBudget": {
            "enabled": true
          },
          "defaultResources": {
            "requests": {
              "cpu": "10m"
            }
          },
          "enabled": true,
          "externalIstiod": false,
          "hub": "docker.io/istio",
          "imagePullPolicy": "",
          "imagePullSecrets": [],
          "istioNamespace": "istio-system",
          "istiod": {
            "enableAnalysis": false
          },
          "jwtPolicy": "third-party-jwt",
          "logAsJson": false,
          "logging": {
            "level": "default:info"
          },
          "meshID": "",
          "meshNetworks": {},
          "mountMtlsCerts": false,
          "multiCluster": {
            "clusterName": "",
            "enabled": false
          },
          "namespace": "istio-system",
          "network": "",
          "omitSidecarInjectorConfigMap": false,
          "oneNamespace": false,
          "operatorManageWebhooks": false,
          "pilotCertProvider": "istiod",
          "priorityClassName": "",
          "proxy": {
            "autoInject": "enabled",
            "clusterDomain": "cluster.local",
            "componentLogLevel": "misc:error",
            "enableCoreDump": false,
            "excludeIPRanges": "",
            "excludeInboundPorts": "",
            "excludeOutboundPorts": "",
            "image": "proxyv2",
            "includeIPRanges": "*",
            "includeInboundPorts": "*",
            "includeOutboundPorts": "",
            "logLevel": "warning",
            "privileged": false,
            "readinessFailureThreshold": 4,
            "readinessInitialDelaySeconds": 0,
            "readinessPeriodSeconds": 15,
            "resources": {
              "limits": {
                "cpu": "2000m",
                "memory": "1024Mi"
              },
              "requests": {
                "cpu": "100m",
                "memory": "128Mi"
              }
            },
            "startupProbe": {
              "enabled": true,
              "failureThreshold": 600
            },
            "statusPort": 15020,
            "tracer": "zipkin"
          },
          "proxy_init": {
            "image": "proxyv2"
          },
          "remotePilotAddress": "",
          "sds": {
            "token": {
              "aud": "istio-ca"
            }
          },
          "sts": {
            "servicePort": 0
          },
          "tag": "1.20.3",
          "tracer": {
            "datadog": {},
            "lightstep": {},
            "stackdriver": {},
            "zipkin": {}
          },
          "useMCP": false,
          "variant": ""
        },
        "istio_cni": {
          "chained": true,
          "enabled": false
        },
        "revision": "",
        "sidecarInjectorWebhook": {
          "alwaysInjectSelector": [],
          "defaultTemplates": [],
          "enableNamespacesByDefault": false,
          "injectedAnnotations": {},
          "neverInjectSelector": [],
          "reinvocationPolicy": "Never",
          "rewriteAppHTTPProbe": true,
          "templates": {}
        }
      }
      EOT
    }
    "kind" = "ConfigMap"
    "metadata" = {
      "labels" = {
        "install.operator.istio.io/owning-resource" = "unknown"
        "istio.io/rev" = "default"
        "operator.istio.io/component" = "Pilot"
        "release" = "istio"
      }
      "name" = "istio-sidecar-injector"
      "namespace" = "istio-system"
    }
  }
}

resource "kubernetes_manifest" "mutatingwebhookconfiguration_istio_sidecar_injector" {
  manifest = {
    "apiVersion" = "admissionregistration.k8s.io/v1"
    "kind" = "MutatingWebhookConfiguration"
    "metadata" = {
      "labels" = {
        "app" = "sidecar-injector"
        "install.operator.istio.io/owning-resource" = "unknown"
        "istio.io/rev" = "default"
        "operator.istio.io/component" = "Pilot"
        "release" = "istio"
      }
      "name" = "istio-sidecar-injector"
    }
    "webhooks" = [
      {
        "admissionReviewVersions" = [
          "v1beta1",
          "v1",
        ]
        "clientConfig" = {
          "service" = {
            "name" = "istiod"
            "namespace" = "istio-system"
            "path" = "/inject"
            "port" = 443
          }
        }
        "failurePolicy" = "Fail"
        "name" = "rev.namespace.sidecar-injector.istio.io"
        "namespaceSelector" = {
          "matchExpressions" = [
            {
              "key" = "istio.io/rev"
              "operator" = "In"
              "values" = [
                "default",
              ]
            },
            {
              "key" = "istio-injection"
              "operator" = "DoesNotExist"
            },
          ]
        }
        "objectSelector" = {
          "matchExpressions" = [
            {
              "key" = "sidecar.istio.io/inject"
              "operator" = "NotIn"
              "values" = [
                "false",
              ]
            },
          ]
        }
        "reinvocationPolicy" = "Never"
        "rules" = [
          {
            "apiGroups" = [
              "",
            ]
            "apiVersions" = [
              "v1",
            ]
            "operations" = [
              "CREATE",
            ]
            "resources" = [
              "pods",
            ]
          },
        ]
        "sideEffects" = "None"
      },
      {
        "admissionReviewVersions" = [
          "v1beta1",
          "v1",
        ]
        "clientConfig" = {
          "service" = {
            "name" = "istiod"
            "namespace" = "istio-system"
            "path" = "/inject"
            "port" = 443
          }
        }
        "failurePolicy" = "Fail"
        "name" = "rev.object.sidecar-injector.istio.io"
        "namespaceSelector" = {
          "matchExpressions" = [
            {
              "key" = "istio.io/rev"
              "operator" = "DoesNotExist"
            },
            {
              "key" = "istio-injection"
              "operator" = "DoesNotExist"
            },
          ]
        }
        "objectSelector" = {
          "matchExpressions" = [
            {
              "key" = "sidecar.istio.io/inject"
              "operator" = "NotIn"
              "values" = [
                "false",
              ]
            },
            {
              "key" = "istio.io/rev"
              "operator" = "In"
              "values" = [
                "default",
              ]
            },
          ]
        }
        "reinvocationPolicy" = "Never"
        "rules" = [
          {
            "apiGroups" = [
              "",
            ]
            "apiVersions" = [
              "v1",
            ]
            "operations" = [
              "CREATE",
            ]
            "resources" = [
              "pods",
            ]
          },
        ]
        "sideEffects" = "None"
      },
      {
        "admissionReviewVersions" = [
          "v1beta1",
          "v1",
        ]
        "clientConfig" = {
          "service" = {
            "name" = "istiod"
            "namespace" = "istio-system"
            "path" = "/inject"
            "port" = 443
          }
        }
        "failurePolicy" = "Fail"
        "name" = "namespace.sidecar-injector.istio.io"
        "namespaceSelector" = {
          "matchExpressions" = [
            {
              "key" = "istio-injection"
              "operator" = "In"
              "values" = [
                "enabled",
              ]
            },
          ]
        }
        "objectSelector" = {
          "matchExpressions" = [
            {
              "key" = "sidecar.istio.io/inject"
              "operator" = "NotIn"
              "values" = [
                "false",
              ]
            },
          ]
        }
        "reinvocationPolicy" = "Never"
        "rules" = [
          {
            "apiGroups" = [
              "",
            ]
            "apiVersions" = [
              "v1",
            ]
            "operations" = [
              "CREATE",
            ]
            "resources" = [
              "pods",
            ]
          },
        ]
        "sideEffects" = "None"
      },
      {
        "admissionReviewVersions" = [
          "v1beta1",
          "v1",
        ]
        "clientConfig" = {
          "service" = {
            "name" = "istiod"
            "namespace" = "istio-system"
            "path" = "/inject"
            "port" = 443
          }
        }
        "failurePolicy" = "Fail"
        "name" = "object.sidecar-injector.istio.io"
        "namespaceSelector" = {
          "matchExpressions" = [
            {
              "key" = "istio-injection"
              "operator" = "DoesNotExist"
            },
            {
              "key" = "istio.io/rev"
              "operator" = "DoesNotExist"
            },
          ]
        }
        "objectSelector" = {
          "matchExpressions" = [
            {
              "key" = "sidecar.istio.io/inject"
              "operator" = "In"
              "values" = [
                "true",
              ]
            },
            {
              "key" = "istio.io/rev"
              "operator" = "DoesNotExist"
            },
          ]
        }
        "reinvocationPolicy" = "Never"
        "rules" = [
          {
            "apiGroups" = [
              "",
            ]
            "apiVersions" = [
              "v1",
            ]
            "operations" = [
              "CREATE",
            ]
            "resources" = [
              "pods",
            ]
          },
        ]
        "sideEffects" = "None"
      },
    ]
  }
}

resource "kubernetes_manifest" "deployment_istio_system_istio_ingressgateway" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "labels" = {
        "app" = "istio-ingressgateway"
        "install.operator.istio.io/owning-resource" = "unknown"
        "istio" = "ingressgateway"
        "istio.io/rev" = "default"
        "operator.istio.io/component" = "IngressGateways"
        "release" = "istio"
      }
      "name" = "istio-ingressgateway"
      "namespace" = "istio-system"
    }
    "spec" = {
      "selector" = {
        "matchLabels" = {
          "app" = "istio-ingressgateway"
          "istio" = "ingressgateway"
        }
      }
      "strategy" = {
        "rollingUpdate" = {
          "maxSurge" = "100%"
          "maxUnavailable" = "25%"
        }
      }
      "template" = {
        "metadata" = {
          "annotations" = {
            "istio.io/rev" = "default"
            "prometheus.io/path" = "/stats/prometheus"
            "prometheus.io/port" = "15020"
            "prometheus.io/scrape" = "true"
            "sidecar.istio.io/inject" = "false"
          }
          "labels" = {
            "app" = "istio-ingressgateway"
            "chart" = "gateways"
            "heritage" = "Tiller"
            "install.operator.istio.io/owning-resource" = "unknown"
            "istio" = "ingressgateway"
            "istio.io/rev" = "default"
            "operator.istio.io/component" = "IngressGateways"
            "release" = "istio"
            "service.istio.io/canonical-name" = "istio-ingressgateway"
            "service.istio.io/canonical-revision" = "latest"
            "sidecar.istio.io/inject" = "false"
          }
        }
        "spec" = {
          "affinity" = {
            "nodeAffinity" = {
            }
          }
          "containers" = [
            {
              "args" = [
                "proxy",
                "router",
                "--domain",
                "$(POD_NAMESPACE).svc.cluster.local",
                "--proxyLogLevel=warning",
                "--proxyComponentLogLevel=misc:error",
                "--log_output_level=default:info",
              ]
              "env" = [
                {
                  "name" = "JWT_POLICY"
                  "value" = "third-party-jwt"
                },
                {
                  "name" = "PILOT_CERT_PROVIDER"
                  "value" = "istiod"
                },
                {
                  "name" = "CA_ADDR"
                  "value" = "istiod.istio-system.svc:15012"
                },
                {
                  "name" = "NODE_NAME"
                  "valueFrom" = {
                    "fieldRef" = {
                      "apiVersion" = "v1"
                      "fieldPath" = "spec.nodeName"
                    }
                  }
                },
                {
                  "name" = "POD_NAME"
                  "valueFrom" = {
                    "fieldRef" = {
                      "apiVersion" = "v1"
                      "fieldPath" = "metadata.name"
                    }
                  }
                },
                {
                  "name" = "POD_NAMESPACE"
                  "valueFrom" = {
                    "fieldRef" = {
                      "apiVersion" = "v1"
                      "fieldPath" = "metadata.namespace"
                    }
                  }
                },
                {
                  "name" = "INSTANCE_IP"
                  "valueFrom" = {
                    "fieldRef" = {
                      "apiVersion" = "v1"
                      "fieldPath" = "status.podIP"
                    }
                  }
                },
                {
                  "name" = "HOST_IP"
                  "valueFrom" = {
                    "fieldRef" = {
                      "apiVersion" = "v1"
                      "fieldPath" = "status.hostIP"
                    }
                  }
                },
                {
                  "name" = "ISTIO_CPU_LIMIT"
                  "valueFrom" = {
                    "resourceFieldRef" = {
                      "resource" = "limits.cpu"
                    }
                  }
                },
                {
                  "name" = "SERVICE_ACCOUNT"
                  "valueFrom" = {
                    "fieldRef" = {
                      "fieldPath" = "spec.serviceAccountName"
                    }
                  }
                },
                {
                  "name" = "ISTIO_META_WORKLOAD_NAME"
                  "value" = "istio-ingressgateway"
                },
                {
                  "name" = "ISTIO_META_OWNER"
                  "value" = "kubernetes://apis/apps/v1/namespaces/istio-system/deployments/istio-ingressgateway"
                },
                {
                  "name" = "ISTIO_META_MESH_ID"
                  "value" = "cluster.local"
                },
                {
                  "name" = "TRUST_DOMAIN"
                  "value" = "cluster.local"
                },
                {
                  "name" = "ISTIO_META_UNPRIVILEGED_POD"
                  "value" = "true"
                },
                {
                  "name" = "ISTIO_META_CLUSTER_ID"
                  "value" = "Kubernetes"
                },
                {
                  "name" = "ISTIO_META_NODE_NAME"
                  "valueFrom" = {
                    "fieldRef" = {
                      "fieldPath" = "spec.nodeName"
                    }
                  }
                },
              ]
              "image" = "docker.io/istio/proxyv2:1.20.3"
              "name" = "istio-proxy"
              "ports" = [
                {
                  "containerPort" = 15021
                  "protocol" = "TCP"
                },
                {
                  "containerPort" = 8080
                  "protocol" = "TCP"
                },
                {
                  "containerPort" = 8443
                  "protocol" = "TCP"
                },
                {
                  "containerPort" = 15090
                  "name" = "http-envoy-prom"
                  "protocol" = "TCP"
                },
              ]
              "readinessProbe" = {
                "failureThreshold" = 30
                "httpGet" = {
                  "path" = "/healthz/ready"
                  "port" = 15021
                  "scheme" = "HTTP"
                }
                "initialDelaySeconds" = 1
                "periodSeconds" = 2
                "successThreshold" = 1
                "timeoutSeconds" = 1
              }
              "resources" = {
                "limits" = {
                  "cpu" = "2000m"
                  "memory" = "1024Mi"
                }
                "requests" = {
                  "cpu" = "100m"
                  "memory" = "128Mi"
                }
              }
              "securityContext" = {
                "allowPrivilegeEscalation" = false
                "capabilities" = {
                  "drop" = [
                    "ALL",
                  ]
                }
                "privileged" = false
                "readOnlyRootFilesystem" = true
              }
              "volumeMounts" = [
                {
                  "mountPath" = "/var/run/secrets/workload-spiffe-uds"
                  "name" = "workload-socket"
                },
                {
                  "mountPath" = "/var/run/secrets/credential-uds"
                  "name" = "credential-socket"
                },
                {
                  "mountPath" = "/var/run/secrets/workload-spiffe-credentials"
                  "name" = "workload-certs"
                },
                {
                  "mountPath" = "/etc/istio/proxy"
                  "name" = "istio-envoy"
                },
                {
                  "mountPath" = "/etc/istio/config"
                  "name" = "config-volume"
                },
                {
                  "mountPath" = "/var/run/secrets/istio"
                  "name" = "istiod-ca-cert"
                },
                {
                  "mountPath" = "/var/run/secrets/tokens"
                  "name" = "istio-token"
                  "readOnly" = true
                },
                {
                  "mountPath" = "/var/lib/istio/data"
                  "name" = "istio-data"
                },
                {
                  "mountPath" = "/etc/istio/pod"
                  "name" = "podinfo"
                },
                {
                  "mountPath" = "/etc/istio/ingressgateway-certs"
                  "name" = "ingressgateway-certs"
                  "readOnly" = true
                },
                {
                  "mountPath" = "/etc/istio/ingressgateway-ca-certs"
                  "name" = "ingressgateway-ca-certs"
                  "readOnly" = true
                },
              ]
            },
          ]
          "securityContext" = {
            "runAsGroup" = 1337
            "runAsNonRoot" = true
            "runAsUser" = 1337
          }
          "serviceAccountName" = "istio-ingressgateway-service-account"
          "volumes" = [
            {
              "emptyDir" = {}
              "name" = "workload-socket"
            },
            {
              "emptyDir" = {}
              "name" = "credential-socket"
            },
            {
              "emptyDir" = {}
              "name" = "workload-certs"
            },
            {
              "configMap" = {
                "name" = "istio-ca-root-cert"
              }
              "name" = "istiod-ca-cert"
            },
            {
              "downwardAPI" = {
                "items" = [
                  {
                    "fieldRef" = {
                      "fieldPath" = "metadata.labels"
                    }
                    "path" = "labels"
                  },
                  {
                    "fieldRef" = {
                      "fieldPath" = "metadata.annotations"
                    }
                    "path" = "annotations"
                  },
                ]
              }
              "name" = "podinfo"
            },
            {
              "emptyDir" = {}
              "name" = "istio-envoy"
            },
            {
              "emptyDir" = {}
              "name" = "istio-data"
            },
            {
              "name" = "istio-token"
              "projected" = {
                "sources" = [
                  {
                    "serviceAccountToken" = {
                      "audience" = "istio-ca"
                      "expirationSeconds" = 43200
                      "path" = "istio-token"
                    }
                  },
                ]
              }
            },
            {
              "configMap" = {
                "name" = "istio"
                "optional" = true
              }
              "name" = "config-volume"
            },
            {
              "name" = "ingressgateway-certs"
              "secret" = {
                "optional" = true
                "secretName" = "istio-ingressgateway-certs"
              }
            },
            {
              "name" = "ingressgateway-ca-certs"
              "secret" = {
                "optional" = true
                "secretName" = "istio-ingressgateway-ca-certs"
              }
            },
          ]
        }
      }
    }
  }
}

resource "kubernetes_manifest" "deployment_istio_system_istiod" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "labels" = {
        "app" = "istiod"
        "install.operator.istio.io/owning-resource" = "unknown"
        "istio" = "pilot"
        "istio.io/rev" = "default"
        "operator.istio.io/component" = "Pilot"
        "release" = "istio"
      }
      "name" = "istiod"
      "namespace" = "istio-system"
    }
    "spec" = {
      "selector" = {
        "matchLabels" = {
          "istio" = "pilot"
        }
      }
      "strategy" = {
        "rollingUpdate" = {
          "maxSurge" = "100%"
          "maxUnavailable" = "25%"
        }
      }
      "template" = {
        "metadata" = {
          "annotations" = {
            "ambient.istio.io/redirection" = "disabled"
            "prometheus.io/port" = "15014"
            "prometheus.io/scrape" = "true"
            "sidecar.istio.io/inject" = "false"
          }
          "labels" = {
            "app" = "istiod"
            "install.operator.istio.io/owning-resource" = "unknown"
            "istio" = "pilot"
            "istio.io/rev" = "default"
            "operator.istio.io/component" = "Pilot"
            "sidecar.istio.io/inject" = "false"
          }
        }
        "spec" = {
          "containers" = [
            {
              "args" = [
                "discovery",
                "--monitoringAddr=:15014",
                "--log_output_level=default:info",
                "--domain",
                "cluster.local",
                "--keepaliveMaxServerConnectionAge",
                "30m",
              ]
              "env" = [
                {
                  "name" = "REVISION"
                  "value" = "default"
                },
                {
                  "name" = "JWT_POLICY"
                  "value" = "third-party-jwt"
                },
                {
                  "name" = "PILOT_CERT_PROVIDER"
                  "value" = "istiod"
                },
                {
                  "name" = "POD_NAME"
                  "valueFrom" = {
                    "fieldRef" = {
                      "apiVersion" = "v1"
                      "fieldPath" = "metadata.name"
                    }
                  }
                },
                {
                  "name" = "POD_NAMESPACE"
                  "valueFrom" = {
                    "fieldRef" = {
                      "apiVersion" = "v1"
                      "fieldPath" = "metadata.namespace"
                    }
                  }
                },
                {
                  "name" = "SERVICE_ACCOUNT"
                  "valueFrom" = {
                    "fieldRef" = {
                      "apiVersion" = "v1"
                      "fieldPath" = "spec.serviceAccountName"
                    }
                  }
                },
                {
                  "name" = "KUBECONFIG"
                  "value" = "/var/run/secrets/remote/config"
                },
                {
                  "name" = "PILOT_TRACE_SAMPLING"
                  "value" = "1"
                },
                {
                  "name" = "PILOT_ENABLE_ANALYSIS"
                  "value" = "false"
                },
                {
                  "name" = "CLUSTER_ID"
                  "value" = "Kubernetes"
                },
                {
                  "name" = "GOMEMLIMIT"
                  "valueFrom" = {
                    "resourceFieldRef" = {
                      "resource" = "limits.memory"
                    }
                  }
                },
                {
                  "name" = "GOMAXPROCS"
                  "valueFrom" = {
                    "resourceFieldRef" = {
                      "resource" = "limits.cpu"
                    }
                  }
                },
                {
                  "name" = "PLATFORM"
                  "value" = ""
                },
              ]
              "image" = "docker.io/istio/pilot:1.20.3"
              "name" = "discovery"
              "ports" = [
                {
                  "containerPort" = 8080
                  "protocol" = "TCP"
                },
                {
                  "containerPort" = 15010
                  "protocol" = "TCP"
                },
                {
                  "containerPort" = 15017
                  "protocol" = "TCP"
                },
              ]
              "readinessProbe" = {
                "httpGet" = {
                  "path" = "/ready"
                  "port" = 8080
                }
                "initialDelaySeconds" = 1
                "periodSeconds" = 3
                "timeoutSeconds" = 5
              }
              "resources" = {
                "requests" = {
                  "cpu" = "500m"
                  "memory" = "2048Mi"
                }
              }
              "securityContext" = {
                "allowPrivilegeEscalation" = false
                "capabilities" = {
                  "drop" = [
                    "ALL",
                  ]
                }
                "readOnlyRootFilesystem" = true
                "runAsNonRoot" = true
              }
              "volumeMounts" = [
                {
                  "mountPath" = "/var/run/secrets/tokens"
                  "name" = "istio-token"
                  "readOnly" = true
                },
                {
                  "mountPath" = "/var/run/secrets/istio-dns"
                  "name" = "local-certs"
                },
                {
                  "mountPath" = "/etc/cacerts"
                  "name" = "cacerts"
                  "readOnly" = true
                },
                {
                  "mountPath" = "/var/run/secrets/remote"
                  "name" = "istio-kubeconfig"
                  "readOnly" = true
                },
                {
                  "mountPath" = "/var/run/secrets/istiod/tls"
                  "name" = "istio-csr-dns-cert"
                  "readOnly" = true
                },
                {
                  "mountPath" = "/var/run/secrets/istiod/ca"
                  "name" = "istio-csr-ca-configmap"
                  "readOnly" = true
                },
              ]
            },
          ]
          "serviceAccountName" = "istiod"
          "volumes" = [
            {
              "emptyDir" = {
                "medium" = "Memory"
              }
              "name" = "local-certs"
            },
            {
              "name" = "istio-token"
              "projected" = {
                "sources" = [
                  {
                    "serviceAccountToken" = {
                      "audience" = "istio-ca"
                      "expirationSeconds" = 43200
                      "path" = "istio-token"
                    }
                  },
                ]
              }
            },
            {
              "name" = "cacerts"
              "secret" = {
                "optional" = true
                "secretName" = "cacerts"
              }
            },
            {
              "name" = "istio-kubeconfig"
              "secret" = {
                "optional" = true
                "secretName" = "istio-kubeconfig"
              }
            },
            {
              "name" = "istio-csr-dns-cert"
              "secret" = {
                "optional" = true
                "secretName" = "istiod-tls"
              }
            },
            {
              "configMap" = {
                "defaultMode" = 420
                "name" = "istio-ca-root-cert"
                "optional" = true
              }
              "name" = "istio-csr-ca-configmap"
            },
          ]
        }
      }
    }
  }
}

resource "kubernetes_manifest" "poddisruptionbudget_istio_system_istio_ingressgateway" {
  manifest = {
    "apiVersion" = "policy/v1"
    "kind" = "PodDisruptionBudget"
    "metadata" = {
      "labels" = {
        "app" = "istio-ingressgateway"
        "install.operator.istio.io/owning-resource" = "unknown"
        "istio" = "ingressgateway"
        "istio.io/rev" = "default"
        "operator.istio.io/component" = "IngressGateways"
        "release" = "istio"
      }
      "name" = "istio-ingressgateway"
      "namespace" = "istio-system"
    }
    "spec" = {
      "minAvailable" = 1
      "selector" = {
        "matchLabels" = {
          "app" = "istio-ingressgateway"
          "istio" = "ingressgateway"
        }
      }
    }
  }
}

resource "kubernetes_manifest" "poddisruptionbudget_istio_system_istiod" {
  manifest = {
    "apiVersion" = "policy/v1"
    "kind" = "PodDisruptionBudget"
    "metadata" = {
      "labels" = {
        "app" = "istiod"
        "install.operator.istio.io/owning-resource" = "unknown"
        "istio" = "pilot"
        "istio.io/rev" = "default"
        "operator.istio.io/component" = "Pilot"
        "release" = "istio"
      }
      "name" = "istiod"
      "namespace" = "istio-system"
    }
    "spec" = {
      "minAvailable" = 1
      "selector" = {
        "matchLabels" = {
          "app" = "istiod"
          "istio" = "pilot"
        }
      }
    }
  }
}

resource "kubernetes_manifest" "role_istio_system_istio_ingressgateway_sds" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "Role"
    "metadata" = {
      "labels" = {
        "install.operator.istio.io/owning-resource" = "unknown"
        "istio.io/rev" = "default"
        "operator.istio.io/component" = "IngressGateways"
        "release" = "istio"
      }
      "name" = "istio-ingressgateway-sds"
      "namespace" = "istio-system"
    }
    "rules" = [
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "secrets",
        ]
        "verbs" = [
          "get",
          "watch",
          "list",
        ]
      },
    ]
  }
}

resource "kubernetes_manifest" "role_istio_system_istiod" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "Role"
    "metadata" = {
      "labels" = {
        "app" = "istiod"
        "release" = "istio"
      }
      "name" = "istiod"
      "namespace" = "istio-system"
    }
    "rules" = [
      {
        "apiGroups" = [
          "networking.istio.io",
        ]
        "resources" = [
          "gateways",
        ]
        "verbs" = [
          "create",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "secrets",
        ]
        "verbs" = [
          "create",
          "get",
          "watch",
          "list",
          "update",
          "delete",
        ]
      },
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "configmaps",
        ]
        "verbs" = [
          "delete",
        ]
      },
      {
        "apiGroups" = [
          "coordination.k8s.io",
        ]
        "resources" = [
          "leases",
        ]
        "verbs" = [
          "get",
          "update",
          "patch",
          "create",
        ]
      },
    ]
  }
}

resource "kubernetes_manifest" "rolebinding_istio_system_istio_ingressgateway_sds" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "RoleBinding"
    "metadata" = {
      "labels" = {
        "install.operator.istio.io/owning-resource" = "unknown"
        "istio.io/rev" = "default"
        "operator.istio.io/component" = "IngressGateways"
        "release" = "istio"
      }
      "name" = "istio-ingressgateway-sds"
      "namespace" = "istio-system"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "Role"
      "name" = "istio-ingressgateway-sds"
    }
    "subjects" = [
      {
        "kind" = "ServiceAccount"
        "name" = "istio-ingressgateway-service-account"
      },
    ]
  }
}

resource "kubernetes_manifest" "rolebinding_istio_system_istiod" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "RoleBinding"
    "metadata" = {
      "labels" = {
        "app" = "istiod"
        "release" = "istio"
      }
      "name" = "istiod"
      "namespace" = "istio-system"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "Role"
      "name" = "istiod"
    }
    "subjects" = [
      {
        "kind" = "ServiceAccount"
        "name" = "istiod"
        "namespace" = "istio-system"
      },
    ]
  }
}

resource "kubernetes_manifest" "horizontalpodautoscaler_istio_system_istio_ingressgateway" {
  manifest = {
    "apiVersion" = "autoscaling/v2"
    "kind" = "HorizontalPodAutoscaler"
    "metadata" = {
      "labels" = {
        "app" = "istio-ingressgateway"
        "install.operator.istio.io/owning-resource" = "unknown"
        "istio" = "ingressgateway"
        "istio.io/rev" = "default"
        "operator.istio.io/component" = "IngressGateways"
        "release" = "istio"
      }
      "name" = "istio-ingressgateway"
      "namespace" = "istio-system"
    }
    "spec" = {
      "maxReplicas" = 5
      "metrics" = [
        {
          "resource" = {
            "name" = "cpu"
            "target" = {
              "averageUtilization" = 80
              "type" = "Utilization"
            }
          }
          "type" = "Resource"
        },
      ]
      "minReplicas" = 1
      "scaleTargetRef" = {
        "apiVersion" = "apps/v1"
        "kind" = "Deployment"
        "name" = "istio-ingressgateway"
      }
    }
  }
}

resource "kubernetes_manifest" "horizontalpodautoscaler_istio_system_istiod" {
  manifest = {
    "apiVersion" = "autoscaling/v2"
    "kind" = "HorizontalPodAutoscaler"
    "metadata" = {
      "labels" = {
        "app" = "istiod"
        "install.operator.istio.io/owning-resource" = "unknown"
        "istio.io/rev" = "default"
        "operator.istio.io/component" = "Pilot"
        "release" = "istio"
      }
      "name" = "istiod"
      "namespace" = "istio-system"
    }
    "spec" = {
      "maxReplicas" = 5
      "metrics" = [
        {
          "resource" = {
            "name" = "cpu"
            "target" = {
              "averageUtilization" = 80
              "type" = "Utilization"
            }
          }
          "type" = "Resource"
        },
      ]
      "minReplicas" = 1
      "scaleTargetRef" = {
        "apiVersion" = "apps/v1"
        "kind" = "Deployment"
        "name" = "istiod"
      }
    }
  }
}

resource "kubernetes_manifest" "service_istio_system_istio_ingressgateway" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "labels" = {
        "app" = "istio-ingressgateway"
        "install.operator.istio.io/owning-resource" = "unknown"
        "istio" = "ingressgateway"
        "istio.io/rev" = "default"
        "operator.istio.io/component" = "IngressGateways"
        "release" = "istio"
      }
      "name" = "istio-ingressgateway"
      "namespace" = "istio-system"
    }
    "spec" = {
      "ports" = [
        {
          "name" = "status-port"
          "port" = 15021
          "protocol" = "TCP"
          "targetPort" = 15021
        },
        {
          "name" = "http2"
          "port" = 80
          "protocol" = "TCP"
          "targetPort" = 8080
        },
        {
          "name" = "https"
          "port" = 443
          "protocol" = "TCP"
          "targetPort" = 8443
        },
      ]
      "selector" = {
        "app" = "istio-ingressgateway"
        "istio" = "ingressgateway"
      }
      "type" = "LoadBalancer"
    }
  }
}

resource "kubernetes_manifest" "service_istio_system_istiod" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "labels" = {
        "app" = "istiod"
        "install.operator.istio.io/owning-resource" = "unknown"
        "istio" = "pilot"
        "istio.io/rev" = "default"
        "operator.istio.io/component" = "Pilot"
        "release" = "istio"
      }
      "name" = "istiod"
      "namespace" = "istio-system"
    }
    "spec" = {
      "ports" = [
        {
          "name" = "grpc-xds"
          "port" = 15010
          "protocol" = "TCP"
        },
        {
          "name" = "https-dns"
          "port" = 15012
          "protocol" = "TCP"
        },
        {
          "name" = "https-webhook"
          "port" = 443
          "protocol" = "TCP"
          "targetPort" = 15017
        },
        {
          "name" = "http-monitoring"
          "port" = 15014
          "protocol" = "TCP"
        },
      ]
      "selector" = {
        "app" = "istiod"
        "istio" = "pilot"
      }
    }
  }
}
