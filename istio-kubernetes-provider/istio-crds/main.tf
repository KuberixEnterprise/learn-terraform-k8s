resource "kubernetes_manifest" "customresourcedefinition_authorizationpolicies_security_istio_io" {
  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "annotations" = {
        "helm.sh/resource-policy" = "keep"
      }
      "labels" = {
        "app" = "istio-pilot"
        "chart" = "istio"
        "heritage" = "Tiller"
        "istio" = "security"
        "release" = "istio"
      }
      "name" = "authorizationpolicies.security.istio.io"
    }
    "spec" = {
      "group" = "security.istio.io"
      "names" = {
        "categories" = [
          "istio-io",
          "security-istio-io",
        ]
        "kind" = "AuthorizationPolicy"
        "listKind" = "AuthorizationPolicyList"
        "plural" = "authorizationpolicies"
        "singular" = "authorizationpolicy"
      }
      "scope" = "Namespaced"
      "versions" = [
        {
          "name" = "v1"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Configuration for access control on workloads. See more details at: https://istio.io/docs/reference/config/security/authorization-policy.html"
                  "oneOf" = [
                    {
                      "not" = {
                        "anyOf" = [
                          {
                            "required" = [
                              "provider",
                            ]
                          },
                        ]
                      }
                    },
                    {
                      "required" = [
                        "provider",
                      ]
                    },
                  ]
                  "properties" = {
                    "action" = {
                      "description" = "Optional."
                      "enum" = [
                        "ALLOW",
                        "DENY",
                        "AUDIT",
                        "CUSTOM",
                      ]
                      "type" = "string"
                    }
                    "provider" = {
                      "description" = "Specifies detailed configuration of the CUSTOM action."
                      "properties" = {
                        "name" = {
                          "description" = "Specifies the name of the extension provider."
                          "type" = "string"
                        }
                      }
                      "type" = "object"
                    }
                    "rules" = {
                      "description" = "Optional."
                      "items" = {
                        "properties" = {
                          "from" = {
                            "description" = "Optional."
                            "items" = {
                              "properties" = {
                                "source" = {
                                  "description" = "Source specifies the source of a request."
                                  "properties" = {
                                    "ipBlocks" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "namespaces" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "notIpBlocks" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "notNamespaces" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "notPrincipals" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "notRemoteIpBlocks" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "notRequestPrincipals" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "principals" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "remoteIpBlocks" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "requestPrincipals" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                  }
                                  "type" = "object"
                                }
                              }
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "to" = {
                            "description" = "Optional."
                            "items" = {
                              "properties" = {
                                "operation" = {
                                  "description" = "Operation specifies the operation of a request."
                                  "properties" = {
                                    "hosts" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "methods" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "notHosts" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "notMethods" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "notPaths" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "notPorts" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "paths" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "ports" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                  }
                                  "type" = "object"
                                }
                              }
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "when" = {
                            "description" = "Optional."
                            "items" = {
                              "properties" = {
                                "key" = {
                                  "description" = "The name of an Istio attribute."
                                  "type" = "string"
                                }
                                "notValues" = {
                                  "description" = "Optional."
                                  "items" = {
                                    "type" = "string"
                                  }
                                  "type" = "array"
                                }
                                "values" = {
                                  "description" = "Optional."
                                  "items" = {
                                    "type" = "string"
                                  }
                                  "type" = "array"
                                }
                              }
                              "required" = [
                                "key",
                              ]
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                        }
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "selector" = {
                      "description" = "Optional."
                      "properties" = {
                        "matchLabels" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "description" = "One or more labels that indicate a specific set of pods/VMs on which a policy should be applied."
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                    "targetRef" = {
                      "description" = "Optional."
                      "properties" = {
                        "group" = {
                          "description" = "group is the group of the target resource."
                          "type" = "string"
                        }
                        "kind" = {
                          "description" = "kind is kind of the target resource."
                          "type" = "string"
                        }
                        "name" = {
                          "description" = "name is the name of the target resource."
                          "type" = "string"
                        }
                        "namespace" = {
                          "description" = "namespace is the namespace of the referent."
                          "type" = "string"
                        }
                      }
                      "type" = "object"
                    }
                  }
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = false
          "subresources" = {
            "status" = {}
          }
        },
        {
          "name" = "v1beta1"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Configuration for access control on workloads. See more details at: https://istio.io/docs/reference/config/security/authorization-policy.html"
                  "oneOf" = [
                    {
                      "not" = {
                        "anyOf" = [
                          {
                            "required" = [
                              "provider",
                            ]
                          },
                        ]
                      }
                    },
                    {
                      "required" = [
                        "provider",
                      ]
                    },
                  ]
                  "properties" = {
                    "action" = {
                      "description" = "Optional."
                      "enum" = [
                        "ALLOW",
                        "DENY",
                        "AUDIT",
                        "CUSTOM",
                      ]
                      "type" = "string"
                    }
                    "provider" = {
                      "description" = "Specifies detailed configuration of the CUSTOM action."
                      "properties" = {
                        "name" = {
                          "description" = "Specifies the name of the extension provider."
                          "type" = "string"
                        }
                      }
                      "type" = "object"
                    }
                    "rules" = {
                      "description" = "Optional."
                      "items" = {
                        "properties" = {
                          "from" = {
                            "description" = "Optional."
                            "items" = {
                              "properties" = {
                                "source" = {
                                  "description" = "Source specifies the source of a request."
                                  "properties" = {
                                    "ipBlocks" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "namespaces" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "notIpBlocks" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "notNamespaces" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "notPrincipals" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "notRemoteIpBlocks" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "notRequestPrincipals" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "principals" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "remoteIpBlocks" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "requestPrincipals" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                  }
                                  "type" = "object"
                                }
                              }
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "to" = {
                            "description" = "Optional."
                            "items" = {
                              "properties" = {
                                "operation" = {
                                  "description" = "Operation specifies the operation of a request."
                                  "properties" = {
                                    "hosts" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "methods" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "notHosts" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "notMethods" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "notPaths" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "notPorts" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "paths" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                    "ports" = {
                                      "description" = "Optional."
                                      "items" = {
                                        "type" = "string"
                                      }
                                      "type" = "array"
                                    }
                                  }
                                  "type" = "object"
                                }
                              }
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "when" = {
                            "description" = "Optional."
                            "items" = {
                              "properties" = {
                                "key" = {
                                  "description" = "The name of an Istio attribute."
                                  "type" = "string"
                                }
                                "notValues" = {
                                  "description" = "Optional."
                                  "items" = {
                                    "type" = "string"
                                  }
                                  "type" = "array"
                                }
                                "values" = {
                                  "description" = "Optional."
                                  "items" = {
                                    "type" = "string"
                                  }
                                  "type" = "array"
                                }
                              }
                              "required" = [
                                "key",
                              ]
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                        }
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "selector" = {
                      "description" = "Optional."
                      "properties" = {
                        "matchLabels" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "description" = "One or more labels that indicate a specific set of pods/VMs on which a policy should be applied."
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                    "targetRef" = {
                      "description" = "Optional."
                      "properties" = {
                        "group" = {
                          "description" = "group is the group of the target resource."
                          "type" = "string"
                        }
                        "kind" = {
                          "description" = "kind is kind of the target resource."
                          "type" = "string"
                        }
                        "name" = {
                          "description" = "name is the name of the target resource."
                          "type" = "string"
                        }
                        "namespace" = {
                          "description" = "namespace is the namespace of the referent."
                          "type" = "string"
                        }
                      }
                      "type" = "object"
                    }
                  }
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = true
          "subresources" = {
            "status" = {}
          }
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "customresourcedefinition_destinationrules_networking_istio_io" {
  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "annotations" = {
        "helm.sh/resource-policy" = "keep"
      }
      "labels" = {
        "app" = "istio-pilot"
        "chart" = "istio"
        "heritage" = "Tiller"
        "release" = "istio"
      }
      "name" = "destinationrules.networking.istio.io"
    }
    "spec" = {
      "group" = "networking.istio.io"
      "names" = {
        "categories" = [
          "istio-io",
          "networking-istio-io",
        ]
        "kind" = "DestinationRule"
        "listKind" = "DestinationRuleList"
        "plural" = "destinationrules"
        "shortNames" = [
          "dr",
        ]
        "singular" = "destinationrule"
      }
      "scope" = "Namespaced"
      "versions" = [
        {
          "additionalPrinterColumns" = [
            {
              "description" = "The name of a service from the service registry"
              "jsonPath" = ".spec.host"
              "name" = "Host"
              "type" = "string"
            },
            {
              "description" = "CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC. Populated by the system. Read-only. Null for lists. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata"
              "jsonPath" = ".metadata.creationTimestamp"
              "name" = "Age"
              "type" = "date"
            },
          ]
          "name" = "v1alpha3"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Configuration affecting load balancing, outlier detection, etc. See more details at: https://istio.io/docs/reference/config/networking/destination-rule.html"
                  "properties" = {
                    "exportTo" = {
                      "description" = "A list of namespaces to which this destination rule is exported."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "host" = {
                      "description" = "The name of a service from the service registry."
                      "type" = "string"
                    }
                    "subsets" = {
                      "description" = "One or more named sets that represent individual versions of a service."
                      "items" = {
                        "properties" = {
                          "labels" = {
                            "additionalProperties" = {
                              "type" = "string"
                            }
                            "description" = "Labels apply a filter over the endpoints of a service in the service registry."
                            "type" = "object"
                          }
                          "name" = {
                            "description" = "Name of the subset."
                            "type" = "string"
                          }
                          "trafficPolicy" = {
                            "description" = "Traffic policies that apply to this subset."
                            "properties" = {
                              "connectionPool" = {
                                "properties" = {
                                  "http" = {
                                    "description" = "HTTP connection pool settings."
                                    "properties" = {
                                      "h2UpgradePolicy" = {
                                        "description" = "Specify if http1.1 connection should be upgraded to http2 for the associated destination."
                                        "enum" = [
                                          "DEFAULT",
                                          "DO_NOT_UPGRADE",
                                          "UPGRADE",
                                        ]
                                        "type" = "string"
                                      }
                                      "http1MaxPendingRequests" = {
                                        "description" = "Maximum number of requests that will be queued while waiting for a ready connection pool connection."
                                        "format" = "int32"
                                        "type" = "integer"
                                      }
                                      "http2MaxRequests" = {
                                        "description" = "Maximum number of active requests to a destination."
                                        "format" = "int32"
                                        "type" = "integer"
                                      }
                                      "idleTimeout" = {
                                        "description" = "The idle timeout for upstream connection pool connections."
                                        "type" = "string"
                                      }
                                      "maxRequestsPerConnection" = {
                                        "description" = "Maximum number of requests per connection to a backend."
                                        "format" = "int32"
                                        "type" = "integer"
                                      }
                                      "maxRetries" = {
                                        "description" = "Maximum number of retries that can be outstanding to all hosts in a cluster at a given time."
                                        "format" = "int32"
                                        "type" = "integer"
                                      }
                                      "useClientProtocol" = {
                                        "description" = "If set to true, client protocol will be preserved while initiating connection to backend."
                                        "type" = "boolean"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "tcp" = {
                                    "description" = "Settings common to both HTTP and TCP upstream connections."
                                    "properties" = {
                                      "connectTimeout" = {
                                        "description" = "TCP connection timeout."
                                        "type" = "string"
                                      }
                                      "maxConnectionDuration" = {
                                        "description" = "The maximum duration of a connection."
                                        "type" = "string"
                                      }
                                      "maxConnections" = {
                                        "description" = "Maximum number of HTTP1 /TCP connections to a destination host."
                                        "format" = "int32"
                                        "type" = "integer"
                                      }
                                      "tcpKeepalive" = {
                                        "description" = "If set then set SO_KEEPALIVE on the socket to enable TCP Keepalives."
                                        "properties" = {
                                          "interval" = {
                                            "description" = "The time duration between keep-alive probes."
                                            "type" = "string"
                                          }
                                          "probes" = {
                                            "description" = "Maximum number of keepalive probes to send without response before deciding the connection is dead."
                                            "type" = "integer"
                                          }
                                          "time" = {
                                            "description" = "The time duration a connection needs to be idle before keep-alive probes start being sent."
                                            "type" = "string"
                                          }
                                        }
                                        "type" = "object"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                }
                                "type" = "object"
                              }
                              "loadBalancer" = {
                                "description" = "Settings controlling the load balancer algorithms."
                                "oneOf" = [
                                  {
                                    "not" = {
                                      "anyOf" = [
                                        {
                                          "required" = [
                                            "simple",
                                          ]
                                        },
                                        {
                                          "required" = [
                                            "consistentHash",
                                          ]
                                        },
                                      ]
                                    }
                                  },
                                  {
                                    "required" = [
                                      "simple",
                                    ]
                                  },
                                  {
                                    "required" = [
                                      "consistentHash",
                                    ]
                                  },
                                ]
                                "properties" = {
                                  "consistentHash" = {
                                    "allOf" = [
                                      {
                                        "oneOf" = [
                                          {
                                            "not" = {
                                              "anyOf" = [
                                                {
                                                  "required" = [
                                                    "httpHeaderName",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "httpCookie",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "useSourceIp",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "httpQueryParameterName",
                                                  ]
                                                },
                                              ]
                                            }
                                          },
                                          {
                                            "required" = [
                                              "httpHeaderName",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "httpCookie",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "useSourceIp",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "httpQueryParameterName",
                                            ]
                                          },
                                        ]
                                      },
                                      {
                                        "oneOf" = [
                                          {
                                            "not" = {
                                              "anyOf" = [
                                                {
                                                  "required" = [
                                                    "ringHash",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "maglev",
                                                  ]
                                                },
                                              ]
                                            }
                                          },
                                          {
                                            "required" = [
                                              "ringHash",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "maglev",
                                            ]
                                          },
                                        ]
                                      },
                                    ]
                                    "properties" = {
                                      "httpCookie" = {
                                        "description" = "Hash based on HTTP cookie."
                                        "properties" = {
                                          "name" = {
                                            "description" = "Name of the cookie."
                                            "type" = "string"
                                          }
                                          "path" = {
                                            "description" = "Path to set for the cookie."
                                            "type" = "string"
                                          }
                                          "ttl" = {
                                            "description" = "Lifetime of the cookie."
                                            "type" = "string"
                                          }
                                        }
                                        "required" = [
                                          "name",
                                        ]
                                        "type" = "object"
                                      }
                                      "httpHeaderName" = {
                                        "description" = "Hash based on a specific HTTP header."
                                        "type" = "string"
                                      }
                                      "httpQueryParameterName" = {
                                        "description" = "Hash based on a specific HTTP query parameter."
                                        "type" = "string"
                                      }
                                      "maglev" = {
                                        "description" = "The Maglev load balancer implements consistent hashing to backend hosts."
                                        "properties" = {
                                          "tableSize" = {
                                            "description" = "The table size for Maglev hashing."
                                            "type" = "integer"
                                          }
                                        }
                                        "type" = "object"
                                      }
                                      "minimumRingSize" = {
                                        "description" = "Deprecated."
                                        "type" = "integer"
                                      }
                                      "ringHash" = {
                                        "description" = "The ring/modulo hash load balancer implements consistent hashing to backend hosts."
                                        "properties" = {
                                          "minimumRingSize" = {
                                            "description" = "The minimum number of virtual nodes to use for the hash ring."
                                            "type" = "integer"
                                          }
                                        }
                                        "type" = "object"
                                      }
                                      "useSourceIp" = {
                                        "description" = "Hash based on the source IP address."
                                        "type" = "boolean"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "localityLbSetting" = {
                                    "properties" = {
                                      "distribute" = {
                                        "description" = "Optional: only one of distribute, failover or failoverPriority can be set."
                                        "items" = {
                                          "properties" = {
                                            "from" = {
                                              "description" = "Originating locality, '/' separated, e.g."
                                              "type" = "string"
                                            }
                                            "to" = {
                                              "additionalProperties" = {
                                                "type" = "integer"
                                              }
                                              "description" = "Map of upstream localities to traffic distribution weights."
                                              "type" = "object"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "type" = "array"
                                      }
                                      "enabled" = {
                                        "description" = "enable locality load balancing, this is DestinationRule-level and will override mesh wide settings in entirety."
                                        "nullable" = true
                                        "type" = "boolean"
                                      }
                                      "failover" = {
                                        "description" = "Optional: only one of distribute, failover or failoverPriority can be set."
                                        "items" = {
                                          "properties" = {
                                            "from" = {
                                              "description" = "Originating region."
                                              "type" = "string"
                                            }
                                            "to" = {
                                              "description" = "Destination region the traffic will fail over to when endpoints in the 'from' region becomes unhealthy."
                                              "type" = "string"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "type" = "array"
                                      }
                                      "failoverPriority" = {
                                        "description" = "failoverPriority is an ordered list of labels used to sort endpoints to do priority based load balancing."
                                        "items" = {
                                          "type" = "string"
                                        }
                                        "type" = "array"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "simple" = {
                                    "enum" = [
                                      "UNSPECIFIED",
                                      "LEAST_CONN",
                                      "RANDOM",
                                      "PASSTHROUGH",
                                      "ROUND_ROBIN",
                                      "LEAST_REQUEST",
                                    ]
                                    "type" = "string"
                                  }
                                  "warmupDurationSecs" = {
                                    "description" = "Represents the warmup duration of Service."
                                    "type" = "string"
                                  }
                                }
                                "type" = "object"
                              }
                              "outlierDetection" = {
                                "properties" = {
                                  "baseEjectionTime" = {
                                    "description" = "Minimum ejection duration."
                                    "type" = "string"
                                  }
                                  "consecutive5xxErrors" = {
                                    "description" = "Number of 5xx errors before a host is ejected from the connection pool."
                                    "nullable" = true
                                    "type" = "integer"
                                  }
                                  "consecutiveErrors" = {
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "consecutiveGatewayErrors" = {
                                    "description" = "Number of gateway errors before a host is ejected from the connection pool."
                                    "nullable" = true
                                    "type" = "integer"
                                  }
                                  "consecutiveLocalOriginFailures" = {
                                    "description" = "The number of consecutive locally originated failures before ejection occurs."
                                    "nullable" = true
                                    "type" = "integer"
                                  }
                                  "interval" = {
                                    "description" = "Time interval between ejection sweep analysis."
                                    "type" = "string"
                                  }
                                  "maxEjectionPercent" = {
                                    "description" = "Maximum % of hosts in the load balancing pool for the upstream service that can be ejected."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "minHealthPercent" = {
                                    "description" = "Outlier detection will be enabled as long as the associated load balancing pool has at least min_health_percent hosts in healthy mode."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "splitExternalLocalOriginErrors" = {
                                    "description" = "Determines whether to distinguish local origin failures from external errors."
                                    "type" = "boolean"
                                  }
                                }
                                "type" = "object"
                              }
                              "portLevelSettings" = {
                                "description" = "Traffic policies specific to individual ports."
                                "items" = {
                                  "properties" = {
                                    "connectionPool" = {
                                      "properties" = {
                                        "http" = {
                                          "description" = "HTTP connection pool settings."
                                          "properties" = {
                                            "h2UpgradePolicy" = {
                                              "description" = "Specify if http1.1 connection should be upgraded to http2 for the associated destination."
                                              "enum" = [
                                                "DEFAULT",
                                                "DO_NOT_UPGRADE",
                                                "UPGRADE",
                                              ]
                                              "type" = "string"
                                            }
                                            "http1MaxPendingRequests" = {
                                              "description" = "Maximum number of requests that will be queued while waiting for a ready connection pool connection."
                                              "format" = "int32"
                                              "type" = "integer"
                                            }
                                            "http2MaxRequests" = {
                                              "description" = "Maximum number of active requests to a destination."
                                              "format" = "int32"
                                              "type" = "integer"
                                            }
                                            "idleTimeout" = {
                                              "description" = "The idle timeout for upstream connection pool connections."
                                              "type" = "string"
                                            }
                                            "maxRequestsPerConnection" = {
                                              "description" = "Maximum number of requests per connection to a backend."
                                              "format" = "int32"
                                              "type" = "integer"
                                            }
                                            "maxRetries" = {
                                              "description" = "Maximum number of retries that can be outstanding to all hosts in a cluster at a given time."
                                              "format" = "int32"
                                              "type" = "integer"
                                            }
                                            "useClientProtocol" = {
                                              "description" = "If set to true, client protocol will be preserved while initiating connection to backend."
                                              "type" = "boolean"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "tcp" = {
                                          "description" = "Settings common to both HTTP and TCP upstream connections."
                                          "properties" = {
                                            "connectTimeout" = {
                                              "description" = "TCP connection timeout."
                                              "type" = "string"
                                            }
                                            "maxConnectionDuration" = {
                                              "description" = "The maximum duration of a connection."
                                              "type" = "string"
                                            }
                                            "maxConnections" = {
                                              "description" = "Maximum number of HTTP1 /TCP connections to a destination host."
                                              "format" = "int32"
                                              "type" = "integer"
                                            }
                                            "tcpKeepalive" = {
                                              "description" = "If set then set SO_KEEPALIVE on the socket to enable TCP Keepalives."
                                              "properties" = {
                                                "interval" = {
                                                  "description" = "The time duration between keep-alive probes."
                                                  "type" = "string"
                                                }
                                                "probes" = {
                                                  "description" = "Maximum number of keepalive probes to send without response before deciding the connection is dead."
                                                  "type" = "integer"
                                                }
                                                "time" = {
                                                  "description" = "The time duration a connection needs to be idle before keep-alive probes start being sent."
                                                  "type" = "string"
                                                }
                                              }
                                              "type" = "object"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "loadBalancer" = {
                                      "description" = "Settings controlling the load balancer algorithms."
                                      "oneOf" = [
                                        {
                                          "not" = {
                                            "anyOf" = [
                                              {
                                                "required" = [
                                                  "simple",
                                                ]
                                              },
                                              {
                                                "required" = [
                                                  "consistentHash",
                                                ]
                                              },
                                            ]
                                          }
                                        },
                                        {
                                          "required" = [
                                            "simple",
                                          ]
                                        },
                                        {
                                          "required" = [
                                            "consistentHash",
                                          ]
                                        },
                                      ]
                                      "properties" = {
                                        "consistentHash" = {
                                          "allOf" = [
                                            {
                                              "oneOf" = [
                                                {
                                                  "not" = {
                                                    "anyOf" = [
                                                      {
                                                        "required" = [
                                                          "httpHeaderName",
                                                        ]
                                                      },
                                                      {
                                                        "required" = [
                                                          "httpCookie",
                                                        ]
                                                      },
                                                      {
                                                        "required" = [
                                                          "useSourceIp",
                                                        ]
                                                      },
                                                      {
                                                        "required" = [
                                                          "httpQueryParameterName",
                                                        ]
                                                      },
                                                    ]
                                                  }
                                                },
                                                {
                                                  "required" = [
                                                    "httpHeaderName",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "httpCookie",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "useSourceIp",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "httpQueryParameterName",
                                                  ]
                                                },
                                              ]
                                            },
                                            {
                                              "oneOf" = [
                                                {
                                                  "not" = {
                                                    "anyOf" = [
                                                      {
                                                        "required" = [
                                                          "ringHash",
                                                        ]
                                                      },
                                                      {
                                                        "required" = [
                                                          "maglev",
                                                        ]
                                                      },
                                                    ]
                                                  }
                                                },
                                                {
                                                  "required" = [
                                                    "ringHash",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "maglev",
                                                  ]
                                                },
                                              ]
                                            },
                                          ]
                                          "properties" = {
                                            "httpCookie" = {
                                              "description" = "Hash based on HTTP cookie."
                                              "properties" = {
                                                "name" = {
                                                  "description" = "Name of the cookie."
                                                  "type" = "string"
                                                }
                                                "path" = {
                                                  "description" = "Path to set for the cookie."
                                                  "type" = "string"
                                                }
                                                "ttl" = {
                                                  "description" = "Lifetime of the cookie."
                                                  "type" = "string"
                                                }
                                              }
                                              "required" = [
                                                "name",
                                              ]
                                              "type" = "object"
                                            }
                                            "httpHeaderName" = {
                                              "description" = "Hash based on a specific HTTP header."
                                              "type" = "string"
                                            }
                                            "httpQueryParameterName" = {
                                              "description" = "Hash based on a specific HTTP query parameter."
                                              "type" = "string"
                                            }
                                            "maglev" = {
                                              "description" = "The Maglev load balancer implements consistent hashing to backend hosts."
                                              "properties" = {
                                                "tableSize" = {
                                                  "description" = "The table size for Maglev hashing."
                                                  "type" = "integer"
                                                }
                                              }
                                              "type" = "object"
                                            }
                                            "minimumRingSize" = {
                                              "description" = "Deprecated."
                                              "type" = "integer"
                                            }
                                            "ringHash" = {
                                              "description" = "The ring/modulo hash load balancer implements consistent hashing to backend hosts."
                                              "properties" = {
                                                "minimumRingSize" = {
                                                  "description" = "The minimum number of virtual nodes to use for the hash ring."
                                                  "type" = "integer"
                                                }
                                              }
                                              "type" = "object"
                                            }
                                            "useSourceIp" = {
                                              "description" = "Hash based on the source IP address."
                                              "type" = "boolean"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "localityLbSetting" = {
                                          "properties" = {
                                            "distribute" = {
                                              "description" = "Optional: only one of distribute, failover or failoverPriority can be set."
                                              "items" = {
                                                "properties" = {
                                                  "from" = {
                                                    "description" = "Originating locality, '/' separated, e.g."
                                                    "type" = "string"
                                                  }
                                                  "to" = {
                                                    "additionalProperties" = {
                                                      "type" = "integer"
                                                    }
                                                    "description" = "Map of upstream localities to traffic distribution weights."
                                                    "type" = "object"
                                                  }
                                                }
                                                "type" = "object"
                                              }
                                              "type" = "array"
                                            }
                                            "enabled" = {
                                              "description" = "enable locality load balancing, this is DestinationRule-level and will override mesh wide settings in entirety."
                                              "nullable" = true
                                              "type" = "boolean"
                                            }
                                            "failover" = {
                                              "description" = "Optional: only one of distribute, failover or failoverPriority can be set."
                                              "items" = {
                                                "properties" = {
                                                  "from" = {
                                                    "description" = "Originating region."
                                                    "type" = "string"
                                                  }
                                                  "to" = {
                                                    "description" = "Destination region the traffic will fail over to when endpoints in the 'from' region becomes unhealthy."
                                                    "type" = "string"
                                                  }
                                                }
                                                "type" = "object"
                                              }
                                              "type" = "array"
                                            }
                                            "failoverPriority" = {
                                              "description" = "failoverPriority is an ordered list of labels used to sort endpoints to do priority based load balancing."
                                              "items" = {
                                                "type" = "string"
                                              }
                                              "type" = "array"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "simple" = {
                                          "enum" = [
                                            "UNSPECIFIED",
                                            "LEAST_CONN",
                                            "RANDOM",
                                            "PASSTHROUGH",
                                            "ROUND_ROBIN",
                                            "LEAST_REQUEST",
                                          ]
                                          "type" = "string"
                                        }
                                        "warmupDurationSecs" = {
                                          "description" = "Represents the warmup duration of Service."
                                          "type" = "string"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "outlierDetection" = {
                                      "properties" = {
                                        "baseEjectionTime" = {
                                          "description" = "Minimum ejection duration."
                                          "type" = "string"
                                        }
                                        "consecutive5xxErrors" = {
                                          "description" = "Number of 5xx errors before a host is ejected from the connection pool."
                                          "nullable" = true
                                          "type" = "integer"
                                        }
                                        "consecutiveErrors" = {
                                          "format" = "int32"
                                          "type" = "integer"
                                        }
                                        "consecutiveGatewayErrors" = {
                                          "description" = "Number of gateway errors before a host is ejected from the connection pool."
                                          "nullable" = true
                                          "type" = "integer"
                                        }
                                        "consecutiveLocalOriginFailures" = {
                                          "description" = "The number of consecutive locally originated failures before ejection occurs."
                                          "nullable" = true
                                          "type" = "integer"
                                        }
                                        "interval" = {
                                          "description" = "Time interval between ejection sweep analysis."
                                          "type" = "string"
                                        }
                                        "maxEjectionPercent" = {
                                          "description" = "Maximum % of hosts in the load balancing pool for the upstream service that can be ejected."
                                          "format" = "int32"
                                          "type" = "integer"
                                        }
                                        "minHealthPercent" = {
                                          "description" = "Outlier detection will be enabled as long as the associated load balancing pool has at least min_health_percent hosts in healthy mode."
                                          "format" = "int32"
                                          "type" = "integer"
                                        }
                                        "splitExternalLocalOriginErrors" = {
                                          "description" = "Determines whether to distinguish local origin failures from external errors."
                                          "type" = "boolean"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "port" = {
                                      "description" = "Specifies the number of a port on the destination service on which this policy is being applied."
                                      "properties" = {
                                        "number" = {
                                          "type" = "integer"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "tls" = {
                                      "description" = "TLS related settings for connections to the upstream service."
                                      "properties" = {
                                        "caCertificates" = {
                                          "description" = "OPTIONAL: The path to the file containing certificate authority certificates to use in verifying a presented server certificate."
                                          "type" = "string"
                                        }
                                        "clientCertificate" = {
                                          "description" = "REQUIRED if mode is `MUTUAL`."
                                          "type" = "string"
                                        }
                                        "credentialName" = {
                                          "description" = "The name of the secret that holds the TLS certs for the client including the CA certificates."
                                          "type" = "string"
                                        }
                                        "insecureSkipVerify" = {
                                          "description" = "`insecureSkipVerify` specifies whether the proxy should skip verifying the CA signature and SAN for the server certificate corresponding to the host."
                                          "nullable" = true
                                          "type" = "boolean"
                                        }
                                        "mode" = {
                                          "description" = "Indicates whether connections to this port should be secured using TLS."
                                          "enum" = [
                                            "DISABLE",
                                            "SIMPLE",
                                            "MUTUAL",
                                            "ISTIO_MUTUAL",
                                          ]
                                          "type" = "string"
                                        }
                                        "privateKey" = {
                                          "description" = "REQUIRED if mode is `MUTUAL`."
                                          "type" = "string"
                                        }
                                        "sni" = {
                                          "description" = "SNI string to present to the server during TLS handshake."
                                          "type" = "string"
                                        }
                                        "subjectAltNames" = {
                                          "description" = "A list of alternate names to verify the subject identity in the certificate."
                                          "items" = {
                                            "type" = "string"
                                          }
                                          "type" = "array"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "type" = "array"
                              }
                              "tls" = {
                                "description" = "TLS related settings for connections to the upstream service."
                                "properties" = {
                                  "caCertificates" = {
                                    "description" = "OPTIONAL: The path to the file containing certificate authority certificates to use in verifying a presented server certificate."
                                    "type" = "string"
                                  }
                                  "clientCertificate" = {
                                    "description" = "REQUIRED if mode is `MUTUAL`."
                                    "type" = "string"
                                  }
                                  "credentialName" = {
                                    "description" = "The name of the secret that holds the TLS certs for the client including the CA certificates."
                                    "type" = "string"
                                  }
                                  "insecureSkipVerify" = {
                                    "description" = "`insecureSkipVerify` specifies whether the proxy should skip verifying the CA signature and SAN for the server certificate corresponding to the host."
                                    "nullable" = true
                                    "type" = "boolean"
                                  }
                                  "mode" = {
                                    "description" = "Indicates whether connections to this port should be secured using TLS."
                                    "enum" = [
                                      "DISABLE",
                                      "SIMPLE",
                                      "MUTUAL",
                                      "ISTIO_MUTUAL",
                                    ]
                                    "type" = "string"
                                  }
                                  "privateKey" = {
                                    "description" = "REQUIRED if mode is `MUTUAL`."
                                    "type" = "string"
                                  }
                                  "sni" = {
                                    "description" = "SNI string to present to the server during TLS handshake."
                                    "type" = "string"
                                  }
                                  "subjectAltNames" = {
                                    "description" = "A list of alternate names to verify the subject identity in the certificate."
                                    "items" = {
                                      "type" = "string"
                                    }
                                    "type" = "array"
                                  }
                                }
                                "type" = "object"
                              }
                              "tunnel" = {
                                "description" = "Configuration of tunneling TCP over other transport or application layers for the host configured in the DestinationRule."
                                "properties" = {
                                  "protocol" = {
                                    "description" = "Specifies which protocol to use for tunneling the downstream connection."
                                    "type" = "string"
                                  }
                                  "targetHost" = {
                                    "description" = "Specifies a host to which the downstream connection is tunneled."
                                    "type" = "string"
                                  }
                                  "targetPort" = {
                                    "description" = "Specifies a port to which the downstream connection is tunneled."
                                    "type" = "integer"
                                  }
                                }
                                "required" = [
                                  "targetHost",
                                  "targetPort",
                                ]
                                "type" = "object"
                              }
                            }
                            "type" = "object"
                          }
                        }
                        "required" = [
                          "name",
                        ]
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "trafficPolicy" = {
                      "description" = "Traffic policies to apply (load balancing policy, connection pool sizes, outlier detection)."
                      "properties" = {
                        "connectionPool" = {
                          "properties" = {
                            "http" = {
                              "description" = "HTTP connection pool settings."
                              "properties" = {
                                "h2UpgradePolicy" = {
                                  "description" = "Specify if http1.1 connection should be upgraded to http2 for the associated destination."
                                  "enum" = [
                                    "DEFAULT",
                                    "DO_NOT_UPGRADE",
                                    "UPGRADE",
                                  ]
                                  "type" = "string"
                                }
                                "http1MaxPendingRequests" = {
                                  "description" = "Maximum number of requests that will be queued while waiting for a ready connection pool connection."
                                  "format" = "int32"
                                  "type" = "integer"
                                }
                                "http2MaxRequests" = {
                                  "description" = "Maximum number of active requests to a destination."
                                  "format" = "int32"
                                  "type" = "integer"
                                }
                                "idleTimeout" = {
                                  "description" = "The idle timeout for upstream connection pool connections."
                                  "type" = "string"
                                }
                                "maxRequestsPerConnection" = {
                                  "description" = "Maximum number of requests per connection to a backend."
                                  "format" = "int32"
                                  "type" = "integer"
                                }
                                "maxRetries" = {
                                  "description" = "Maximum number of retries that can be outstanding to all hosts in a cluster at a given time."
                                  "format" = "int32"
                                  "type" = "integer"
                                }
                                "useClientProtocol" = {
                                  "description" = "If set to true, client protocol will be preserved while initiating connection to backend."
                                  "type" = "boolean"
                                }
                              }
                              "type" = "object"
                            }
                            "tcp" = {
                              "description" = "Settings common to both HTTP and TCP upstream connections."
                              "properties" = {
                                "connectTimeout" = {
                                  "description" = "TCP connection timeout."
                                  "type" = "string"
                                }
                                "maxConnectionDuration" = {
                                  "description" = "The maximum duration of a connection."
                                  "type" = "string"
                                }
                                "maxConnections" = {
                                  "description" = "Maximum number of HTTP1 /TCP connections to a destination host."
                                  "format" = "int32"
                                  "type" = "integer"
                                }
                                "tcpKeepalive" = {
                                  "description" = "If set then set SO_KEEPALIVE on the socket to enable TCP Keepalives."
                                  "properties" = {
                                    "interval" = {
                                      "description" = "The time duration between keep-alive probes."
                                      "type" = "string"
                                    }
                                    "probes" = {
                                      "description" = "Maximum number of keepalive probes to send without response before deciding the connection is dead."
                                      "type" = "integer"
                                    }
                                    "time" = {
                                      "description" = "The time duration a connection needs to be idle before keep-alive probes start being sent."
                                      "type" = "string"
                                    }
                                  }
                                  "type" = "object"
                                }
                              }
                              "type" = "object"
                            }
                          }
                          "type" = "object"
                        }
                        "loadBalancer" = {
                          "description" = "Settings controlling the load balancer algorithms."
                          "oneOf" = [
                            {
                              "not" = {
                                "anyOf" = [
                                  {
                                    "required" = [
                                      "simple",
                                    ]
                                  },
                                  {
                                    "required" = [
                                      "consistentHash",
                                    ]
                                  },
                                ]
                              }
                            },
                            {
                              "required" = [
                                "simple",
                              ]
                            },
                            {
                              "required" = [
                                "consistentHash",
                              ]
                            },
                          ]
                          "properties" = {
                            "consistentHash" = {
                              "allOf" = [
                                {
                                  "oneOf" = [
                                    {
                                      "not" = {
                                        "anyOf" = [
                                          {
                                            "required" = [
                                              "httpHeaderName",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "httpCookie",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "useSourceIp",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "httpQueryParameterName",
                                            ]
                                          },
                                        ]
                                      }
                                    },
                                    {
                                      "required" = [
                                        "httpHeaderName",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "httpCookie",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "useSourceIp",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "httpQueryParameterName",
                                      ]
                                    },
                                  ]
                                },
                                {
                                  "oneOf" = [
                                    {
                                      "not" = {
                                        "anyOf" = [
                                          {
                                            "required" = [
                                              "ringHash",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "maglev",
                                            ]
                                          },
                                        ]
                                      }
                                    },
                                    {
                                      "required" = [
                                        "ringHash",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "maglev",
                                      ]
                                    },
                                  ]
                                },
                              ]
                              "properties" = {
                                "httpCookie" = {
                                  "description" = "Hash based on HTTP cookie."
                                  "properties" = {
                                    "name" = {
                                      "description" = "Name of the cookie."
                                      "type" = "string"
                                    }
                                    "path" = {
                                      "description" = "Path to set for the cookie."
                                      "type" = "string"
                                    }
                                    "ttl" = {
                                      "description" = "Lifetime of the cookie."
                                      "type" = "string"
                                    }
                                  }
                                  "required" = [
                                    "name",
                                  ]
                                  "type" = "object"
                                }
                                "httpHeaderName" = {
                                  "description" = "Hash based on a specific HTTP header."
                                  "type" = "string"
                                }
                                "httpQueryParameterName" = {
                                  "description" = "Hash based on a specific HTTP query parameter."
                                  "type" = "string"
                                }
                                "maglev" = {
                                  "description" = "The Maglev load balancer implements consistent hashing to backend hosts."
                                  "properties" = {
                                    "tableSize" = {
                                      "description" = "The table size for Maglev hashing."
                                      "type" = "integer"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "minimumRingSize" = {
                                  "description" = "Deprecated."
                                  "type" = "integer"
                                }
                                "ringHash" = {
                                  "description" = "The ring/modulo hash load balancer implements consistent hashing to backend hosts."
                                  "properties" = {
                                    "minimumRingSize" = {
                                      "description" = "The minimum number of virtual nodes to use for the hash ring."
                                      "type" = "integer"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "useSourceIp" = {
                                  "description" = "Hash based on the source IP address."
                                  "type" = "boolean"
                                }
                              }
                              "type" = "object"
                            }
                            "localityLbSetting" = {
                              "properties" = {
                                "distribute" = {
                                  "description" = "Optional: only one of distribute, failover or failoverPriority can be set."
                                  "items" = {
                                    "properties" = {
                                      "from" = {
                                        "description" = "Originating locality, '/' separated, e.g."
                                        "type" = "string"
                                      }
                                      "to" = {
                                        "additionalProperties" = {
                                          "type" = "integer"
                                        }
                                        "description" = "Map of upstream localities to traffic distribution weights."
                                        "type" = "object"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "type" = "array"
                                }
                                "enabled" = {
                                  "description" = "enable locality load balancing, this is DestinationRule-level and will override mesh wide settings in entirety."
                                  "nullable" = true
                                  "type" = "boolean"
                                }
                                "failover" = {
                                  "description" = "Optional: only one of distribute, failover or failoverPriority can be set."
                                  "items" = {
                                    "properties" = {
                                      "from" = {
                                        "description" = "Originating region."
                                        "type" = "string"
                                      }
                                      "to" = {
                                        "description" = "Destination region the traffic will fail over to when endpoints in the 'from' region becomes unhealthy."
                                        "type" = "string"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "type" = "array"
                                }
                                "failoverPriority" = {
                                  "description" = "failoverPriority is an ordered list of labels used to sort endpoints to do priority based load balancing."
                                  "items" = {
                                    "type" = "string"
                                  }
                                  "type" = "array"
                                }
                              }
                              "type" = "object"
                            }
                            "simple" = {
                              "enum" = [
                                "UNSPECIFIED",
                                "LEAST_CONN",
                                "RANDOM",
                                "PASSTHROUGH",
                                "ROUND_ROBIN",
                                "LEAST_REQUEST",
                              ]
                              "type" = "string"
                            }
                            "warmupDurationSecs" = {
                              "description" = "Represents the warmup duration of Service."
                              "type" = "string"
                            }
                          }
                          "type" = "object"
                        }
                        "outlierDetection" = {
                          "properties" = {
                            "baseEjectionTime" = {
                              "description" = "Minimum ejection duration."
                              "type" = "string"
                            }
                            "consecutive5xxErrors" = {
                              "description" = "Number of 5xx errors before a host is ejected from the connection pool."
                              "nullable" = true
                              "type" = "integer"
                            }
                            "consecutiveErrors" = {
                              "format" = "int32"
                              "type" = "integer"
                            }
                            "consecutiveGatewayErrors" = {
                              "description" = "Number of gateway errors before a host is ejected from the connection pool."
                              "nullable" = true
                              "type" = "integer"
                            }
                            "consecutiveLocalOriginFailures" = {
                              "description" = "The number of consecutive locally originated failures before ejection occurs."
                              "nullable" = true
                              "type" = "integer"
                            }
                            "interval" = {
                              "description" = "Time interval between ejection sweep analysis."
                              "type" = "string"
                            }
                            "maxEjectionPercent" = {
                              "description" = "Maximum % of hosts in the load balancing pool for the upstream service that can be ejected."
                              "format" = "int32"
                              "type" = "integer"
                            }
                            "minHealthPercent" = {
                              "description" = "Outlier detection will be enabled as long as the associated load balancing pool has at least min_health_percent hosts in healthy mode."
                              "format" = "int32"
                              "type" = "integer"
                            }
                            "splitExternalLocalOriginErrors" = {
                              "description" = "Determines whether to distinguish local origin failures from external errors."
                              "type" = "boolean"
                            }
                          }
                          "type" = "object"
                        }
                        "portLevelSettings" = {
                          "description" = "Traffic policies specific to individual ports."
                          "items" = {
                            "properties" = {
                              "connectionPool" = {
                                "properties" = {
                                  "http" = {
                                    "description" = "HTTP connection pool settings."
                                    "properties" = {
                                      "h2UpgradePolicy" = {
                                        "description" = "Specify if http1.1 connection should be upgraded to http2 for the associated destination."
                                        "enum" = [
                                          "DEFAULT",
                                          "DO_NOT_UPGRADE",
                                          "UPGRADE",
                                        ]
                                        "type" = "string"
                                      }
                                      "http1MaxPendingRequests" = {
                                        "description" = "Maximum number of requests that will be queued while waiting for a ready connection pool connection."
                                        "format" = "int32"
                                        "type" = "integer"
                                      }
                                      "http2MaxRequests" = {
                                        "description" = "Maximum number of active requests to a destination."
                                        "format" = "int32"
                                        "type" = "integer"
                                      }
                                      "idleTimeout" = {
                                        "description" = "The idle timeout for upstream connection pool connections."
                                        "type" = "string"
                                      }
                                      "maxRequestsPerConnection" = {
                                        "description" = "Maximum number of requests per connection to a backend."
                                        "format" = "int32"
                                        "type" = "integer"
                                      }
                                      "maxRetries" = {
                                        "description" = "Maximum number of retries that can be outstanding to all hosts in a cluster at a given time."
                                        "format" = "int32"
                                        "type" = "integer"
                                      }
                                      "useClientProtocol" = {
                                        "description" = "If set to true, client protocol will be preserved while initiating connection to backend."
                                        "type" = "boolean"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "tcp" = {
                                    "description" = "Settings common to both HTTP and TCP upstream connections."
                                    "properties" = {
                                      "connectTimeout" = {
                                        "description" = "TCP connection timeout."
                                        "type" = "string"
                                      }
                                      "maxConnectionDuration" = {
                                        "description" = "The maximum duration of a connection."
                                        "type" = "string"
                                      }
                                      "maxConnections" = {
                                        "description" = "Maximum number of HTTP1 /TCP connections to a destination host."
                                        "format" = "int32"
                                        "type" = "integer"
                                      }
                                      "tcpKeepalive" = {
                                        "description" = "If set then set SO_KEEPALIVE on the socket to enable TCP Keepalives."
                                        "properties" = {
                                          "interval" = {
                                            "description" = "The time duration between keep-alive probes."
                                            "type" = "string"
                                          }
                                          "probes" = {
                                            "description" = "Maximum number of keepalive probes to send without response before deciding the connection is dead."
                                            "type" = "integer"
                                          }
                                          "time" = {
                                            "description" = "The time duration a connection needs to be idle before keep-alive probes start being sent."
                                            "type" = "string"
                                          }
                                        }
                                        "type" = "object"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                }
                                "type" = "object"
                              }
                              "loadBalancer" = {
                                "description" = "Settings controlling the load balancer algorithms."
                                "oneOf" = [
                                  {
                                    "not" = {
                                      "anyOf" = [
                                        {
                                          "required" = [
                                            "simple",
                                          ]
                                        },
                                        {
                                          "required" = [
                                            "consistentHash",
                                          ]
                                        },
                                      ]
                                    }
                                  },
                                  {
                                    "required" = [
                                      "simple",
                                    ]
                                  },
                                  {
                                    "required" = [
                                      "consistentHash",
                                    ]
                                  },
                                ]
                                "properties" = {
                                  "consistentHash" = {
                                    "allOf" = [
                                      {
                                        "oneOf" = [
                                          {
                                            "not" = {
                                              "anyOf" = [
                                                {
                                                  "required" = [
                                                    "httpHeaderName",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "httpCookie",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "useSourceIp",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "httpQueryParameterName",
                                                  ]
                                                },
                                              ]
                                            }
                                          },
                                          {
                                            "required" = [
                                              "httpHeaderName",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "httpCookie",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "useSourceIp",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "httpQueryParameterName",
                                            ]
                                          },
                                        ]
                                      },
                                      {
                                        "oneOf" = [
                                          {
                                            "not" = {
                                              "anyOf" = [
                                                {
                                                  "required" = [
                                                    "ringHash",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "maglev",
                                                  ]
                                                },
                                              ]
                                            }
                                          },
                                          {
                                            "required" = [
                                              "ringHash",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "maglev",
                                            ]
                                          },
                                        ]
                                      },
                                    ]
                                    "properties" = {
                                      "httpCookie" = {
                                        "description" = "Hash based on HTTP cookie."
                                        "properties" = {
                                          "name" = {
                                            "description" = "Name of the cookie."
                                            "type" = "string"
                                          }
                                          "path" = {
                                            "description" = "Path to set for the cookie."
                                            "type" = "string"
                                          }
                                          "ttl" = {
                                            "description" = "Lifetime of the cookie."
                                            "type" = "string"
                                          }
                                        }
                                        "required" = [
                                          "name",
                                        ]
                                        "type" = "object"
                                      }
                                      "httpHeaderName" = {
                                        "description" = "Hash based on a specific HTTP header."
                                        "type" = "string"
                                      }
                                      "httpQueryParameterName" = {
                                        "description" = "Hash based on a specific HTTP query parameter."
                                        "type" = "string"
                                      }
                                      "maglev" = {
                                        "description" = "The Maglev load balancer implements consistent hashing to backend hosts."
                                        "properties" = {
                                          "tableSize" = {
                                            "description" = "The table size for Maglev hashing."
                                            "type" = "integer"
                                          }
                                        }
                                        "type" = "object"
                                      }
                                      "minimumRingSize" = {
                                        "description" = "Deprecated."
                                        "type" = "integer"
                                      }
                                      "ringHash" = {
                                        "description" = "The ring/modulo hash load balancer implements consistent hashing to backend hosts."
                                        "properties" = {
                                          "minimumRingSize" = {
                                            "description" = "The minimum number of virtual nodes to use for the hash ring."
                                            "type" = "integer"
                                          }
                                        }
                                        "type" = "object"
                                      }
                                      "useSourceIp" = {
                                        "description" = "Hash based on the source IP address."
                                        "type" = "boolean"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "localityLbSetting" = {
                                    "properties" = {
                                      "distribute" = {
                                        "description" = "Optional: only one of distribute, failover or failoverPriority can be set."
                                        "items" = {
                                          "properties" = {
                                            "from" = {
                                              "description" = "Originating locality, '/' separated, e.g."
                                              "type" = "string"
                                            }
                                            "to" = {
                                              "additionalProperties" = {
                                                "type" = "integer"
                                              }
                                              "description" = "Map of upstream localities to traffic distribution weights."
                                              "type" = "object"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "type" = "array"
                                      }
                                      "enabled" = {
                                        "description" = "enable locality load balancing, this is DestinationRule-level and will override mesh wide settings in entirety."
                                        "nullable" = true
                                        "type" = "boolean"
                                      }
                                      "failover" = {
                                        "description" = "Optional: only one of distribute, failover or failoverPriority can be set."
                                        "items" = {
                                          "properties" = {
                                            "from" = {
                                              "description" = "Originating region."
                                              "type" = "string"
                                            }
                                            "to" = {
                                              "description" = "Destination region the traffic will fail over to when endpoints in the 'from' region becomes unhealthy."
                                              "type" = "string"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "type" = "array"
                                      }
                                      "failoverPriority" = {
                                        "description" = "failoverPriority is an ordered list of labels used to sort endpoints to do priority based load balancing."
                                        "items" = {
                                          "type" = "string"
                                        }
                                        "type" = "array"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "simple" = {
                                    "enum" = [
                                      "UNSPECIFIED",
                                      "LEAST_CONN",
                                      "RANDOM",
                                      "PASSTHROUGH",
                                      "ROUND_ROBIN",
                                      "LEAST_REQUEST",
                                    ]
                                    "type" = "string"
                                  }
                                  "warmupDurationSecs" = {
                                    "description" = "Represents the warmup duration of Service."
                                    "type" = "string"
                                  }
                                }
                                "type" = "object"
                              }
                              "outlierDetection" = {
                                "properties" = {
                                  "baseEjectionTime" = {
                                    "description" = "Minimum ejection duration."
                                    "type" = "string"
                                  }
                                  "consecutive5xxErrors" = {
                                    "description" = "Number of 5xx errors before a host is ejected from the connection pool."
                                    "nullable" = true
                                    "type" = "integer"
                                  }
                                  "consecutiveErrors" = {
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "consecutiveGatewayErrors" = {
                                    "description" = "Number of gateway errors before a host is ejected from the connection pool."
                                    "nullable" = true
                                    "type" = "integer"
                                  }
                                  "consecutiveLocalOriginFailures" = {
                                    "description" = "The number of consecutive locally originated failures before ejection occurs."
                                    "nullable" = true
                                    "type" = "integer"
                                  }
                                  "interval" = {
                                    "description" = "Time interval between ejection sweep analysis."
                                    "type" = "string"
                                  }
                                  "maxEjectionPercent" = {
                                    "description" = "Maximum % of hosts in the load balancing pool for the upstream service that can be ejected."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "minHealthPercent" = {
                                    "description" = "Outlier detection will be enabled as long as the associated load balancing pool has at least min_health_percent hosts in healthy mode."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "splitExternalLocalOriginErrors" = {
                                    "description" = "Determines whether to distinguish local origin failures from external errors."
                                    "type" = "boolean"
                                  }
                                }
                                "type" = "object"
                              }
                              "port" = {
                                "description" = "Specifies the number of a port on the destination service on which this policy is being applied."
                                "properties" = {
                                  "number" = {
                                    "type" = "integer"
                                  }
                                }
                                "type" = "object"
                              }
                              "tls" = {
                                "description" = "TLS related settings for connections to the upstream service."
                                "properties" = {
                                  "caCertificates" = {
                                    "description" = "OPTIONAL: The path to the file containing certificate authority certificates to use in verifying a presented server certificate."
                                    "type" = "string"
                                  }
                                  "clientCertificate" = {
                                    "description" = "REQUIRED if mode is `MUTUAL`."
                                    "type" = "string"
                                  }
                                  "credentialName" = {
                                    "description" = "The name of the secret that holds the TLS certs for the client including the CA certificates."
                                    "type" = "string"
                                  }
                                  "insecureSkipVerify" = {
                                    "description" = "`insecureSkipVerify` specifies whether the proxy should skip verifying the CA signature and SAN for the server certificate corresponding to the host."
                                    "nullable" = true
                                    "type" = "boolean"
                                  }
                                  "mode" = {
                                    "description" = "Indicates whether connections to this port should be secured using TLS."
                                    "enum" = [
                                      "DISABLE",
                                      "SIMPLE",
                                      "MUTUAL",
                                      "ISTIO_MUTUAL",
                                    ]
                                    "type" = "string"
                                  }
                                  "privateKey" = {
                                    "description" = "REQUIRED if mode is `MUTUAL`."
                                    "type" = "string"
                                  }
                                  "sni" = {
                                    "description" = "SNI string to present to the server during TLS handshake."
                                    "type" = "string"
                                  }
                                  "subjectAltNames" = {
                                    "description" = "A list of alternate names to verify the subject identity in the certificate."
                                    "items" = {
                                      "type" = "string"
                                    }
                                    "type" = "array"
                                  }
                                }
                                "type" = "object"
                              }
                            }
                            "type" = "object"
                          }
                          "type" = "array"
                        }
                        "tls" = {
                          "description" = "TLS related settings for connections to the upstream service."
                          "properties" = {
                            "caCertificates" = {
                              "description" = "OPTIONAL: The path to the file containing certificate authority certificates to use in verifying a presented server certificate."
                              "type" = "string"
                            }
                            "clientCertificate" = {
                              "description" = "REQUIRED if mode is `MUTUAL`."
                              "type" = "string"
                            }
                            "credentialName" = {
                              "description" = "The name of the secret that holds the TLS certs for the client including the CA certificates."
                              "type" = "string"
                            }
                            "insecureSkipVerify" = {
                              "description" = "`insecureSkipVerify` specifies whether the proxy should skip verifying the CA signature and SAN for the server certificate corresponding to the host."
                              "nullable" = true
                              "type" = "boolean"
                            }
                            "mode" = {
                              "description" = "Indicates whether connections to this port should be secured using TLS."
                              "enum" = [
                                "DISABLE",
                                "SIMPLE",
                                "MUTUAL",
                                "ISTIO_MUTUAL",
                              ]
                              "type" = "string"
                            }
                            "privateKey" = {
                              "description" = "REQUIRED if mode is `MUTUAL`."
                              "type" = "string"
                            }
                            "sni" = {
                              "description" = "SNI string to present to the server during TLS handshake."
                              "type" = "string"
                            }
                            "subjectAltNames" = {
                              "description" = "A list of alternate names to verify the subject identity in the certificate."
                              "items" = {
                                "type" = "string"
                              }
                              "type" = "array"
                            }
                          }
                          "type" = "object"
                        }
                        "tunnel" = {
                          "description" = "Configuration of tunneling TCP over other transport or application layers for the host configured in the DestinationRule."
                          "properties" = {
                            "protocol" = {
                              "description" = "Specifies which protocol to use for tunneling the downstream connection."
                              "type" = "string"
                            }
                            "targetHost" = {
                              "description" = "Specifies a host to which the downstream connection is tunneled."
                              "type" = "string"
                            }
                            "targetPort" = {
                              "description" = "Specifies a port to which the downstream connection is tunneled."
                              "type" = "integer"
                            }
                          }
                          "required" = [
                            "targetHost",
                            "targetPort",
                          ]
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                    "workloadSelector" = {
                      "description" = "Criteria used to select the specific set of pods/VMs on which this `DestinationRule` configuration should be applied."
                      "properties" = {
                        "matchLabels" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "description" = "One or more labels that indicate a specific set of pods/VMs on which a policy should be applied."
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                  }
                  "required" = [
                    "host",
                  ]
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = true
          "subresources" = {
            "status" = {}
          }
        },
        {
          "additionalPrinterColumns" = [
            {
              "description" = "The name of a service from the service registry"
              "jsonPath" = ".spec.host"
              "name" = "Host"
              "type" = "string"
            },
            {
              "description" = "CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC. Populated by the system. Read-only. Null for lists. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata"
              "jsonPath" = ".metadata.creationTimestamp"
              "name" = "Age"
              "type" = "date"
            },
          ]
          "name" = "v1beta1"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Configuration affecting load balancing, outlier detection, etc. See more details at: https://istio.io/docs/reference/config/networking/destination-rule.html"
                  "properties" = {
                    "exportTo" = {
                      "description" = "A list of namespaces to which this destination rule is exported."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "host" = {
                      "description" = "The name of a service from the service registry."
                      "type" = "string"
                    }
                    "subsets" = {
                      "description" = "One or more named sets that represent individual versions of a service."
                      "items" = {
                        "properties" = {
                          "labels" = {
                            "additionalProperties" = {
                              "type" = "string"
                            }
                            "description" = "Labels apply a filter over the endpoints of a service in the service registry."
                            "type" = "object"
                          }
                          "name" = {
                            "description" = "Name of the subset."
                            "type" = "string"
                          }
                          "trafficPolicy" = {
                            "description" = "Traffic policies that apply to this subset."
                            "properties" = {
                              "connectionPool" = {
                                "properties" = {
                                  "http" = {
                                    "description" = "HTTP connection pool settings."
                                    "properties" = {
                                      "h2UpgradePolicy" = {
                                        "description" = "Specify if http1.1 connection should be upgraded to http2 for the associated destination."
                                        "enum" = [
                                          "DEFAULT",
                                          "DO_NOT_UPGRADE",
                                          "UPGRADE",
                                        ]
                                        "type" = "string"
                                      }
                                      "http1MaxPendingRequests" = {
                                        "description" = "Maximum number of requests that will be queued while waiting for a ready connection pool connection."
                                        "format" = "int32"
                                        "type" = "integer"
                                      }
                                      "http2MaxRequests" = {
                                        "description" = "Maximum number of active requests to a destination."
                                        "format" = "int32"
                                        "type" = "integer"
                                      }
                                      "idleTimeout" = {
                                        "description" = "The idle timeout for upstream connection pool connections."
                                        "type" = "string"
                                      }
                                      "maxRequestsPerConnection" = {
                                        "description" = "Maximum number of requests per connection to a backend."
                                        "format" = "int32"
                                        "type" = "integer"
                                      }
                                      "maxRetries" = {
                                        "description" = "Maximum number of retries that can be outstanding to all hosts in a cluster at a given time."
                                        "format" = "int32"
                                        "type" = "integer"
                                      }
                                      "useClientProtocol" = {
                                        "description" = "If set to true, client protocol will be preserved while initiating connection to backend."
                                        "type" = "boolean"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "tcp" = {
                                    "description" = "Settings common to both HTTP and TCP upstream connections."
                                    "properties" = {
                                      "connectTimeout" = {
                                        "description" = "TCP connection timeout."
                                        "type" = "string"
                                      }
                                      "maxConnectionDuration" = {
                                        "description" = "The maximum duration of a connection."
                                        "type" = "string"
                                      }
                                      "maxConnections" = {
                                        "description" = "Maximum number of HTTP1 /TCP connections to a destination host."
                                        "format" = "int32"
                                        "type" = "integer"
                                      }
                                      "tcpKeepalive" = {
                                        "description" = "If set then set SO_KEEPALIVE on the socket to enable TCP Keepalives."
                                        "properties" = {
                                          "interval" = {
                                            "description" = "The time duration between keep-alive probes."
                                            "type" = "string"
                                          }
                                          "probes" = {
                                            "description" = "Maximum number of keepalive probes to send without response before deciding the connection is dead."
                                            "type" = "integer"
                                          }
                                          "time" = {
                                            "description" = "The time duration a connection needs to be idle before keep-alive probes start being sent."
                                            "type" = "string"
                                          }
                                        }
                                        "type" = "object"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                }
                                "type" = "object"
                              }
                              "loadBalancer" = {
                                "description" = "Settings controlling the load balancer algorithms."
                                "oneOf" = [
                                  {
                                    "not" = {
                                      "anyOf" = [
                                        {
                                          "required" = [
                                            "simple",
                                          ]
                                        },
                                        {
                                          "required" = [
                                            "consistentHash",
                                          ]
                                        },
                                      ]
                                    }
                                  },
                                  {
                                    "required" = [
                                      "simple",
                                    ]
                                  },
                                  {
                                    "required" = [
                                      "consistentHash",
                                    ]
                                  },
                                ]
                                "properties" = {
                                  "consistentHash" = {
                                    "allOf" = [
                                      {
                                        "oneOf" = [
                                          {
                                            "not" = {
                                              "anyOf" = [
                                                {
                                                  "required" = [
                                                    "httpHeaderName",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "httpCookie",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "useSourceIp",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "httpQueryParameterName",
                                                  ]
                                                },
                                              ]
                                            }
                                          },
                                          {
                                            "required" = [
                                              "httpHeaderName",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "httpCookie",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "useSourceIp",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "httpQueryParameterName",
                                            ]
                                          },
                                        ]
                                      },
                                      {
                                        "oneOf" = [
                                          {
                                            "not" = {
                                              "anyOf" = [
                                                {
                                                  "required" = [
                                                    "ringHash",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "maglev",
                                                  ]
                                                },
                                              ]
                                            }
                                          },
                                          {
                                            "required" = [
                                              "ringHash",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "maglev",
                                            ]
                                          },
                                        ]
                                      },
                                    ]
                                    "properties" = {
                                      "httpCookie" = {
                                        "description" = "Hash based on HTTP cookie."
                                        "properties" = {
                                          "name" = {
                                            "description" = "Name of the cookie."
                                            "type" = "string"
                                          }
                                          "path" = {
                                            "description" = "Path to set for the cookie."
                                            "type" = "string"
                                          }
                                          "ttl" = {
                                            "description" = "Lifetime of the cookie."
                                            "type" = "string"
                                          }
                                        }
                                        "required" = [
                                          "name",
                                        ]
                                        "type" = "object"
                                      }
                                      "httpHeaderName" = {
                                        "description" = "Hash based on a specific HTTP header."
                                        "type" = "string"
                                      }
                                      "httpQueryParameterName" = {
                                        "description" = "Hash based on a specific HTTP query parameter."
                                        "type" = "string"
                                      }
                                      "maglev" = {
                                        "description" = "The Maglev load balancer implements consistent hashing to backend hosts."
                                        "properties" = {
                                          "tableSize" = {
                                            "description" = "The table size for Maglev hashing."
                                            "type" = "integer"
                                          }
                                        }
                                        "type" = "object"
                                      }
                                      "minimumRingSize" = {
                                        "description" = "Deprecated."
                                        "type" = "integer"
                                      }
                                      "ringHash" = {
                                        "description" = "The ring/modulo hash load balancer implements consistent hashing to backend hosts."
                                        "properties" = {
                                          "minimumRingSize" = {
                                            "description" = "The minimum number of virtual nodes to use for the hash ring."
                                            "type" = "integer"
                                          }
                                        }
                                        "type" = "object"
                                      }
                                      "useSourceIp" = {
                                        "description" = "Hash based on the source IP address."
                                        "type" = "boolean"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "localityLbSetting" = {
                                    "properties" = {
                                      "distribute" = {
                                        "description" = "Optional: only one of distribute, failover or failoverPriority can be set."
                                        "items" = {
                                          "properties" = {
                                            "from" = {
                                              "description" = "Originating locality, '/' separated, e.g."
                                              "type" = "string"
                                            }
                                            "to" = {
                                              "additionalProperties" = {
                                                "type" = "integer"
                                              }
                                              "description" = "Map of upstream localities to traffic distribution weights."
                                              "type" = "object"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "type" = "array"
                                      }
                                      "enabled" = {
                                        "description" = "enable locality load balancing, this is DestinationRule-level and will override mesh wide settings in entirety."
                                        "nullable" = true
                                        "type" = "boolean"
                                      }
                                      "failover" = {
                                        "description" = "Optional: only one of distribute, failover or failoverPriority can be set."
                                        "items" = {
                                          "properties" = {
                                            "from" = {
                                              "description" = "Originating region."
                                              "type" = "string"
                                            }
                                            "to" = {
                                              "description" = "Destination region the traffic will fail over to when endpoints in the 'from' region becomes unhealthy."
                                              "type" = "string"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "type" = "array"
                                      }
                                      "failoverPriority" = {
                                        "description" = "failoverPriority is an ordered list of labels used to sort endpoints to do priority based load balancing."
                                        "items" = {
                                          "type" = "string"
                                        }
                                        "type" = "array"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "simple" = {
                                    "enum" = [
                                      "UNSPECIFIED",
                                      "LEAST_CONN",
                                      "RANDOM",
                                      "PASSTHROUGH",
                                      "ROUND_ROBIN",
                                      "LEAST_REQUEST",
                                    ]
                                    "type" = "string"
                                  }
                                  "warmupDurationSecs" = {
                                    "description" = "Represents the warmup duration of Service."
                                    "type" = "string"
                                  }
                                }
                                "type" = "object"
                              }
                              "outlierDetection" = {
                                "properties" = {
                                  "baseEjectionTime" = {
                                    "description" = "Minimum ejection duration."
                                    "type" = "string"
                                  }
                                  "consecutive5xxErrors" = {
                                    "description" = "Number of 5xx errors before a host is ejected from the connection pool."
                                    "nullable" = true
                                    "type" = "integer"
                                  }
                                  "consecutiveErrors" = {
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "consecutiveGatewayErrors" = {
                                    "description" = "Number of gateway errors before a host is ejected from the connection pool."
                                    "nullable" = true
                                    "type" = "integer"
                                  }
                                  "consecutiveLocalOriginFailures" = {
                                    "description" = "The number of consecutive locally originated failures before ejection occurs."
                                    "nullable" = true
                                    "type" = "integer"
                                  }
                                  "interval" = {
                                    "description" = "Time interval between ejection sweep analysis."
                                    "type" = "string"
                                  }
                                  "maxEjectionPercent" = {
                                    "description" = "Maximum % of hosts in the load balancing pool for the upstream service that can be ejected."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "minHealthPercent" = {
                                    "description" = "Outlier detection will be enabled as long as the associated load balancing pool has at least min_health_percent hosts in healthy mode."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "splitExternalLocalOriginErrors" = {
                                    "description" = "Determines whether to distinguish local origin failures from external errors."
                                    "type" = "boolean"
                                  }
                                }
                                "type" = "object"
                              }
                              "portLevelSettings" = {
                                "description" = "Traffic policies specific to individual ports."
                                "items" = {
                                  "properties" = {
                                    "connectionPool" = {
                                      "properties" = {
                                        "http" = {
                                          "description" = "HTTP connection pool settings."
                                          "properties" = {
                                            "h2UpgradePolicy" = {
                                              "description" = "Specify if http1.1 connection should be upgraded to http2 for the associated destination."
                                              "enum" = [
                                                "DEFAULT",
                                                "DO_NOT_UPGRADE",
                                                "UPGRADE",
                                              ]
                                              "type" = "string"
                                            }
                                            "http1MaxPendingRequests" = {
                                              "description" = "Maximum number of requests that will be queued while waiting for a ready connection pool connection."
                                              "format" = "int32"
                                              "type" = "integer"
                                            }
                                            "http2MaxRequests" = {
                                              "description" = "Maximum number of active requests to a destination."
                                              "format" = "int32"
                                              "type" = "integer"
                                            }
                                            "idleTimeout" = {
                                              "description" = "The idle timeout for upstream connection pool connections."
                                              "type" = "string"
                                            }
                                            "maxRequestsPerConnection" = {
                                              "description" = "Maximum number of requests per connection to a backend."
                                              "format" = "int32"
                                              "type" = "integer"
                                            }
                                            "maxRetries" = {
                                              "description" = "Maximum number of retries that can be outstanding to all hosts in a cluster at a given time."
                                              "format" = "int32"
                                              "type" = "integer"
                                            }
                                            "useClientProtocol" = {
                                              "description" = "If set to true, client protocol will be preserved while initiating connection to backend."
                                              "type" = "boolean"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "tcp" = {
                                          "description" = "Settings common to both HTTP and TCP upstream connections."
                                          "properties" = {
                                            "connectTimeout" = {
                                              "description" = "TCP connection timeout."
                                              "type" = "string"
                                            }
                                            "maxConnectionDuration" = {
                                              "description" = "The maximum duration of a connection."
                                              "type" = "string"
                                            }
                                            "maxConnections" = {
                                              "description" = "Maximum number of HTTP1 /TCP connections to a destination host."
                                              "format" = "int32"
                                              "type" = "integer"
                                            }
                                            "tcpKeepalive" = {
                                              "description" = "If set then set SO_KEEPALIVE on the socket to enable TCP Keepalives."
                                              "properties" = {
                                                "interval" = {
                                                  "description" = "The time duration between keep-alive probes."
                                                  "type" = "string"
                                                }
                                                "probes" = {
                                                  "description" = "Maximum number of keepalive probes to send without response before deciding the connection is dead."
                                                  "type" = "integer"
                                                }
                                                "time" = {
                                                  "description" = "The time duration a connection needs to be idle before keep-alive probes start being sent."
                                                  "type" = "string"
                                                }
                                              }
                                              "type" = "object"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "loadBalancer" = {
                                      "description" = "Settings controlling the load balancer algorithms."
                                      "oneOf" = [
                                        {
                                          "not" = {
                                            "anyOf" = [
                                              {
                                                "required" = [
                                                  "simple",
                                                ]
                                              },
                                              {
                                                "required" = [
                                                  "consistentHash",
                                                ]
                                              },
                                            ]
                                          }
                                        },
                                        {
                                          "required" = [
                                            "simple",
                                          ]
                                        },
                                        {
                                          "required" = [
                                            "consistentHash",
                                          ]
                                        },
                                      ]
                                      "properties" = {
                                        "consistentHash" = {
                                          "allOf" = [
                                            {
                                              "oneOf" = [
                                                {
                                                  "not" = {
                                                    "anyOf" = [
                                                      {
                                                        "required" = [
                                                          "httpHeaderName",
                                                        ]
                                                      },
                                                      {
                                                        "required" = [
                                                          "httpCookie",
                                                        ]
                                                      },
                                                      {
                                                        "required" = [
                                                          "useSourceIp",
                                                        ]
                                                      },
                                                      {
                                                        "required" = [
                                                          "httpQueryParameterName",
                                                        ]
                                                      },
                                                    ]
                                                  }
                                                },
                                                {
                                                  "required" = [
                                                    "httpHeaderName",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "httpCookie",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "useSourceIp",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "httpQueryParameterName",
                                                  ]
                                                },
                                              ]
                                            },
                                            {
                                              "oneOf" = [
                                                {
                                                  "not" = {
                                                    "anyOf" = [
                                                      {
                                                        "required" = [
                                                          "ringHash",
                                                        ]
                                                      },
                                                      {
                                                        "required" = [
                                                          "maglev",
                                                        ]
                                                      },
                                                    ]
                                                  }
                                                },
                                                {
                                                  "required" = [
                                                    "ringHash",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "maglev",
                                                  ]
                                                },
                                              ]
                                            },
                                          ]
                                          "properties" = {
                                            "httpCookie" = {
                                              "description" = "Hash based on HTTP cookie."
                                              "properties" = {
                                                "name" = {
                                                  "description" = "Name of the cookie."
                                                  "type" = "string"
                                                }
                                                "path" = {
                                                  "description" = "Path to set for the cookie."
                                                  "type" = "string"
                                                }
                                                "ttl" = {
                                                  "description" = "Lifetime of the cookie."
                                                  "type" = "string"
                                                }
                                              }
                                              "required" = [
                                                "name",
                                              ]
                                              "type" = "object"
                                            }
                                            "httpHeaderName" = {
                                              "description" = "Hash based on a specific HTTP header."
                                              "type" = "string"
                                            }
                                            "httpQueryParameterName" = {
                                              "description" = "Hash based on a specific HTTP query parameter."
                                              "type" = "string"
                                            }
                                            "maglev" = {
                                              "description" = "The Maglev load balancer implements consistent hashing to backend hosts."
                                              "properties" = {
                                                "tableSize" = {
                                                  "description" = "The table size for Maglev hashing."
                                                  "type" = "integer"
                                                }
                                              }
                                              "type" = "object"
                                            }
                                            "minimumRingSize" = {
                                              "description" = "Deprecated."
                                              "type" = "integer"
                                            }
                                            "ringHash" = {
                                              "description" = "The ring/modulo hash load balancer implements consistent hashing to backend hosts."
                                              "properties" = {
                                                "minimumRingSize" = {
                                                  "description" = "The minimum number of virtual nodes to use for the hash ring."
                                                  "type" = "integer"
                                                }
                                              }
                                              "type" = "object"
                                            }
                                            "useSourceIp" = {
                                              "description" = "Hash based on the source IP address."
                                              "type" = "boolean"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "localityLbSetting" = {
                                          "properties" = {
                                            "distribute" = {
                                              "description" = "Optional: only one of distribute, failover or failoverPriority can be set."
                                              "items" = {
                                                "properties" = {
                                                  "from" = {
                                                    "description" = "Originating locality, '/' separated, e.g."
                                                    "type" = "string"
                                                  }
                                                  "to" = {
                                                    "additionalProperties" = {
                                                      "type" = "integer"
                                                    }
                                                    "description" = "Map of upstream localities to traffic distribution weights."
                                                    "type" = "object"
                                                  }
                                                }
                                                "type" = "object"
                                              }
                                              "type" = "array"
                                            }
                                            "enabled" = {
                                              "description" = "enable locality load balancing, this is DestinationRule-level and will override mesh wide settings in entirety."
                                              "nullable" = true
                                              "type" = "boolean"
                                            }
                                            "failover" = {
                                              "description" = "Optional: only one of distribute, failover or failoverPriority can be set."
                                              "items" = {
                                                "properties" = {
                                                  "from" = {
                                                    "description" = "Originating region."
                                                    "type" = "string"
                                                  }
                                                  "to" = {
                                                    "description" = "Destination region the traffic will fail over to when endpoints in the 'from' region becomes unhealthy."
                                                    "type" = "string"
                                                  }
                                                }
                                                "type" = "object"
                                              }
                                              "type" = "array"
                                            }
                                            "failoverPriority" = {
                                              "description" = "failoverPriority is an ordered list of labels used to sort endpoints to do priority based load balancing."
                                              "items" = {
                                                "type" = "string"
                                              }
                                              "type" = "array"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "simple" = {
                                          "enum" = [
                                            "UNSPECIFIED",
                                            "LEAST_CONN",
                                            "RANDOM",
                                            "PASSTHROUGH",
                                            "ROUND_ROBIN",
                                            "LEAST_REQUEST",
                                          ]
                                          "type" = "string"
                                        }
                                        "warmupDurationSecs" = {
                                          "description" = "Represents the warmup duration of Service."
                                          "type" = "string"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "outlierDetection" = {
                                      "properties" = {
                                        "baseEjectionTime" = {
                                          "description" = "Minimum ejection duration."
                                          "type" = "string"
                                        }
                                        "consecutive5xxErrors" = {
                                          "description" = "Number of 5xx errors before a host is ejected from the connection pool."
                                          "nullable" = true
                                          "type" = "integer"
                                        }
                                        "consecutiveErrors" = {
                                          "format" = "int32"
                                          "type" = "integer"
                                        }
                                        "consecutiveGatewayErrors" = {
                                          "description" = "Number of gateway errors before a host is ejected from the connection pool."
                                          "nullable" = true
                                          "type" = "integer"
                                        }
                                        "consecutiveLocalOriginFailures" = {
                                          "description" = "The number of consecutive locally originated failures before ejection occurs."
                                          "nullable" = true
                                          "type" = "integer"
                                        }
                                        "interval" = {
                                          "description" = "Time interval between ejection sweep analysis."
                                          "type" = "string"
                                        }
                                        "maxEjectionPercent" = {
                                          "description" = "Maximum % of hosts in the load balancing pool for the upstream service that can be ejected."
                                          "format" = "int32"
                                          "type" = "integer"
                                        }
                                        "minHealthPercent" = {
                                          "description" = "Outlier detection will be enabled as long as the associated load balancing pool has at least min_health_percent hosts in healthy mode."
                                          "format" = "int32"
                                          "type" = "integer"
                                        }
                                        "splitExternalLocalOriginErrors" = {
                                          "description" = "Determines whether to distinguish local origin failures from external errors."
                                          "type" = "boolean"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "port" = {
                                      "description" = "Specifies the number of a port on the destination service on which this policy is being applied."
                                      "properties" = {
                                        "number" = {
                                          "type" = "integer"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "tls" = {
                                      "description" = "TLS related settings for connections to the upstream service."
                                      "properties" = {
                                        "caCertificates" = {
                                          "description" = "OPTIONAL: The path to the file containing certificate authority certificates to use in verifying a presented server certificate."
                                          "type" = "string"
                                        }
                                        "clientCertificate" = {
                                          "description" = "REQUIRED if mode is `MUTUAL`."
                                          "type" = "string"
                                        }
                                        "credentialName" = {
                                          "description" = "The name of the secret that holds the TLS certs for the client including the CA certificates."
                                          "type" = "string"
                                        }
                                        "insecureSkipVerify" = {
                                          "description" = "`insecureSkipVerify` specifies whether the proxy should skip verifying the CA signature and SAN for the server certificate corresponding to the host."
                                          "nullable" = true
                                          "type" = "boolean"
                                        }
                                        "mode" = {
                                          "description" = "Indicates whether connections to this port should be secured using TLS."
                                          "enum" = [
                                            "DISABLE",
                                            "SIMPLE",
                                            "MUTUAL",
                                            "ISTIO_MUTUAL",
                                          ]
                                          "type" = "string"
                                        }
                                        "privateKey" = {
                                          "description" = "REQUIRED if mode is `MUTUAL`."
                                          "type" = "string"
                                        }
                                        "sni" = {
                                          "description" = "SNI string to present to the server during TLS handshake."
                                          "type" = "string"
                                        }
                                        "subjectAltNames" = {
                                          "description" = "A list of alternate names to verify the subject identity in the certificate."
                                          "items" = {
                                            "type" = "string"
                                          }
                                          "type" = "array"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "type" = "array"
                              }
                              "tls" = {
                                "description" = "TLS related settings for connections to the upstream service."
                                "properties" = {
                                  "caCertificates" = {
                                    "description" = "OPTIONAL: The path to the file containing certificate authority certificates to use in verifying a presented server certificate."
                                    "type" = "string"
                                  }
                                  "clientCertificate" = {
                                    "description" = "REQUIRED if mode is `MUTUAL`."
                                    "type" = "string"
                                  }
                                  "credentialName" = {
                                    "description" = "The name of the secret that holds the TLS certs for the client including the CA certificates."
                                    "type" = "string"
                                  }
                                  "insecureSkipVerify" = {
                                    "description" = "`insecureSkipVerify` specifies whether the proxy should skip verifying the CA signature and SAN for the server certificate corresponding to the host."
                                    "nullable" = true
                                    "type" = "boolean"
                                  }
                                  "mode" = {
                                    "description" = "Indicates whether connections to this port should be secured using TLS."
                                    "enum" = [
                                      "DISABLE",
                                      "SIMPLE",
                                      "MUTUAL",
                                      "ISTIO_MUTUAL",
                                    ]
                                    "type" = "string"
                                  }
                                  "privateKey" = {
                                    "description" = "REQUIRED if mode is `MUTUAL`."
                                    "type" = "string"
                                  }
                                  "sni" = {
                                    "description" = "SNI string to present to the server during TLS handshake."
                                    "type" = "string"
                                  }
                                  "subjectAltNames" = {
                                    "description" = "A list of alternate names to verify the subject identity in the certificate."
                                    "items" = {
                                      "type" = "string"
                                    }
                                    "type" = "array"
                                  }
                                }
                                "type" = "object"
                              }
                              "tunnel" = {
                                "description" = "Configuration of tunneling TCP over other transport or application layers for the host configured in the DestinationRule."
                                "properties" = {
                                  "protocol" = {
                                    "description" = "Specifies which protocol to use for tunneling the downstream connection."
                                    "type" = "string"
                                  }
                                  "targetHost" = {
                                    "description" = "Specifies a host to which the downstream connection is tunneled."
                                    "type" = "string"
                                  }
                                  "targetPort" = {
                                    "description" = "Specifies a port to which the downstream connection is tunneled."
                                    "type" = "integer"
                                  }
                                }
                                "required" = [
                                  "targetHost",
                                  "targetPort",
                                ]
                                "type" = "object"
                              }
                            }
                            "type" = "object"
                          }
                        }
                        "required" = [
                          "name",
                        ]
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "trafficPolicy" = {
                      "description" = "Traffic policies to apply (load balancing policy, connection pool sizes, outlier detection)."
                      "properties" = {
                        "connectionPool" = {
                          "properties" = {
                            "http" = {
                              "description" = "HTTP connection pool settings."
                              "properties" = {
                                "h2UpgradePolicy" = {
                                  "description" = "Specify if http1.1 connection should be upgraded to http2 for the associated destination."
                                  "enum" = [
                                    "DEFAULT",
                                    "DO_NOT_UPGRADE",
                                    "UPGRADE",
                                  ]
                                  "type" = "string"
                                }
                                "http1MaxPendingRequests" = {
                                  "description" = "Maximum number of requests that will be queued while waiting for a ready connection pool connection."
                                  "format" = "int32"
                                  "type" = "integer"
                                }
                                "http2MaxRequests" = {
                                  "description" = "Maximum number of active requests to a destination."
                                  "format" = "int32"
                                  "type" = "integer"
                                }
                                "idleTimeout" = {
                                  "description" = "The idle timeout for upstream connection pool connections."
                                  "type" = "string"
                                }
                                "maxRequestsPerConnection" = {
                                  "description" = "Maximum number of requests per connection to a backend."
                                  "format" = "int32"
                                  "type" = "integer"
                                }
                                "maxRetries" = {
                                  "description" = "Maximum number of retries that can be outstanding to all hosts in a cluster at a given time."
                                  "format" = "int32"
                                  "type" = "integer"
                                }
                                "useClientProtocol" = {
                                  "description" = "If set to true, client protocol will be preserved while initiating connection to backend."
                                  "type" = "boolean"
                                }
                              }
                              "type" = "object"
                            }
                            "tcp" = {
                              "description" = "Settings common to both HTTP and TCP upstream connections."
                              "properties" = {
                                "connectTimeout" = {
                                  "description" = "TCP connection timeout."
                                  "type" = "string"
                                }
                                "maxConnectionDuration" = {
                                  "description" = "The maximum duration of a connection."
                                  "type" = "string"
                                }
                                "maxConnections" = {
                                  "description" = "Maximum number of HTTP1 /TCP connections to a destination host."
                                  "format" = "int32"
                                  "type" = "integer"
                                }
                                "tcpKeepalive" = {
                                  "description" = "If set then set SO_KEEPALIVE on the socket to enable TCP Keepalives."
                                  "properties" = {
                                    "interval" = {
                                      "description" = "The time duration between keep-alive probes."
                                      "type" = "string"
                                    }
                                    "probes" = {
                                      "description" = "Maximum number of keepalive probes to send without response before deciding the connection is dead."
                                      "type" = "integer"
                                    }
                                    "time" = {
                                      "description" = "The time duration a connection needs to be idle before keep-alive probes start being sent."
                                      "type" = "string"
                                    }
                                  }
                                  "type" = "object"
                                }
                              }
                              "type" = "object"
                            }
                          }
                          "type" = "object"
                        }
                        "loadBalancer" = {
                          "description" = "Settings controlling the load balancer algorithms."
                          "oneOf" = [
                            {
                              "not" = {
                                "anyOf" = [
                                  {
                                    "required" = [
                                      "simple",
                                    ]
                                  },
                                  {
                                    "required" = [
                                      "consistentHash",
                                    ]
                                  },
                                ]
                              }
                            },
                            {
                              "required" = [
                                "simple",
                              ]
                            },
                            {
                              "required" = [
                                "consistentHash",
                              ]
                            },
                          ]
                          "properties" = {
                            "consistentHash" = {
                              "allOf" = [
                                {
                                  "oneOf" = [
                                    {
                                      "not" = {
                                        "anyOf" = [
                                          {
                                            "required" = [
                                              "httpHeaderName",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "httpCookie",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "useSourceIp",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "httpQueryParameterName",
                                            ]
                                          },
                                        ]
                                      }
                                    },
                                    {
                                      "required" = [
                                        "httpHeaderName",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "httpCookie",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "useSourceIp",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "httpQueryParameterName",
                                      ]
                                    },
                                  ]
                                },
                                {
                                  "oneOf" = [
                                    {
                                      "not" = {
                                        "anyOf" = [
                                          {
                                            "required" = [
                                              "ringHash",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "maglev",
                                            ]
                                          },
                                        ]
                                      }
                                    },
                                    {
                                      "required" = [
                                        "ringHash",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "maglev",
                                      ]
                                    },
                                  ]
                                },
                              ]
                              "properties" = {
                                "httpCookie" = {
                                  "description" = "Hash based on HTTP cookie."
                                  "properties" = {
                                    "name" = {
                                      "description" = "Name of the cookie."
                                      "type" = "string"
                                    }
                                    "path" = {
                                      "description" = "Path to set for the cookie."
                                      "type" = "string"
                                    }
                                    "ttl" = {
                                      "description" = "Lifetime of the cookie."
                                      "type" = "string"
                                    }
                                  }
                                  "required" = [
                                    "name",
                                  ]
                                  "type" = "object"
                                }
                                "httpHeaderName" = {
                                  "description" = "Hash based on a specific HTTP header."
                                  "type" = "string"
                                }
                                "httpQueryParameterName" = {
                                  "description" = "Hash based on a specific HTTP query parameter."
                                  "type" = "string"
                                }
                                "maglev" = {
                                  "description" = "The Maglev load balancer implements consistent hashing to backend hosts."
                                  "properties" = {
                                    "tableSize" = {
                                      "description" = "The table size for Maglev hashing."
                                      "type" = "integer"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "minimumRingSize" = {
                                  "description" = "Deprecated."
                                  "type" = "integer"
                                }
                                "ringHash" = {
                                  "description" = "The ring/modulo hash load balancer implements consistent hashing to backend hosts."
                                  "properties" = {
                                    "minimumRingSize" = {
                                      "description" = "The minimum number of virtual nodes to use for the hash ring."
                                      "type" = "integer"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "useSourceIp" = {
                                  "description" = "Hash based on the source IP address."
                                  "type" = "boolean"
                                }
                              }
                              "type" = "object"
                            }
                            "localityLbSetting" = {
                              "properties" = {
                                "distribute" = {
                                  "description" = "Optional: only one of distribute, failover or failoverPriority can be set."
                                  "items" = {
                                    "properties" = {
                                      "from" = {
                                        "description" = "Originating locality, '/' separated, e.g."
                                        "type" = "string"
                                      }
                                      "to" = {
                                        "additionalProperties" = {
                                          "type" = "integer"
                                        }
                                        "description" = "Map of upstream localities to traffic distribution weights."
                                        "type" = "object"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "type" = "array"
                                }
                                "enabled" = {
                                  "description" = "enable locality load balancing, this is DestinationRule-level and will override mesh wide settings in entirety."
                                  "nullable" = true
                                  "type" = "boolean"
                                }
                                "failover" = {
                                  "description" = "Optional: only one of distribute, failover or failoverPriority can be set."
                                  "items" = {
                                    "properties" = {
                                      "from" = {
                                        "description" = "Originating region."
                                        "type" = "string"
                                      }
                                      "to" = {
                                        "description" = "Destination region the traffic will fail over to when endpoints in the 'from' region becomes unhealthy."
                                        "type" = "string"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "type" = "array"
                                }
                                "failoverPriority" = {
                                  "description" = "failoverPriority is an ordered list of labels used to sort endpoints to do priority based load balancing."
                                  "items" = {
                                    "type" = "string"
                                  }
                                  "type" = "array"
                                }
                              }
                              "type" = "object"
                            }
                            "simple" = {
                              "enum" = [
                                "UNSPECIFIED",
                                "LEAST_CONN",
                                "RANDOM",
                                "PASSTHROUGH",
                                "ROUND_ROBIN",
                                "LEAST_REQUEST",
                              ]
                              "type" = "string"
                            }
                            "warmupDurationSecs" = {
                              "description" = "Represents the warmup duration of Service."
                              "type" = "string"
                            }
                          }
                          "type" = "object"
                        }
                        "outlierDetection" = {
                          "properties" = {
                            "baseEjectionTime" = {
                              "description" = "Minimum ejection duration."
                              "type" = "string"
                            }
                            "consecutive5xxErrors" = {
                              "description" = "Number of 5xx errors before a host is ejected from the connection pool."
                              "nullable" = true
                              "type" = "integer"
                            }
                            "consecutiveErrors" = {
                              "format" = "int32"
                              "type" = "integer"
                            }
                            "consecutiveGatewayErrors" = {
                              "description" = "Number of gateway errors before a host is ejected from the connection pool."
                              "nullable" = true
                              "type" = "integer"
                            }
                            "consecutiveLocalOriginFailures" = {
                              "description" = "The number of consecutive locally originated failures before ejection occurs."
                              "nullable" = true
                              "type" = "integer"
                            }
                            "interval" = {
                              "description" = "Time interval between ejection sweep analysis."
                              "type" = "string"
                            }
                            "maxEjectionPercent" = {
                              "description" = "Maximum % of hosts in the load balancing pool for the upstream service that can be ejected."
                              "format" = "int32"
                              "type" = "integer"
                            }
                            "minHealthPercent" = {
                              "description" = "Outlier detection will be enabled as long as the associated load balancing pool has at least min_health_percent hosts in healthy mode."
                              "format" = "int32"
                              "type" = "integer"
                            }
                            "splitExternalLocalOriginErrors" = {
                              "description" = "Determines whether to distinguish local origin failures from external errors."
                              "type" = "boolean"
                            }
                          }
                          "type" = "object"
                        }
                        "portLevelSettings" = {
                          "description" = "Traffic policies specific to individual ports."
                          "items" = {
                            "properties" = {
                              "connectionPool" = {
                                "properties" = {
                                  "http" = {
                                    "description" = "HTTP connection pool settings."
                                    "properties" = {
                                      "h2UpgradePolicy" = {
                                        "description" = "Specify if http1.1 connection should be upgraded to http2 for the associated destination."
                                        "enum" = [
                                          "DEFAULT",
                                          "DO_NOT_UPGRADE",
                                          "UPGRADE",
                                        ]
                                        "type" = "string"
                                      }
                                      "http1MaxPendingRequests" = {
                                        "description" = "Maximum number of requests that will be queued while waiting for a ready connection pool connection."
                                        "format" = "int32"
                                        "type" = "integer"
                                      }
                                      "http2MaxRequests" = {
                                        "description" = "Maximum number of active requests to a destination."
                                        "format" = "int32"
                                        "type" = "integer"
                                      }
                                      "idleTimeout" = {
                                        "description" = "The idle timeout for upstream connection pool connections."
                                        "type" = "string"
                                      }
                                      "maxRequestsPerConnection" = {
                                        "description" = "Maximum number of requests per connection to a backend."
                                        "format" = "int32"
                                        "type" = "integer"
                                      }
                                      "maxRetries" = {
                                        "description" = "Maximum number of retries that can be outstanding to all hosts in a cluster at a given time."
                                        "format" = "int32"
                                        "type" = "integer"
                                      }
                                      "useClientProtocol" = {
                                        "description" = "If set to true, client protocol will be preserved while initiating connection to backend."
                                        "type" = "boolean"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "tcp" = {
                                    "description" = "Settings common to both HTTP and TCP upstream connections."
                                    "properties" = {
                                      "connectTimeout" = {
                                        "description" = "TCP connection timeout."
                                        "type" = "string"
                                      }
                                      "maxConnectionDuration" = {
                                        "description" = "The maximum duration of a connection."
                                        "type" = "string"
                                      }
                                      "maxConnections" = {
                                        "description" = "Maximum number of HTTP1 /TCP connections to a destination host."
                                        "format" = "int32"
                                        "type" = "integer"
                                      }
                                      "tcpKeepalive" = {
                                        "description" = "If set then set SO_KEEPALIVE on the socket to enable TCP Keepalives."
                                        "properties" = {
                                          "interval" = {
                                            "description" = "The time duration between keep-alive probes."
                                            "type" = "string"
                                          }
                                          "probes" = {
                                            "description" = "Maximum number of keepalive probes to send without response before deciding the connection is dead."
                                            "type" = "integer"
                                          }
                                          "time" = {
                                            "description" = "The time duration a connection needs to be idle before keep-alive probes start being sent."
                                            "type" = "string"
                                          }
                                        }
                                        "type" = "object"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                }
                                "type" = "object"
                              }
                              "loadBalancer" = {
                                "description" = "Settings controlling the load balancer algorithms."
                                "oneOf" = [
                                  {
                                    "not" = {
                                      "anyOf" = [
                                        {
                                          "required" = [
                                            "simple",
                                          ]
                                        },
                                        {
                                          "required" = [
                                            "consistentHash",
                                          ]
                                        },
                                      ]
                                    }
                                  },
                                  {
                                    "required" = [
                                      "simple",
                                    ]
                                  },
                                  {
                                    "required" = [
                                      "consistentHash",
                                    ]
                                  },
                                ]
                                "properties" = {
                                  "consistentHash" = {
                                    "allOf" = [
                                      {
                                        "oneOf" = [
                                          {
                                            "not" = {
                                              "anyOf" = [
                                                {
                                                  "required" = [
                                                    "httpHeaderName",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "httpCookie",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "useSourceIp",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "httpQueryParameterName",
                                                  ]
                                                },
                                              ]
                                            }
                                          },
                                          {
                                            "required" = [
                                              "httpHeaderName",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "httpCookie",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "useSourceIp",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "httpQueryParameterName",
                                            ]
                                          },
                                        ]
                                      },
                                      {
                                        "oneOf" = [
                                          {
                                            "not" = {
                                              "anyOf" = [
                                                {
                                                  "required" = [
                                                    "ringHash",
                                                  ]
                                                },
                                                {
                                                  "required" = [
                                                    "maglev",
                                                  ]
                                                },
                                              ]
                                            }
                                          },
                                          {
                                            "required" = [
                                              "ringHash",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "maglev",
                                            ]
                                          },
                                        ]
                                      },
                                    ]
                                    "properties" = {
                                      "httpCookie" = {
                                        "description" = "Hash based on HTTP cookie."
                                        "properties" = {
                                          "name" = {
                                            "description" = "Name of the cookie."
                                            "type" = "string"
                                          }
                                          "path" = {
                                            "description" = "Path to set for the cookie."
                                            "type" = "string"
                                          }
                                          "ttl" = {
                                            "description" = "Lifetime of the cookie."
                                            "type" = "string"
                                          }
                                        }
                                        "required" = [
                                          "name",
                                        ]
                                        "type" = "object"
                                      }
                                      "httpHeaderName" = {
                                        "description" = "Hash based on a specific HTTP header."
                                        "type" = "string"
                                      }
                                      "httpQueryParameterName" = {
                                        "description" = "Hash based on a specific HTTP query parameter."
                                        "type" = "string"
                                      }
                                      "maglev" = {
                                        "description" = "The Maglev load balancer implements consistent hashing to backend hosts."
                                        "properties" = {
                                          "tableSize" = {
                                            "description" = "The table size for Maglev hashing."
                                            "type" = "integer"
                                          }
                                        }
                                        "type" = "object"
                                      }
                                      "minimumRingSize" = {
                                        "description" = "Deprecated."
                                        "type" = "integer"
                                      }
                                      "ringHash" = {
                                        "description" = "The ring/modulo hash load balancer implements consistent hashing to backend hosts."
                                        "properties" = {
                                          "minimumRingSize" = {
                                            "description" = "The minimum number of virtual nodes to use for the hash ring."
                                            "type" = "integer"
                                          }
                                        }
                                        "type" = "object"
                                      }
                                      "useSourceIp" = {
                                        "description" = "Hash based on the source IP address."
                                        "type" = "boolean"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "localityLbSetting" = {
                                    "properties" = {
                                      "distribute" = {
                                        "description" = "Optional: only one of distribute, failover or failoverPriority can be set."
                                        "items" = {
                                          "properties" = {
                                            "from" = {
                                              "description" = "Originating locality, '/' separated, e.g."
                                              "type" = "string"
                                            }
                                            "to" = {
                                              "additionalProperties" = {
                                                "type" = "integer"
                                              }
                                              "description" = "Map of upstream localities to traffic distribution weights."
                                              "type" = "object"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "type" = "array"
                                      }
                                      "enabled" = {
                                        "description" = "enable locality load balancing, this is DestinationRule-level and will override mesh wide settings in entirety."
                                        "nullable" = true
                                        "type" = "boolean"
                                      }
                                      "failover" = {
                                        "description" = "Optional: only one of distribute, failover or failoverPriority can be set."
                                        "items" = {
                                          "properties" = {
                                            "from" = {
                                              "description" = "Originating region."
                                              "type" = "string"
                                            }
                                            "to" = {
                                              "description" = "Destination region the traffic will fail over to when endpoints in the 'from' region becomes unhealthy."
                                              "type" = "string"
                                            }
                                          }
                                          "type" = "object"
                                        }
                                        "type" = "array"
                                      }
                                      "failoverPriority" = {
                                        "description" = "failoverPriority is an ordered list of labels used to sort endpoints to do priority based load balancing."
                                        "items" = {
                                          "type" = "string"
                                        }
                                        "type" = "array"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "simple" = {
                                    "enum" = [
                                      "UNSPECIFIED",
                                      "LEAST_CONN",
                                      "RANDOM",
                                      "PASSTHROUGH",
                                      "ROUND_ROBIN",
                                      "LEAST_REQUEST",
                                    ]
                                    "type" = "string"
                                  }
                                  "warmupDurationSecs" = {
                                    "description" = "Represents the warmup duration of Service."
                                    "type" = "string"
                                  }
                                }
                                "type" = "object"
                              }
                              "outlierDetection" = {
                                "properties" = {
                                  "baseEjectionTime" = {
                                    "description" = "Minimum ejection duration."
                                    "type" = "string"
                                  }
                                  "consecutive5xxErrors" = {
                                    "description" = "Number of 5xx errors before a host is ejected from the connection pool."
                                    "nullable" = true
                                    "type" = "integer"
                                  }
                                  "consecutiveErrors" = {
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "consecutiveGatewayErrors" = {
                                    "description" = "Number of gateway errors before a host is ejected from the connection pool."
                                    "nullable" = true
                                    "type" = "integer"
                                  }
                                  "consecutiveLocalOriginFailures" = {
                                    "description" = "The number of consecutive locally originated failures before ejection occurs."
                                    "nullable" = true
                                    "type" = "integer"
                                  }
                                  "interval" = {
                                    "description" = "Time interval between ejection sweep analysis."
                                    "type" = "string"
                                  }
                                  "maxEjectionPercent" = {
                                    "description" = "Maximum % of hosts in the load balancing pool for the upstream service that can be ejected."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "minHealthPercent" = {
                                    "description" = "Outlier detection will be enabled as long as the associated load balancing pool has at least min_health_percent hosts in healthy mode."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "splitExternalLocalOriginErrors" = {
                                    "description" = "Determines whether to distinguish local origin failures from external errors."
                                    "type" = "boolean"
                                  }
                                }
                                "type" = "object"
                              }
                              "port" = {
                                "description" = "Specifies the number of a port on the destination service on which this policy is being applied."
                                "properties" = {
                                  "number" = {
                                    "type" = "integer"
                                  }
                                }
                                "type" = "object"
                              }
                              "tls" = {
                                "description" = "TLS related settings for connections to the upstream service."
                                "properties" = {
                                  "caCertificates" = {
                                    "description" = "OPTIONAL: The path to the file containing certificate authority certificates to use in verifying a presented server certificate."
                                    "type" = "string"
                                  }
                                  "clientCertificate" = {
                                    "description" = "REQUIRED if mode is `MUTUAL`."
                                    "type" = "string"
                                  }
                                  "credentialName" = {
                                    "description" = "The name of the secret that holds the TLS certs for the client including the CA certificates."
                                    "type" = "string"
                                  }
                                  "insecureSkipVerify" = {
                                    "description" = "`insecureSkipVerify` specifies whether the proxy should skip verifying the CA signature and SAN for the server certificate corresponding to the host."
                                    "nullable" = true
                                    "type" = "boolean"
                                  }
                                  "mode" = {
                                    "description" = "Indicates whether connections to this port should be secured using TLS."
                                    "enum" = [
                                      "DISABLE",
                                      "SIMPLE",
                                      "MUTUAL",
                                      "ISTIO_MUTUAL",
                                    ]
                                    "type" = "string"
                                  }
                                  "privateKey" = {
                                    "description" = "REQUIRED if mode is `MUTUAL`."
                                    "type" = "string"
                                  }
                                  "sni" = {
                                    "description" = "SNI string to present to the server during TLS handshake."
                                    "type" = "string"
                                  }
                                  "subjectAltNames" = {
                                    "description" = "A list of alternate names to verify the subject identity in the certificate."
                                    "items" = {
                                      "type" = "string"
                                    }
                                    "type" = "array"
                                  }
                                }
                                "type" = "object"
                              }
                            }
                            "type" = "object"
                          }
                          "type" = "array"
                        }
                        "tls" = {
                          "description" = "TLS related settings for connections to the upstream service."
                          "properties" = {
                            "caCertificates" = {
                              "description" = "OPTIONAL: The path to the file containing certificate authority certificates to use in verifying a presented server certificate."
                              "type" = "string"
                            }
                            "clientCertificate" = {
                              "description" = "REQUIRED if mode is `MUTUAL`."
                              "type" = "string"
                            }
                            "credentialName" = {
                              "description" = "The name of the secret that holds the TLS certs for the client including the CA certificates."
                              "type" = "string"
                            }
                            "insecureSkipVerify" = {
                              "description" = "`insecureSkipVerify` specifies whether the proxy should skip verifying the CA signature and SAN for the server certificate corresponding to the host."
                              "nullable" = true
                              "type" = "boolean"
                            }
                            "mode" = {
                              "description" = "Indicates whether connections to this port should be secured using TLS."
                              "enum" = [
                                "DISABLE",
                                "SIMPLE",
                                "MUTUAL",
                                "ISTIO_MUTUAL",
                              ]
                              "type" = "string"
                            }
                            "privateKey" = {
                              "description" = "REQUIRED if mode is `MUTUAL`."
                              "type" = "string"
                            }
                            "sni" = {
                              "description" = "SNI string to present to the server during TLS handshake."
                              "type" = "string"
                            }
                            "subjectAltNames" = {
                              "description" = "A list of alternate names to verify the subject identity in the certificate."
                              "items" = {
                                "type" = "string"
                              }
                              "type" = "array"
                            }
                          }
                          "type" = "object"
                        }
                        "tunnel" = {
                          "description" = "Configuration of tunneling TCP over other transport or application layers for the host configured in the DestinationRule."
                          "properties" = {
                            "protocol" = {
                              "description" = "Specifies which protocol to use for tunneling the downstream connection."
                              "type" = "string"
                            }
                            "targetHost" = {
                              "description" = "Specifies a host to which the downstream connection is tunneled."
                              "type" = "string"
                            }
                            "targetPort" = {
                              "description" = "Specifies a port to which the downstream connection is tunneled."
                              "type" = "integer"
                            }
                          }
                          "required" = [
                            "targetHost",
                            "targetPort",
                          ]
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                    "workloadSelector" = {
                      "description" = "Criteria used to select the specific set of pods/VMs on which this `DestinationRule` configuration should be applied."
                      "properties" = {
                        "matchLabels" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "description" = "One or more labels that indicate a specific set of pods/VMs on which a policy should be applied."
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                  }
                  "required" = [
                    "host",
                  ]
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = false
          "subresources" = {
            "status" = {}
          }
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "customresourcedefinition_envoyfilters_networking_istio_io" {
  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "annotations" = {
        "helm.sh/resource-policy" = "keep"
      }
      "labels" = {
        "app" = "istio-pilot"
        "chart" = "istio"
        "heritage" = "Tiller"
        "release" = "istio"
      }
      "name" = "envoyfilters.networking.istio.io"
    }
    "spec" = {
      "group" = "networking.istio.io"
      "names" = {
        "categories" = [
          "istio-io",
          "networking-istio-io",
        ]
        "kind" = "EnvoyFilter"
        "listKind" = "EnvoyFilterList"
        "plural" = "envoyfilters"
        "singular" = "envoyfilter"
      }
      "scope" = "Namespaced"
      "versions" = [
        {
          "name" = "v1alpha3"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Customizing Envoy configuration generated by Istio. See more details at: https://istio.io/docs/reference/config/networking/envoy-filter.html"
                  "properties" = {
                    "configPatches" = {
                      "description" = "One or more patches with match conditions."
                      "items" = {
                        "properties" = {
                          "applyTo" = {
                            "description" = "Specifies where in the Envoy configuration, the patch should be applied."
                            "enum" = [
                              "INVALID",
                              "LISTENER",
                              "FILTER_CHAIN",
                              "NETWORK_FILTER",
                              "HTTP_FILTER",
                              "ROUTE_CONFIGURATION",
                              "VIRTUAL_HOST",
                              "HTTP_ROUTE",
                              "CLUSTER",
                              "EXTENSION_CONFIG",
                              "BOOTSTRAP",
                              "LISTENER_FILTER",
                            ]
                            "type" = "string"
                          }
                          "match" = {
                            "description" = "Match on listener/route configuration/cluster."
                            "oneOf" = [
                              {
                                "not" = {
                                  "anyOf" = [
                                    {
                                      "required" = [
                                        "listener",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "routeConfiguration",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "cluster",
                                      ]
                                    },
                                  ]
                                }
                              },
                              {
                                "required" = [
                                  "listener",
                                ]
                              },
                              {
                                "required" = [
                                  "routeConfiguration",
                                ]
                              },
                              {
                                "required" = [
                                  "cluster",
                                ]
                              },
                            ]
                            "properties" = {
                              "cluster" = {
                                "description" = "Match on envoy cluster attributes."
                                "properties" = {
                                  "name" = {
                                    "description" = "The exact name of the cluster to match."
                                    "type" = "string"
                                  }
                                  "portNumber" = {
                                    "description" = "The service port for which this cluster was generated."
                                    "type" = "integer"
                                  }
                                  "service" = {
                                    "description" = "The fully qualified service name for this cluster."
                                    "type" = "string"
                                  }
                                  "subset" = {
                                    "description" = "The subset associated with the service."
                                    "type" = "string"
                                  }
                                }
                                "type" = "object"
                              }
                              "context" = {
                                "description" = "The specific config generation context to match on."
                                "enum" = [
                                  "ANY",
                                  "SIDECAR_INBOUND",
                                  "SIDECAR_OUTBOUND",
                                  "GATEWAY",
                                ]
                                "type" = "string"
                              }
                              "listener" = {
                                "description" = "Match on envoy listener attributes."
                                "properties" = {
                                  "filterChain" = {
                                    "description" = "Match a specific filter chain in a listener."
                                    "properties" = {
                                      "applicationProtocols" = {
                                        "description" = "Applies only to sidecars."
                                        "type" = "string"
                                      }
                                      "destinationPort" = {
                                        "description" = "The destination_port value used by a filter chain's match condition."
                                        "type" = "integer"
                                      }
                                      "filter" = {
                                        "description" = "The name of a specific filter to apply the patch to."
                                        "properties" = {
                                          "name" = {
                                            "description" = "The filter name to match on."
                                            "type" = "string"
                                          }
                                          "subFilter" = {
                                            "description" = "The next level filter within this filter to match upon."
                                            "properties" = {
                                              "name" = {
                                                "description" = "The filter name to match on."
                                                "type" = "string"
                                              }
                                            }
                                            "type" = "object"
                                          }
                                        }
                                        "type" = "object"
                                      }
                                      "name" = {
                                        "description" = "The name assigned to the filter chain."
                                        "type" = "string"
                                      }
                                      "sni" = {
                                        "description" = "The SNI value used by a filter chain's match condition."
                                        "type" = "string"
                                      }
                                      "transportProtocol" = {
                                        "description" = "Applies only to `SIDECAR_INBOUND` context."
                                        "type" = "string"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "listenerFilter" = {
                                    "description" = "Match a specific listener filter."
                                    "type" = "string"
                                  }
                                  "name" = {
                                    "description" = "Match a specific listener by its name."
                                    "type" = "string"
                                  }
                                  "portName" = {
                                    "type" = "string"
                                  }
                                  "portNumber" = {
                                    "description" = "The service port/gateway port to which traffic is being sent/received."
                                    "type" = "integer"
                                  }
                                }
                                "type" = "object"
                              }
                              "proxy" = {
                                "description" = "Match on properties associated with a proxy."
                                "properties" = {
                                  "metadata" = {
                                    "additionalProperties" = {
                                      "type" = "string"
                                    }
                                    "description" = "Match on the node metadata supplied by a proxy when connecting to Istio Pilot."
                                    "type" = "object"
                                  }
                                  "proxyVersion" = {
                                    "description" = "A regular expression in golang regex format (RE2) that can be used to select proxies using a specific version of istio proxy."
                                    "type" = "string"
                                  }
                                }
                                "type" = "object"
                              }
                              "routeConfiguration" = {
                                "description" = "Match on envoy HTTP route configuration attributes."
                                "properties" = {
                                  "gateway" = {
                                    "description" = "The Istio gateway config's namespace/name for which this route configuration was generated."
                                    "type" = "string"
                                  }
                                  "name" = {
                                    "description" = "Route configuration name to match on."
                                    "type" = "string"
                                  }
                                  "portName" = {
                                    "description" = "Applicable only for GATEWAY context."
                                    "type" = "string"
                                  }
                                  "portNumber" = {
                                    "description" = "The service port number or gateway server port number for which this route configuration was generated."
                                    "type" = "integer"
                                  }
                                  "vhost" = {
                                    "description" = "Match a specific virtual host in a route configuration and apply the patch to the virtual host."
                                    "properties" = {
                                      "name" = {
                                        "description" = "The VirtualHosts objects generated by Istio are named as host:port, where the host typically corresponds to the VirtualService's host field or the hostname of a service in the registry."
                                        "type" = "string"
                                      }
                                      "route" = {
                                        "description" = "Match a specific route within the virtual host."
                                        "properties" = {
                                          "action" = {
                                            "description" = "Match a route with specific action type."
                                            "enum" = [
                                              "ANY",
                                              "ROUTE",
                                              "REDIRECT",
                                              "DIRECT_RESPONSE",
                                            ]
                                            "type" = "string"
                                          }
                                          "name" = {
                                            "description" = "The Route objects generated by default are named as default."
                                            "type" = "string"
                                          }
                                        }
                                        "type" = "object"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                }
                                "type" = "object"
                              }
                            }
                            "type" = "object"
                          }
                          "patch" = {
                            "description" = "The patch to apply along with the operation."
                            "properties" = {
                              "filterClass" = {
                                "description" = "Determines the filter insertion order."
                                "enum" = [
                                  "UNSPECIFIED",
                                  "AUTHN",
                                  "AUTHZ",
                                  "STATS",
                                ]
                                "type" = "string"
                              }
                              "operation" = {
                                "description" = "Determines how the patch should be applied."
                                "enum" = [
                                  "INVALID",
                                  "MERGE",
                                  "ADD",
                                  "REMOVE",
                                  "INSERT_BEFORE",
                                  "INSERT_AFTER",
                                  "INSERT_FIRST",
                                  "REPLACE",
                                ]
                                "type" = "string"
                              }
                              "value" = {
                                "description" = "The JSON config of the object being patched."
                                "type" = "object"
                                "x-kubernetes-preserve-unknown-fields" = true
                              }
                            }
                            "type" = "object"
                          }
                        }
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "priority" = {
                      "description" = "Priority defines the order in which patch sets are applied within a context."
                      "format" = "int32"
                      "type" = "integer"
                    }
                    "workloadSelector" = {
                      "description" = "Criteria used to select the specific set of pods/VMs on which this patch configuration should be applied."
                      "properties" = {
                        "labels" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "description" = "One or more labels that indicate a specific set of pods/VMs on which the configuration should be applied."
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                  }
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = true
          "subresources" = {
            "status" = {}
          }
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "customresourcedefinition_gateways_networking_istio_io" {
  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "annotations" = {
        "helm.sh/resource-policy" = "keep"
      }
      "labels" = {
        "app" = "istio-pilot"
        "chart" = "istio"
        "heritage" = "Tiller"
        "release" = "istio"
      }
      "name" = "gateways.networking.istio.io"
    }
    "spec" = {
      "group" = "networking.istio.io"
      "names" = {
        "categories" = [
          "istio-io",
          "networking-istio-io",
        ]
        "kind" = "Gateway"
        "listKind" = "GatewayList"
        "plural" = "gateways"
        "shortNames" = [
          "gw",
        ]
        "singular" = "gateway"
      }
      "scope" = "Namespaced"
      "versions" = [
        {
          "name" = "v1alpha3"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Configuration affecting edge load balancer. See more details at: https://istio.io/docs/reference/config/networking/gateway.html"
                  "properties" = {
                    "selector" = {
                      "additionalProperties" = {
                        "type" = "string"
                      }
                      "description" = "One or more labels that indicate a specific set of pods/VMs on which this gateway configuration should be applied."
                      "type" = "object"
                    }
                    "servers" = {
                      "description" = "A list of server specifications."
                      "items" = {
                        "properties" = {
                          "bind" = {
                            "description" = "The ip or the Unix domain socket to which the listener should be bound to."
                            "type" = "string"
                          }
                          "defaultEndpoint" = {
                            "type" = "string"
                          }
                          "hosts" = {
                            "description" = "One or more hosts exposed by this gateway."
                            "items" = {
                              "type" = "string"
                            }
                            "type" = "array"
                          }
                          "name" = {
                            "description" = "An optional name of the server, when set must be unique across all servers."
                            "type" = "string"
                          }
                          "port" = {
                            "description" = "The Port on which the proxy should listen for incoming connections."
                            "properties" = {
                              "name" = {
                                "description" = "Label assigned to the port."
                                "type" = "string"
                              }
                              "number" = {
                                "description" = "A valid non-negative integer port number."
                                "type" = "integer"
                              }
                              "protocol" = {
                                "description" = "The protocol exposed on the port."
                                "type" = "string"
                              }
                              "targetPort" = {
                                "type" = "integer"
                              }
                            }
                            "required" = [
                              "number",
                              "protocol",
                              "name",
                            ]
                            "type" = "object"
                          }
                          "tls" = {
                            "description" = "Set of TLS related options that govern the server's behavior."
                            "properties" = {
                              "caCertificates" = {
                                "description" = "REQUIRED if mode is `MUTUAL` or `OPTIONAL_MUTUAL`."
                                "type" = "string"
                              }
                              "cipherSuites" = {
                                "description" = "Optional: If specified, only support the specified cipher list."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                              "credentialName" = {
                                "description" = "For gateways running on Kubernetes, the name of the secret that holds the TLS certs including the CA certificates."
                                "type" = "string"
                              }
                              "httpsRedirect" = {
                                "description" = "If set to true, the load balancer will send a 301 redirect for all http connections, asking the clients to use HTTPS."
                                "type" = "boolean"
                              }
                              "maxProtocolVersion" = {
                                "description" = "Optional: Maximum TLS protocol version."
                                "enum" = [
                                  "TLS_AUTO",
                                  "TLSV1_0",
                                  "TLSV1_1",
                                  "TLSV1_2",
                                  "TLSV1_3",
                                ]
                                "type" = "string"
                              }
                              "minProtocolVersion" = {
                                "description" = "Optional: Minimum TLS protocol version."
                                "enum" = [
                                  "TLS_AUTO",
                                  "TLSV1_0",
                                  "TLSV1_1",
                                  "TLSV1_2",
                                  "TLSV1_3",
                                ]
                                "type" = "string"
                              }
                              "mode" = {
                                "description" = "Optional: Indicates whether connections to this port should be secured using TLS."
                                "enum" = [
                                  "PASSTHROUGH",
                                  "SIMPLE",
                                  "MUTUAL",
                                  "AUTO_PASSTHROUGH",
                                  "ISTIO_MUTUAL",
                                  "OPTIONAL_MUTUAL",
                                ]
                                "type" = "string"
                              }
                              "privateKey" = {
                                "description" = "REQUIRED if mode is `SIMPLE` or `MUTUAL`."
                                "type" = "string"
                              }
                              "serverCertificate" = {
                                "description" = "REQUIRED if mode is `SIMPLE` or `MUTUAL`."
                                "type" = "string"
                              }
                              "subjectAltNames" = {
                                "description" = "A list of alternate names to verify the subject identity in the certificate presented by the client."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                              "verifyCertificateHash" = {
                                "description" = "An optional list of hex-encoded SHA-256 hashes of the authorized client certificates."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                              "verifyCertificateSpki" = {
                                "description" = "An optional list of base64-encoded SHA-256 hashes of the SPKIs of authorized client certificates."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                            }
                            "type" = "object"
                          }
                        }
                        "required" = [
                          "port",
                          "hosts",
                        ]
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                  }
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = true
          "subresources" = {
            "status" = {}
          }
        },
        {
          "name" = "v1beta1"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Configuration affecting edge load balancer. See more details at: https://istio.io/docs/reference/config/networking/gateway.html"
                  "properties" = {
                    "selector" = {
                      "additionalProperties" = {
                        "type" = "string"
                      }
                      "description" = "One or more labels that indicate a specific set of pods/VMs on which this gateway configuration should be applied."
                      "type" = "object"
                    }
                    "servers" = {
                      "description" = "A list of server specifications."
                      "items" = {
                        "properties" = {
                          "bind" = {
                            "description" = "The ip or the Unix domain socket to which the listener should be bound to."
                            "type" = "string"
                          }
                          "defaultEndpoint" = {
                            "type" = "string"
                          }
                          "hosts" = {
                            "description" = "One or more hosts exposed by this gateway."
                            "items" = {
                              "type" = "string"
                            }
                            "type" = "array"
                          }
                          "name" = {
                            "description" = "An optional name of the server, when set must be unique across all servers."
                            "type" = "string"
                          }
                          "port" = {
                            "description" = "The Port on which the proxy should listen for incoming connections."
                            "properties" = {
                              "name" = {
                                "description" = "Label assigned to the port."
                                "type" = "string"
                              }
                              "number" = {
                                "description" = "A valid non-negative integer port number."
                                "type" = "integer"
                              }
                              "protocol" = {
                                "description" = "The protocol exposed on the port."
                                "type" = "string"
                              }
                              "targetPort" = {
                                "type" = "integer"
                              }
                            }
                            "required" = [
                              "number",
                              "protocol",
                              "name",
                            ]
                            "type" = "object"
                          }
                          "tls" = {
                            "description" = "Set of TLS related options that govern the server's behavior."
                            "properties" = {
                              "caCertificates" = {
                                "description" = "REQUIRED if mode is `MUTUAL` or `OPTIONAL_MUTUAL`."
                                "type" = "string"
                              }
                              "cipherSuites" = {
                                "description" = "Optional: If specified, only support the specified cipher list."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                              "credentialName" = {
                                "description" = "For gateways running on Kubernetes, the name of the secret that holds the TLS certs including the CA certificates."
                                "type" = "string"
                              }
                              "httpsRedirect" = {
                                "description" = "If set to true, the load balancer will send a 301 redirect for all http connections, asking the clients to use HTTPS."
                                "type" = "boolean"
                              }
                              "maxProtocolVersion" = {
                                "description" = "Optional: Maximum TLS protocol version."
                                "enum" = [
                                  "TLS_AUTO",
                                  "TLSV1_0",
                                  "TLSV1_1",
                                  "TLSV1_2",
                                  "TLSV1_3",
                                ]
                                "type" = "string"
                              }
                              "minProtocolVersion" = {
                                "description" = "Optional: Minimum TLS protocol version."
                                "enum" = [
                                  "TLS_AUTO",
                                  "TLSV1_0",
                                  "TLSV1_1",
                                  "TLSV1_2",
                                  "TLSV1_3",
                                ]
                                "type" = "string"
                              }
                              "mode" = {
                                "description" = "Optional: Indicates whether connections to this port should be secured using TLS."
                                "enum" = [
                                  "PASSTHROUGH",
                                  "SIMPLE",
                                  "MUTUAL",
                                  "AUTO_PASSTHROUGH",
                                  "ISTIO_MUTUAL",
                                  "OPTIONAL_MUTUAL",
                                ]
                                "type" = "string"
                              }
                              "privateKey" = {
                                "description" = "REQUIRED if mode is `SIMPLE` or `MUTUAL`."
                                "type" = "string"
                              }
                              "serverCertificate" = {
                                "description" = "REQUIRED if mode is `SIMPLE` or `MUTUAL`."
                                "type" = "string"
                              }
                              "subjectAltNames" = {
                                "description" = "A list of alternate names to verify the subject identity in the certificate presented by the client."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                              "verifyCertificateHash" = {
                                "description" = "An optional list of hex-encoded SHA-256 hashes of the authorized client certificates."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                              "verifyCertificateSpki" = {
                                "description" = "An optional list of base64-encoded SHA-256 hashes of the SPKIs of authorized client certificates."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                            }
                            "type" = "object"
                          }
                        }
                        "required" = [
                          "port",
                          "hosts",
                        ]
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                  }
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = false
          "subresources" = {
            "status" = {}
          }
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "customresourcedefinition_istiooperators_install_istio_io" {
  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "labels" = {
        "release" = "istio"
      }
      "name" = "istiooperators.install.istio.io"
    }
    "spec" = {
      "conversion" = {
        "strategy" = "None"
      }
      "group" = "install.istio.io"
      "names" = {
        "kind" = "IstioOperator"
        "listKind" = "IstioOperatorList"
        "plural" = "istiooperators"
        "shortNames" = [
          "iop",
          "io",
        ]
        "singular" = "istiooperator"
      }
      "scope" = "Namespaced"
      "versions" = [
        {
          "additionalPrinterColumns" = [
            {
              "description" = "Istio control plane revision"
              "jsonPath" = ".spec.revision"
              "name" = "Revision"
              "type" = "string"
            },
            {
              "description" = "IOP current state"
              "jsonPath" = ".status.status"
              "name" = "Status"
              "type" = "string"
            },
            {
              "description" = "CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC. Populated by the system. Read-only. Null for lists. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata"
              "jsonPath" = ".metadata.creationTimestamp"
              "name" = "Age"
              "type" = "date"
            },
          ]
          "name" = "v1alpha1"
          "schema" = {
            "openAPIV3Schema" = {
              "type" = "object"
              "x-kubernetes-preserve-unknown-fields" = true
            }
          }
          "served" = true
          "storage" = true
          "subresources" = {
            "status" = {}
          }
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "customresourcedefinition_peerauthentications_security_istio_io" {
  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "annotations" = {
        "helm.sh/resource-policy" = "keep"
      }
      "labels" = {
        "app" = "istio-pilot"
        "chart" = "istio"
        "heritage" = "Tiller"
        "istio" = "security"
        "release" = "istio"
      }
      "name" = "peerauthentications.security.istio.io"
    }
    "spec" = {
      "group" = "security.istio.io"
      "names" = {
        "categories" = [
          "istio-io",
          "security-istio-io",
        ]
        "kind" = "PeerAuthentication"
        "listKind" = "PeerAuthenticationList"
        "plural" = "peerauthentications"
        "shortNames" = [
          "pa",
        ]
        "singular" = "peerauthentication"
      }
      "scope" = "Namespaced"
      "versions" = [
        {
          "additionalPrinterColumns" = [
            {
              "description" = "Defines the mTLS mode used for peer authentication."
              "jsonPath" = ".spec.mtls.mode"
              "name" = "Mode"
              "type" = "string"
            },
            {
              "description" = "CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC. Populated by the system. Read-only. Null for lists. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata"
              "jsonPath" = ".metadata.creationTimestamp"
              "name" = "Age"
              "type" = "date"
            },
          ]
          "name" = "v1beta1"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Peer authentication configuration for workloads. See more details at: https://istio.io/docs/reference/config/security/peer_authentication.html"
                  "properties" = {
                    "mtls" = {
                      "description" = "Mutual TLS settings for workload."
                      "properties" = {
                        "mode" = {
                          "description" = "Defines the mTLS mode used for peer authentication."
                          "enum" = [
                            "UNSET",
                            "DISABLE",
                            "PERMISSIVE",
                            "STRICT",
                          ]
                          "type" = "string"
                        }
                      }
                      "type" = "object"
                    }
                    "portLevelMtls" = {
                      "additionalProperties" = {
                        "properties" = {
                          "mode" = {
                            "description" = "Defines the mTLS mode used for peer authentication."
                            "enum" = [
                              "UNSET",
                              "DISABLE",
                              "PERMISSIVE",
                              "STRICT",
                            ]
                            "type" = "string"
                          }
                        }
                        "type" = "object"
                      }
                      "description" = "Port specific mutual TLS settings."
                      "type" = "object"
                    }
                    "selector" = {
                      "description" = "The selector determines the workloads to apply the ChannelAuthentication on."
                      "properties" = {
                        "matchLabels" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "description" = "One or more labels that indicate a specific set of pods/VMs on which a policy should be applied."
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                  }
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = true
          "subresources" = {
            "status" = {}
          }
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "customresourcedefinition_proxyconfigs_networking_istio_io" {
  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "annotations" = {
        "helm.sh/resource-policy" = "keep"
      }
      "labels" = {
        "app" = "istio-pilot"
        "chart" = "istio"
        "heritage" = "Tiller"
        "release" = "istio"
      }
      "name" = "proxyconfigs.networking.istio.io"
    }
    "spec" = {
      "group" = "networking.istio.io"
      "names" = {
        "categories" = [
          "istio-io",
          "networking-istio-io",
        ]
        "kind" = "ProxyConfig"
        "listKind" = "ProxyConfigList"
        "plural" = "proxyconfigs"
        "singular" = "proxyconfig"
      }
      "scope" = "Namespaced"
      "versions" = [
        {
          "name" = "v1beta1"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Provides configuration for individual workloads. See more details at: https://istio.io/docs/reference/config/networking/proxy-config.html"
                  "properties" = {
                    "concurrency" = {
                      "description" = "The number of worker threads to run."
                      "nullable" = true
                      "type" = "integer"
                    }
                    "environmentVariables" = {
                      "additionalProperties" = {
                        "type" = "string"
                      }
                      "description" = "Additional environment variables for the proxy."
                      "type" = "object"
                    }
                    "image" = {
                      "description" = "Specifies the details of the proxy image."
                      "properties" = {
                        "imageType" = {
                          "description" = "The image type of the image."
                          "type" = "string"
                        }
                      }
                      "type" = "object"
                    }
                    "selector" = {
                      "description" = "Optional."
                      "properties" = {
                        "matchLabels" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "description" = "One or more labels that indicate a specific set of pods/VMs on which a policy should be applied."
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                  }
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = true
          "subresources" = {
            "status" = {}
          }
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "customresourcedefinition_requestauthentications_security_istio_io" {
  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "annotations" = {
        "helm.sh/resource-policy" = "keep"
      }
      "labels" = {
        "app" = "istio-pilot"
        "chart" = "istio"
        "heritage" = "Tiller"
        "istio" = "security"
        "release" = "istio"
      }
      "name" = "requestauthentications.security.istio.io"
    }
    "spec" = {
      "group" = "security.istio.io"
      "names" = {
        "categories" = [
          "istio-io",
          "security-istio-io",
        ]
        "kind" = "RequestAuthentication"
        "listKind" = "RequestAuthenticationList"
        "plural" = "requestauthentications"
        "shortNames" = [
          "ra",
        ]
        "singular" = "requestauthentication"
      }
      "scope" = "Namespaced"
      "versions" = [
        {
          "name" = "v1"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Request authentication configuration for workloads. See more details at: https://istio.io/docs/reference/config/security/request_authentication.html"
                  "properties" = {
                    "jwtRules" = {
                      "description" = "Define the list of JWTs that can be validated at the selected workloads' proxy."
                      "items" = {
                        "properties" = {
                          "audiences" = {
                            "description" = "The list of JWT [audiences](https://tools.ietf.org/html/rfc7519#section-4.1.3) that are allowed to access."
                            "items" = {
                              "type" = "string"
                            }
                            "type" = "array"
                          }
                          "forwardOriginalToken" = {
                            "description" = "If set to true, the original token will be kept for the upstream request."
                            "type" = "boolean"
                          }
                          "fromHeaders" = {
                            "description" = "List of header locations from which JWT is expected."
                            "items" = {
                              "properties" = {
                                "name" = {
                                  "description" = "The HTTP header name."
                                  "type" = "string"
                                }
                                "prefix" = {
                                  "description" = "The prefix that should be stripped before decoding the token."
                                  "type" = "string"
                                }
                              }
                              "required" = [
                                "name",
                              ]
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "fromParams" = {
                            "description" = "List of query parameters from which JWT is expected."
                            "items" = {
                              "type" = "string"
                            }
                            "type" = "array"
                          }
                          "issuer" = {
                            "description" = "Identifies the issuer that issued the JWT."
                            "type" = "string"
                          }
                          "jwks" = {
                            "description" = "JSON Web Key Set of public keys to validate signature of the JWT."
                            "type" = "string"
                          }
                          "jwksUri" = {
                            "description" = "URL of the provider's public key set to validate signature of the JWT."
                            "type" = "string"
                          }
                          "jwks_uri" = {
                            "description" = "URL of the provider's public key set to validate signature of the JWT."
                            "type" = "string"
                          }
                          "outputClaimToHeaders" = {
                            "description" = "This field specifies a list of operations to copy the claim to HTTP headers on a successfully verified token."
                            "items" = {
                              "properties" = {
                                "claim" = {
                                  "description" = "The name of the claim to be copied from."
                                  "type" = "string"
                                }
                                "header" = {
                                  "description" = "The name of the header to be created."
                                  "type" = "string"
                                }
                              }
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "outputPayloadToHeader" = {
                            "description" = "This field specifies the header name to output a successfully verified JWT payload to the backend."
                            "type" = "string"
                          }
                        }
                        "required" = [
                          "issuer",
                        ]
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "selector" = {
                      "description" = "Optional."
                      "properties" = {
                        "matchLabels" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "description" = "One or more labels that indicate a specific set of pods/VMs on which a policy should be applied."
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                    "targetRef" = {
                      "description" = "Optional."
                      "properties" = {
                        "group" = {
                          "description" = "group is the group of the target resource."
                          "type" = "string"
                        }
                        "kind" = {
                          "description" = "kind is kind of the target resource."
                          "type" = "string"
                        }
                        "name" = {
                          "description" = "name is the name of the target resource."
                          "type" = "string"
                        }
                        "namespace" = {
                          "description" = "namespace is the namespace of the referent."
                          "type" = "string"
                        }
                      }
                      "type" = "object"
                    }
                  }
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = false
          "subresources" = {
            "status" = {}
          }
        },
        {
          "name" = "v1beta1"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Request authentication configuration for workloads. See more details at: https://istio.io/docs/reference/config/security/request_authentication.html"
                  "properties" = {
                    "jwtRules" = {
                      "description" = "Define the list of JWTs that can be validated at the selected workloads' proxy."
                      "items" = {
                        "properties" = {
                          "audiences" = {
                            "description" = "The list of JWT [audiences](https://tools.ietf.org/html/rfc7519#section-4.1.3) that are allowed to access."
                            "items" = {
                              "type" = "string"
                            }
                            "type" = "array"
                          }
                          "forwardOriginalToken" = {
                            "description" = "If set to true, the original token will be kept for the upstream request."
                            "type" = "boolean"
                          }
                          "fromHeaders" = {
                            "description" = "List of header locations from which JWT is expected."
                            "items" = {
                              "properties" = {
                                "name" = {
                                  "description" = "The HTTP header name."
                                  "type" = "string"
                                }
                                "prefix" = {
                                  "description" = "The prefix that should be stripped before decoding the token."
                                  "type" = "string"
                                }
                              }
                              "required" = [
                                "name",
                              ]
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "fromParams" = {
                            "description" = "List of query parameters from which JWT is expected."
                            "items" = {
                              "type" = "string"
                            }
                            "type" = "array"
                          }
                          "issuer" = {
                            "description" = "Identifies the issuer that issued the JWT."
                            "type" = "string"
                          }
                          "jwks" = {
                            "description" = "JSON Web Key Set of public keys to validate signature of the JWT."
                            "type" = "string"
                          }
                          "jwksUri" = {
                            "description" = "URL of the provider's public key set to validate signature of the JWT."
                            "type" = "string"
                          }
                          "jwks_uri" = {
                            "description" = "URL of the provider's public key set to validate signature of the JWT."
                            "type" = "string"
                          }
                          "outputClaimToHeaders" = {
                            "description" = "This field specifies a list of operations to copy the claim to HTTP headers on a successfully verified token."
                            "items" = {
                              "properties" = {
                                "claim" = {
                                  "description" = "The name of the claim to be copied from."
                                  "type" = "string"
                                }
                                "header" = {
                                  "description" = "The name of the header to be created."
                                  "type" = "string"
                                }
                              }
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "outputPayloadToHeader" = {
                            "description" = "This field specifies the header name to output a successfully verified JWT payload to the backend."
                            "type" = "string"
                          }
                        }
                        "required" = [
                          "issuer",
                        ]
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "selector" = {
                      "description" = "Optional."
                      "properties" = {
                        "matchLabels" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "description" = "One or more labels that indicate a specific set of pods/VMs on which a policy should be applied."
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                    "targetRef" = {
                      "description" = "Optional."
                      "properties" = {
                        "group" = {
                          "description" = "group is the group of the target resource."
                          "type" = "string"
                        }
                        "kind" = {
                          "description" = "kind is kind of the target resource."
                          "type" = "string"
                        }
                        "name" = {
                          "description" = "name is the name of the target resource."
                          "type" = "string"
                        }
                        "namespace" = {
                          "description" = "namespace is the namespace of the referent."
                          "type" = "string"
                        }
                      }
                      "type" = "object"
                    }
                  }
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = true
          "subresources" = {
            "status" = {}
          }
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "customresourcedefinition_serviceentries_networking_istio_io" {
  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "annotations" = {
        "helm.sh/resource-policy" = "keep"
      }
      "labels" = {
        "app" = "istio-pilot"
        "chart" = "istio"
        "heritage" = "Tiller"
        "release" = "istio"
      }
      "name" = "serviceentries.networking.istio.io"
    }
    "spec" = {
      "group" = "networking.istio.io"
      "names" = {
        "categories" = [
          "istio-io",
          "networking-istio-io",
        ]
        "kind" = "ServiceEntry"
        "listKind" = "ServiceEntryList"
        "plural" = "serviceentries"
        "shortNames" = [
          "se",
        ]
        "singular" = "serviceentry"
      }
      "scope" = "Namespaced"
      "versions" = [
        {
          "additionalPrinterColumns" = [
            {
              "description" = "The hosts associated with the ServiceEntry"
              "jsonPath" = ".spec.hosts"
              "name" = "Hosts"
              "type" = "string"
            },
            {
              "description" = "Whether the service is external to the mesh or part of the mesh (MESH_EXTERNAL or MESH_INTERNAL)"
              "jsonPath" = ".spec.location"
              "name" = "Location"
              "type" = "string"
            },
            {
              "description" = "Service resolution mode for the hosts (NONE, STATIC, or DNS)"
              "jsonPath" = ".spec.resolution"
              "name" = "Resolution"
              "type" = "string"
            },
            {
              "description" = "CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC. Populated by the system. Read-only. Null for lists. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata"
              "jsonPath" = ".metadata.creationTimestamp"
              "name" = "Age"
              "type" = "date"
            },
          ]
          "name" = "v1alpha3"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Configuration affecting service registry. See more details at: https://istio.io/docs/reference/config/networking/service-entry.html"
                  "properties" = {
                    "addresses" = {
                      "description" = "The virtual IP addresses associated with the service."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "endpoints" = {
                      "description" = "One or more endpoints associated with the service."
                      "items" = {
                        "properties" = {
                          "address" = {
                            "description" = "Address associated with the network endpoint without the port."
                            "type" = "string"
                          }
                          "labels" = {
                            "additionalProperties" = {
                              "type" = "string"
                            }
                            "description" = "One or more labels associated with the endpoint."
                            "type" = "object"
                          }
                          "locality" = {
                            "description" = "The locality associated with the endpoint."
                            "type" = "string"
                          }
                          "network" = {
                            "description" = "Network enables Istio to group endpoints resident in the same L3 domain/network."
                            "type" = "string"
                          }
                          "ports" = {
                            "additionalProperties" = {
                              "type" = "integer"
                            }
                            "description" = "Set of ports associated with the endpoint."
                            "type" = "object"
                          }
                          "serviceAccount" = {
                            "description" = "The service account associated with the workload if a sidecar is present in the workload."
                            "type" = "string"
                          }
                          "weight" = {
                            "description" = "The load balancing weight associated with the endpoint."
                            "type" = "integer"
                          }
                        }
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "exportTo" = {
                      "description" = "A list of namespaces to which this service is exported."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "hosts" = {
                      "description" = "The hosts associated with the ServiceEntry."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "location" = {
                      "description" = "Specify whether the service should be considered external to the mesh or part of the mesh."
                      "enum" = [
                        "MESH_EXTERNAL",
                        "MESH_INTERNAL",
                      ]
                      "type" = "string"
                    }
                    "ports" = {
                      "description" = "The ports associated with the external service."
                      "items" = {
                        "properties" = {
                          "name" = {
                            "description" = "Label assigned to the port."
                            "type" = "string"
                          }
                          "number" = {
                            "description" = "A valid non-negative integer port number."
                            "type" = "integer"
                          }
                          "protocol" = {
                            "description" = "The protocol exposed on the port."
                            "type" = "string"
                          }
                          "targetPort" = {
                            "description" = "The port number on the endpoint where the traffic will be received."
                            "type" = "integer"
                          }
                        }
                        "required" = [
                          "number",
                          "name",
                        ]
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "resolution" = {
                      "description" = "Service resolution mode for the hosts."
                      "enum" = [
                        "NONE",
                        "STATIC",
                        "DNS",
                        "DNS_ROUND_ROBIN",
                      ]
                      "type" = "string"
                    }
                    "subjectAltNames" = {
                      "description" = "If specified, the proxy will verify that the server certificate's subject alternate name matches one of the specified values."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "workloadSelector" = {
                      "description" = "Applicable only for MESH_INTERNAL services."
                      "properties" = {
                        "labels" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "description" = "One or more labels that indicate a specific set of pods/VMs on which the configuration should be applied."
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                  }
                  "required" = [
                    "hosts",
                  ]
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = true
          "subresources" = {
            "status" = {}
          }
        },
        {
          "additionalPrinterColumns" = [
            {
              "description" = "The hosts associated with the ServiceEntry"
              "jsonPath" = ".spec.hosts"
              "name" = "Hosts"
              "type" = "string"
            },
            {
              "description" = "Whether the service is external to the mesh or part of the mesh (MESH_EXTERNAL or MESH_INTERNAL)"
              "jsonPath" = ".spec.location"
              "name" = "Location"
              "type" = "string"
            },
            {
              "description" = "Service resolution mode for the hosts (NONE, STATIC, or DNS)"
              "jsonPath" = ".spec.resolution"
              "name" = "Resolution"
              "type" = "string"
            },
            {
              "description" = "CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC. Populated by the system. Read-only. Null for lists. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata"
              "jsonPath" = ".metadata.creationTimestamp"
              "name" = "Age"
              "type" = "date"
            },
          ]
          "name" = "v1beta1"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Configuration affecting service registry. See more details at: https://istio.io/docs/reference/config/networking/service-entry.html"
                  "properties" = {
                    "addresses" = {
                      "description" = "The virtual IP addresses associated with the service."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "endpoints" = {
                      "description" = "One or more endpoints associated with the service."
                      "items" = {
                        "properties" = {
                          "address" = {
                            "description" = "Address associated with the network endpoint without the port."
                            "type" = "string"
                          }
                          "labels" = {
                            "additionalProperties" = {
                              "type" = "string"
                            }
                            "description" = "One or more labels associated with the endpoint."
                            "type" = "object"
                          }
                          "locality" = {
                            "description" = "The locality associated with the endpoint."
                            "type" = "string"
                          }
                          "network" = {
                            "description" = "Network enables Istio to group endpoints resident in the same L3 domain/network."
                            "type" = "string"
                          }
                          "ports" = {
                            "additionalProperties" = {
                              "type" = "integer"
                            }
                            "description" = "Set of ports associated with the endpoint."
                            "type" = "object"
                          }
                          "serviceAccount" = {
                            "description" = "The service account associated with the workload if a sidecar is present in the workload."
                            "type" = "string"
                          }
                          "weight" = {
                            "description" = "The load balancing weight associated with the endpoint."
                            "type" = "integer"
                          }
                        }
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "exportTo" = {
                      "description" = "A list of namespaces to which this service is exported."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "hosts" = {
                      "description" = "The hosts associated with the ServiceEntry."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "location" = {
                      "description" = "Specify whether the service should be considered external to the mesh or part of the mesh."
                      "enum" = [
                        "MESH_EXTERNAL",
                        "MESH_INTERNAL",
                      ]
                      "type" = "string"
                    }
                    "ports" = {
                      "description" = "The ports associated with the external service."
                      "items" = {
                        "properties" = {
                          "name" = {
                            "description" = "Label assigned to the port."
                            "type" = "string"
                          }
                          "number" = {
                            "description" = "A valid non-negative integer port number."
                            "type" = "integer"
                          }
                          "protocol" = {
                            "description" = "The protocol exposed on the port."
                            "type" = "string"
                          }
                          "targetPort" = {
                            "description" = "The port number on the endpoint where the traffic will be received."
                            "type" = "integer"
                          }
                        }
                        "required" = [
                          "number",
                          "name",
                        ]
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "resolution" = {
                      "description" = "Service resolution mode for the hosts."
                      "enum" = [
                        "NONE",
                        "STATIC",
                        "DNS",
                        "DNS_ROUND_ROBIN",
                      ]
                      "type" = "string"
                    }
                    "subjectAltNames" = {
                      "description" = "If specified, the proxy will verify that the server certificate's subject alternate name matches one of the specified values."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "workloadSelector" = {
                      "description" = "Applicable only for MESH_INTERNAL services."
                      "properties" = {
                        "labels" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "description" = "One or more labels that indicate a specific set of pods/VMs on which the configuration should be applied."
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                  }
                  "required" = [
                    "hosts",
                  ]
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = false
          "subresources" = {
            "status" = {}
          }
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "customresourcedefinition_sidecars_networking_istio_io" {
  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "annotations" = {
        "helm.sh/resource-policy" = "keep"
      }
      "labels" = {
        "app" = "istio-pilot"
        "chart" = "istio"
        "heritage" = "Tiller"
        "release" = "istio"
      }
      "name" = "sidecars.networking.istio.io"
    }
    "spec" = {
      "group" = "networking.istio.io"
      "names" = {
        "categories" = [
          "istio-io",
          "networking-istio-io",
        ]
        "kind" = "Sidecar"
        "listKind" = "SidecarList"
        "plural" = "sidecars"
        "singular" = "sidecar"
      }
      "scope" = "Namespaced"
      "versions" = [
        {
          "name" = "v1alpha3"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Configuration affecting network reachability of a sidecar. See more details at: https://istio.io/docs/reference/config/networking/sidecar.html"
                  "properties" = {
                    "egress" = {
                      "description" = "Egress specifies the configuration of the sidecar for processing outbound traffic from the attached workload instance to other services in the mesh."
                      "items" = {
                        "properties" = {
                          "bind" = {
                            "description" = "The IP(IPv4 or IPv6) or the Unix domain socket to which the listener should be bound to."
                            "type" = "string"
                          }
                          "captureMode" = {
                            "description" = "When the bind address is an IP, the captureMode option dictates how traffic to the listener is expected to be captured (or not)."
                            "enum" = [
                              "DEFAULT",
                              "IPTABLES",
                              "NONE",
                            ]
                            "type" = "string"
                          }
                          "hosts" = {
                            "description" = "One or more service hosts exposed by the listener in `namespace/dnsName` format."
                            "items" = {
                              "type" = "string"
                            }
                            "type" = "array"
                          }
                          "port" = {
                            "description" = "The port associated with the listener."
                            "properties" = {
                              "name" = {
                                "description" = "Label assigned to the port."
                                "type" = "string"
                              }
                              "number" = {
                                "description" = "A valid non-negative integer port number."
                                "type" = "integer"
                              }
                              "protocol" = {
                                "description" = "The protocol exposed on the port."
                                "type" = "string"
                              }
                              "targetPort" = {
                                "type" = "integer"
                              }
                            }
                            "type" = "object"
                          }
                        }
                        "required" = [
                          "hosts",
                        ]
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "inboundConnectionPool" = {
                      "description" = "Settings controlling the volume of connections Envoy will accept from the network."
                      "properties" = {
                        "http" = {
                          "description" = "HTTP connection pool settings."
                          "properties" = {
                            "h2UpgradePolicy" = {
                              "description" = "Specify if http1.1 connection should be upgraded to http2 for the associated destination."
                              "enum" = [
                                "DEFAULT",
                                "DO_NOT_UPGRADE",
                                "UPGRADE",
                              ]
                              "type" = "string"
                            }
                            "http1MaxPendingRequests" = {
                              "description" = "Maximum number of requests that will be queued while waiting for a ready connection pool connection."
                              "format" = "int32"
                              "type" = "integer"
                            }
                            "http2MaxRequests" = {
                              "description" = "Maximum number of active requests to a destination."
                              "format" = "int32"
                              "type" = "integer"
                            }
                            "idleTimeout" = {
                              "description" = "The idle timeout for upstream connection pool connections."
                              "type" = "string"
                            }
                            "maxRequestsPerConnection" = {
                              "description" = "Maximum number of requests per connection to a backend."
                              "format" = "int32"
                              "type" = "integer"
                            }
                            "maxRetries" = {
                              "description" = "Maximum number of retries that can be outstanding to all hosts in a cluster at a given time."
                              "format" = "int32"
                              "type" = "integer"
                            }
                            "useClientProtocol" = {
                              "description" = "If set to true, client protocol will be preserved while initiating connection to backend."
                              "type" = "boolean"
                            }
                          }
                          "type" = "object"
                        }
                        "tcp" = {
                          "description" = "Settings common to both HTTP and TCP upstream connections."
                          "properties" = {
                            "connectTimeout" = {
                              "description" = "TCP connection timeout."
                              "type" = "string"
                            }
                            "maxConnectionDuration" = {
                              "description" = "The maximum duration of a connection."
                              "type" = "string"
                            }
                            "maxConnections" = {
                              "description" = "Maximum number of HTTP1 /TCP connections to a destination host."
                              "format" = "int32"
                              "type" = "integer"
                            }
                            "tcpKeepalive" = {
                              "description" = "If set then set SO_KEEPALIVE on the socket to enable TCP Keepalives."
                              "properties" = {
                                "interval" = {
                                  "description" = "The time duration between keep-alive probes."
                                  "type" = "string"
                                }
                                "probes" = {
                                  "description" = "Maximum number of keepalive probes to send without response before deciding the connection is dead."
                                  "type" = "integer"
                                }
                                "time" = {
                                  "description" = "The time duration a connection needs to be idle before keep-alive probes start being sent."
                                  "type" = "string"
                                }
                              }
                              "type" = "object"
                            }
                          }
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                    "ingress" = {
                      "description" = "Ingress specifies the configuration of the sidecar for processing inbound traffic to the attached workload instance."
                      "items" = {
                        "properties" = {
                          "bind" = {
                            "description" = "The IP(IPv4 or IPv6) to which the listener should be bound."
                            "type" = "string"
                          }
                          "captureMode" = {
                            "description" = "The captureMode option dictates how traffic to the listener is expected to be captured (or not)."
                            "enum" = [
                              "DEFAULT",
                              "IPTABLES",
                              "NONE",
                            ]
                            "type" = "string"
                          }
                          "connectionPool" = {
                            "description" = "Settings controlling the volume of connections Envoy will accept from the network."
                            "properties" = {
                              "http" = {
                                "description" = "HTTP connection pool settings."
                                "properties" = {
                                  "h2UpgradePolicy" = {
                                    "description" = "Specify if http1.1 connection should be upgraded to http2 for the associated destination."
                                    "enum" = [
                                      "DEFAULT",
                                      "DO_NOT_UPGRADE",
                                      "UPGRADE",
                                    ]
                                    "type" = "string"
                                  }
                                  "http1MaxPendingRequests" = {
                                    "description" = "Maximum number of requests that will be queued while waiting for a ready connection pool connection."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "http2MaxRequests" = {
                                    "description" = "Maximum number of active requests to a destination."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "idleTimeout" = {
                                    "description" = "The idle timeout for upstream connection pool connections."
                                    "type" = "string"
                                  }
                                  "maxRequestsPerConnection" = {
                                    "description" = "Maximum number of requests per connection to a backend."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "maxRetries" = {
                                    "description" = "Maximum number of retries that can be outstanding to all hosts in a cluster at a given time."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "useClientProtocol" = {
                                    "description" = "If set to true, client protocol will be preserved while initiating connection to backend."
                                    "type" = "boolean"
                                  }
                                }
                                "type" = "object"
                              }
                              "tcp" = {
                                "description" = "Settings common to both HTTP and TCP upstream connections."
                                "properties" = {
                                  "connectTimeout" = {
                                    "description" = "TCP connection timeout."
                                    "type" = "string"
                                  }
                                  "maxConnectionDuration" = {
                                    "description" = "The maximum duration of a connection."
                                    "type" = "string"
                                  }
                                  "maxConnections" = {
                                    "description" = "Maximum number of HTTP1 /TCP connections to a destination host."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "tcpKeepalive" = {
                                    "description" = "If set then set SO_KEEPALIVE on the socket to enable TCP Keepalives."
                                    "properties" = {
                                      "interval" = {
                                        "description" = "The time duration between keep-alive probes."
                                        "type" = "string"
                                      }
                                      "probes" = {
                                        "description" = "Maximum number of keepalive probes to send without response before deciding the connection is dead."
                                        "type" = "integer"
                                      }
                                      "time" = {
                                        "description" = "The time duration a connection needs to be idle before keep-alive probes start being sent."
                                        "type" = "string"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                }
                                "type" = "object"
                              }
                            }
                            "type" = "object"
                          }
                          "defaultEndpoint" = {
                            "description" = "The IP endpoint or Unix domain socket to which traffic should be forwarded to."
                            "type" = "string"
                          }
                          "port" = {
                            "description" = "The port associated with the listener."
                            "properties" = {
                              "name" = {
                                "description" = "Label assigned to the port."
                                "type" = "string"
                              }
                              "number" = {
                                "description" = "A valid non-negative integer port number."
                                "type" = "integer"
                              }
                              "protocol" = {
                                "description" = "The protocol exposed on the port."
                                "type" = "string"
                              }
                              "targetPort" = {
                                "type" = "integer"
                              }
                            }
                            "type" = "object"
                          }
                          "tls" = {
                            "description" = "Set of TLS related options that will enable TLS termination on the sidecar for requests originating from outside the mesh."
                            "properties" = {
                              "caCertificates" = {
                                "description" = "REQUIRED if mode is `MUTUAL` or `OPTIONAL_MUTUAL`."
                                "type" = "string"
                              }
                              "cipherSuites" = {
                                "description" = "Optional: If specified, only support the specified cipher list."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                              "credentialName" = {
                                "description" = "For gateways running on Kubernetes, the name of the secret that holds the TLS certs including the CA certificates."
                                "type" = "string"
                              }
                              "httpsRedirect" = {
                                "description" = "If set to true, the load balancer will send a 301 redirect for all http connections, asking the clients to use HTTPS."
                                "type" = "boolean"
                              }
                              "maxProtocolVersion" = {
                                "description" = "Optional: Maximum TLS protocol version."
                                "enum" = [
                                  "TLS_AUTO",
                                  "TLSV1_0",
                                  "TLSV1_1",
                                  "TLSV1_2",
                                  "TLSV1_3",
                                ]
                                "type" = "string"
                              }
                              "minProtocolVersion" = {
                                "description" = "Optional: Minimum TLS protocol version."
                                "enum" = [
                                  "TLS_AUTO",
                                  "TLSV1_0",
                                  "TLSV1_1",
                                  "TLSV1_2",
                                  "TLSV1_3",
                                ]
                                "type" = "string"
                              }
                              "mode" = {
                                "description" = "Optional: Indicates whether connections to this port should be secured using TLS."
                                "enum" = [
                                  "PASSTHROUGH",
                                  "SIMPLE",
                                  "MUTUAL",
                                  "AUTO_PASSTHROUGH",
                                  "ISTIO_MUTUAL",
                                  "OPTIONAL_MUTUAL",
                                ]
                                "type" = "string"
                              }
                              "privateKey" = {
                                "description" = "REQUIRED if mode is `SIMPLE` or `MUTUAL`."
                                "type" = "string"
                              }
                              "serverCertificate" = {
                                "description" = "REQUIRED if mode is `SIMPLE` or `MUTUAL`."
                                "type" = "string"
                              }
                              "subjectAltNames" = {
                                "description" = "A list of alternate names to verify the subject identity in the certificate presented by the client."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                              "verifyCertificateHash" = {
                                "description" = "An optional list of hex-encoded SHA-256 hashes of the authorized client certificates."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                              "verifyCertificateSpki" = {
                                "description" = "An optional list of base64-encoded SHA-256 hashes of the SPKIs of authorized client certificates."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                            }
                            "type" = "object"
                          }
                        }
                        "required" = [
                          "port",
                        ]
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "outboundTrafficPolicy" = {
                      "description" = "Configuration for the outbound traffic policy."
                      "properties" = {
                        "egressProxy" = {
                          "properties" = {
                            "host" = {
                              "description" = "The name of a service from the service registry."
                              "type" = "string"
                            }
                            "port" = {
                              "description" = "Specifies the port on the host that is being addressed."
                              "properties" = {
                                "number" = {
                                  "type" = "integer"
                                }
                              }
                              "type" = "object"
                            }
                            "subset" = {
                              "description" = "The name of a subset within the service."
                              "type" = "string"
                            }
                          }
                          "required" = [
                            "host",
                          ]
                          "type" = "object"
                        }
                        "mode" = {
                          "enum" = [
                            "REGISTRY_ONLY",
                            "ALLOW_ANY",
                          ]
                          "type" = "string"
                        }
                      }
                      "type" = "object"
                    }
                    "workloadSelector" = {
                      "description" = "Criteria used to select the specific set of pods/VMs on which this `Sidecar` configuration should be applied."
                      "properties" = {
                        "labels" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "description" = "One or more labels that indicate a specific set of pods/VMs on which the configuration should be applied."
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                  }
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = true
          "subresources" = {
            "status" = {}
          }
        },
        {
          "name" = "v1beta1"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Configuration affecting network reachability of a sidecar. See more details at: https://istio.io/docs/reference/config/networking/sidecar.html"
                  "properties" = {
                    "egress" = {
                      "description" = "Egress specifies the configuration of the sidecar for processing outbound traffic from the attached workload instance to other services in the mesh."
                      "items" = {
                        "properties" = {
                          "bind" = {
                            "description" = "The IP(IPv4 or IPv6) or the Unix domain socket to which the listener should be bound to."
                            "type" = "string"
                          }
                          "captureMode" = {
                            "description" = "When the bind address is an IP, the captureMode option dictates how traffic to the listener is expected to be captured (or not)."
                            "enum" = [
                              "DEFAULT",
                              "IPTABLES",
                              "NONE",
                            ]
                            "type" = "string"
                          }
                          "hosts" = {
                            "description" = "One or more service hosts exposed by the listener in `namespace/dnsName` format."
                            "items" = {
                              "type" = "string"
                            }
                            "type" = "array"
                          }
                          "port" = {
                            "description" = "The port associated with the listener."
                            "properties" = {
                              "name" = {
                                "description" = "Label assigned to the port."
                                "type" = "string"
                              }
                              "number" = {
                                "description" = "A valid non-negative integer port number."
                                "type" = "integer"
                              }
                              "protocol" = {
                                "description" = "The protocol exposed on the port."
                                "type" = "string"
                              }
                              "targetPort" = {
                                "type" = "integer"
                              }
                            }
                            "type" = "object"
                          }
                        }
                        "required" = [
                          "hosts",
                        ]
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "inboundConnectionPool" = {
                      "description" = "Settings controlling the volume of connections Envoy will accept from the network."
                      "properties" = {
                        "http" = {
                          "description" = "HTTP connection pool settings."
                          "properties" = {
                            "h2UpgradePolicy" = {
                              "description" = "Specify if http1.1 connection should be upgraded to http2 for the associated destination."
                              "enum" = [
                                "DEFAULT",
                                "DO_NOT_UPGRADE",
                                "UPGRADE",
                              ]
                              "type" = "string"
                            }
                            "http1MaxPendingRequests" = {
                              "description" = "Maximum number of requests that will be queued while waiting for a ready connection pool connection."
                              "format" = "int32"
                              "type" = "integer"
                            }
                            "http2MaxRequests" = {
                              "description" = "Maximum number of active requests to a destination."
                              "format" = "int32"
                              "type" = "integer"
                            }
                            "idleTimeout" = {
                              "description" = "The idle timeout for upstream connection pool connections."
                              "type" = "string"
                            }
                            "maxRequestsPerConnection" = {
                              "description" = "Maximum number of requests per connection to a backend."
                              "format" = "int32"
                              "type" = "integer"
                            }
                            "maxRetries" = {
                              "description" = "Maximum number of retries that can be outstanding to all hosts in a cluster at a given time."
                              "format" = "int32"
                              "type" = "integer"
                            }
                            "useClientProtocol" = {
                              "description" = "If set to true, client protocol will be preserved while initiating connection to backend."
                              "type" = "boolean"
                            }
                          }
                          "type" = "object"
                        }
                        "tcp" = {
                          "description" = "Settings common to both HTTP and TCP upstream connections."
                          "properties" = {
                            "connectTimeout" = {
                              "description" = "TCP connection timeout."
                              "type" = "string"
                            }
                            "maxConnectionDuration" = {
                              "description" = "The maximum duration of a connection."
                              "type" = "string"
                            }
                            "maxConnections" = {
                              "description" = "Maximum number of HTTP1 /TCP connections to a destination host."
                              "format" = "int32"
                              "type" = "integer"
                            }
                            "tcpKeepalive" = {
                              "description" = "If set then set SO_KEEPALIVE on the socket to enable TCP Keepalives."
                              "properties" = {
                                "interval" = {
                                  "description" = "The time duration between keep-alive probes."
                                  "type" = "string"
                                }
                                "probes" = {
                                  "description" = "Maximum number of keepalive probes to send without response before deciding the connection is dead."
                                  "type" = "integer"
                                }
                                "time" = {
                                  "description" = "The time duration a connection needs to be idle before keep-alive probes start being sent."
                                  "type" = "string"
                                }
                              }
                              "type" = "object"
                            }
                          }
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                    "ingress" = {
                      "description" = "Ingress specifies the configuration of the sidecar for processing inbound traffic to the attached workload instance."
                      "items" = {
                        "properties" = {
                          "bind" = {
                            "description" = "The IP(IPv4 or IPv6) to which the listener should be bound."
                            "type" = "string"
                          }
                          "captureMode" = {
                            "description" = "The captureMode option dictates how traffic to the listener is expected to be captured (or not)."
                            "enum" = [
                              "DEFAULT",
                              "IPTABLES",
                              "NONE",
                            ]
                            "type" = "string"
                          }
                          "connectionPool" = {
                            "description" = "Settings controlling the volume of connections Envoy will accept from the network."
                            "properties" = {
                              "http" = {
                                "description" = "HTTP connection pool settings."
                                "properties" = {
                                  "h2UpgradePolicy" = {
                                    "description" = "Specify if http1.1 connection should be upgraded to http2 for the associated destination."
                                    "enum" = [
                                      "DEFAULT",
                                      "DO_NOT_UPGRADE",
                                      "UPGRADE",
                                    ]
                                    "type" = "string"
                                  }
                                  "http1MaxPendingRequests" = {
                                    "description" = "Maximum number of requests that will be queued while waiting for a ready connection pool connection."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "http2MaxRequests" = {
                                    "description" = "Maximum number of active requests to a destination."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "idleTimeout" = {
                                    "description" = "The idle timeout for upstream connection pool connections."
                                    "type" = "string"
                                  }
                                  "maxRequestsPerConnection" = {
                                    "description" = "Maximum number of requests per connection to a backend."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "maxRetries" = {
                                    "description" = "Maximum number of retries that can be outstanding to all hosts in a cluster at a given time."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "useClientProtocol" = {
                                    "description" = "If set to true, client protocol will be preserved while initiating connection to backend."
                                    "type" = "boolean"
                                  }
                                }
                                "type" = "object"
                              }
                              "tcp" = {
                                "description" = "Settings common to both HTTP and TCP upstream connections."
                                "properties" = {
                                  "connectTimeout" = {
                                    "description" = "TCP connection timeout."
                                    "type" = "string"
                                  }
                                  "maxConnectionDuration" = {
                                    "description" = "The maximum duration of a connection."
                                    "type" = "string"
                                  }
                                  "maxConnections" = {
                                    "description" = "Maximum number of HTTP1 /TCP connections to a destination host."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "tcpKeepalive" = {
                                    "description" = "If set then set SO_KEEPALIVE on the socket to enable TCP Keepalives."
                                    "properties" = {
                                      "interval" = {
                                        "description" = "The time duration between keep-alive probes."
                                        "type" = "string"
                                      }
                                      "probes" = {
                                        "description" = "Maximum number of keepalive probes to send without response before deciding the connection is dead."
                                        "type" = "integer"
                                      }
                                      "time" = {
                                        "description" = "The time duration a connection needs to be idle before keep-alive probes start being sent."
                                        "type" = "string"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                }
                                "type" = "object"
                              }
                            }
                            "type" = "object"
                          }
                          "defaultEndpoint" = {
                            "description" = "The IP endpoint or Unix domain socket to which traffic should be forwarded to."
                            "type" = "string"
                          }
                          "port" = {
                            "description" = "The port associated with the listener."
                            "properties" = {
                              "name" = {
                                "description" = "Label assigned to the port."
                                "type" = "string"
                              }
                              "number" = {
                                "description" = "A valid non-negative integer port number."
                                "type" = "integer"
                              }
                              "protocol" = {
                                "description" = "The protocol exposed on the port."
                                "type" = "string"
                              }
                              "targetPort" = {
                                "type" = "integer"
                              }
                            }
                            "type" = "object"
                          }
                          "tls" = {
                            "description" = "Set of TLS related options that will enable TLS termination on the sidecar for requests originating from outside the mesh."
                            "properties" = {
                              "caCertificates" = {
                                "description" = "REQUIRED if mode is `MUTUAL` or `OPTIONAL_MUTUAL`."
                                "type" = "string"
                              }
                              "cipherSuites" = {
                                "description" = "Optional: If specified, only support the specified cipher list."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                              "credentialName" = {
                                "description" = "For gateways running on Kubernetes, the name of the secret that holds the TLS certs including the CA certificates."
                                "type" = "string"
                              }
                              "httpsRedirect" = {
                                "description" = "If set to true, the load balancer will send a 301 redirect for all http connections, asking the clients to use HTTPS."
                                "type" = "boolean"
                              }
                              "maxProtocolVersion" = {
                                "description" = "Optional: Maximum TLS protocol version."
                                "enum" = [
                                  "TLS_AUTO",
                                  "TLSV1_0",
                                  "TLSV1_1",
                                  "TLSV1_2",
                                  "TLSV1_3",
                                ]
                                "type" = "string"
                              }
                              "minProtocolVersion" = {
                                "description" = "Optional: Minimum TLS protocol version."
                                "enum" = [
                                  "TLS_AUTO",
                                  "TLSV1_0",
                                  "TLSV1_1",
                                  "TLSV1_2",
                                  "TLSV1_3",
                                ]
                                "type" = "string"
                              }
                              "mode" = {
                                "description" = "Optional: Indicates whether connections to this port should be secured using TLS."
                                "enum" = [
                                  "PASSTHROUGH",
                                  "SIMPLE",
                                  "MUTUAL",
                                  "AUTO_PASSTHROUGH",
                                  "ISTIO_MUTUAL",
                                  "OPTIONAL_MUTUAL",
                                ]
                                "type" = "string"
                              }
                              "privateKey" = {
                                "description" = "REQUIRED if mode is `SIMPLE` or `MUTUAL`."
                                "type" = "string"
                              }
                              "serverCertificate" = {
                                "description" = "REQUIRED if mode is `SIMPLE` or `MUTUAL`."
                                "type" = "string"
                              }
                              "subjectAltNames" = {
                                "description" = "A list of alternate names to verify the subject identity in the certificate presented by the client."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                              "verifyCertificateHash" = {
                                "description" = "An optional list of hex-encoded SHA-256 hashes of the authorized client certificates."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                              "verifyCertificateSpki" = {
                                "description" = "An optional list of base64-encoded SHA-256 hashes of the SPKIs of authorized client certificates."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                            }
                            "type" = "object"
                          }
                        }
                        "required" = [
                          "port",
                        ]
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "outboundTrafficPolicy" = {
                      "description" = "Configuration for the outbound traffic policy."
                      "properties" = {
                        "egressProxy" = {
                          "properties" = {
                            "host" = {
                              "description" = "The name of a service from the service registry."
                              "type" = "string"
                            }
                            "port" = {
                              "description" = "Specifies the port on the host that is being addressed."
                              "properties" = {
                                "number" = {
                                  "type" = "integer"
                                }
                              }
                              "type" = "object"
                            }
                            "subset" = {
                              "description" = "The name of a subset within the service."
                              "type" = "string"
                            }
                          }
                          "required" = [
                            "host",
                          ]
                          "type" = "object"
                        }
                        "mode" = {
                          "enum" = [
                            "REGISTRY_ONLY",
                            "ALLOW_ANY",
                          ]
                          "type" = "string"
                        }
                      }
                      "type" = "object"
                    }
                    "workloadSelector" = {
                      "description" = "Criteria used to select the specific set of pods/VMs on which this `Sidecar` configuration should be applied."
                      "properties" = {
                        "labels" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "description" = "One or more labels that indicate a specific set of pods/VMs on which the configuration should be applied."
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                  }
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = false
          "subresources" = {
            "status" = {}
          }
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "customresourcedefinition_telemetries_telemetry_istio_io" {
  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "annotations" = {
        "helm.sh/resource-policy" = "keep"
      }
      "labels" = {
        "app" = "istio-pilot"
        "chart" = "istio"
        "heritage" = "Tiller"
        "istio" = "telemetry"
        "release" = "istio"
      }
      "name" = "telemetries.telemetry.istio.io"
    }
    "spec" = {
      "group" = "telemetry.istio.io"
      "names" = {
        "categories" = [
          "istio-io",
          "telemetry-istio-io",
        ]
        "kind" = "Telemetry"
        "listKind" = "TelemetryList"
        "plural" = "telemetries"
        "shortNames" = [
          "telemetry",
        ]
        "singular" = "telemetry"
      }
      "scope" = "Namespaced"
      "versions" = [
        {
          "additionalPrinterColumns" = [
            {
              "description" = "CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC. Populated by the system. Read-only. Null for lists. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata"
              "jsonPath" = ".metadata.creationTimestamp"
              "name" = "Age"
              "type" = "date"
            },
          ]
          "name" = "v1alpha1"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Telemetry configuration for workloads. See more details at: https://istio.io/docs/reference/config/telemetry.html"
                  "properties" = {
                    "accessLogging" = {
                      "description" = "Optional."
                      "items" = {
                        "properties" = {
                          "disabled" = {
                            "description" = "Controls logging."
                            "nullable" = true
                            "type" = "boolean"
                          }
                          "filter" = {
                            "description" = "Optional."
                            "properties" = {
                              "expression" = {
                                "description" = "CEL expression for selecting when requests/connections should be logged."
                                "type" = "string"
                              }
                            }
                            "type" = "object"
                          }
                          "match" = {
                            "description" = "Allows tailoring of logging behavior to specific conditions."
                            "properties" = {
                              "mode" = {
                                "description" = "This determines whether or not to apply the access logging configuration based on the direction of traffic relative to the proxied workload."
                                "enum" = [
                                  "CLIENT_AND_SERVER",
                                  "CLIENT",
                                  "SERVER",
                                ]
                                "type" = "string"
                              }
                            }
                            "type" = "object"
                          }
                          "providers" = {
                            "description" = "Optional."
                            "items" = {
                              "properties" = {
                                "name" = {
                                  "description" = "Required."
                                  "type" = "string"
                                }
                              }
                              "required" = [
                                "name",
                              ]
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                        }
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "metrics" = {
                      "description" = "Optional."
                      "items" = {
                        "properties" = {
                          "overrides" = {
                            "description" = "Optional."
                            "items" = {
                              "properties" = {
                                "disabled" = {
                                  "description" = "Optional."
                                  "nullable" = true
                                  "type" = "boolean"
                                }
                                "match" = {
                                  "description" = "Match allows provides the scope of the override."
                                  "oneOf" = [
                                    {
                                      "not" = {
                                        "anyOf" = [
                                          {
                                            "required" = [
                                              "metric",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "customMetric",
                                            ]
                                          },
                                        ]
                                      }
                                    },
                                    {
                                      "required" = [
                                        "metric",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "customMetric",
                                      ]
                                    },
                                  ]
                                  "properties" = {
                                    "customMetric" = {
                                      "description" = "Allows free-form specification of a metric."
                                      "type" = "string"
                                    }
                                    "metric" = {
                                      "description" = "One of the well-known Istio Standard Metrics."
                                      "enum" = [
                                        "ALL_METRICS",
                                        "REQUEST_COUNT",
                                        "REQUEST_DURATION",
                                        "REQUEST_SIZE",
                                        "RESPONSE_SIZE",
                                        "TCP_OPENED_CONNECTIONS",
                                        "TCP_CLOSED_CONNECTIONS",
                                        "TCP_SENT_BYTES",
                                        "TCP_RECEIVED_BYTES",
                                        "GRPC_REQUEST_MESSAGES",
                                        "GRPC_RESPONSE_MESSAGES",
                                      ]
                                      "type" = "string"
                                    }
                                    "mode" = {
                                      "description" = "Controls which mode of metrics generation is selected: CLIENT and/or SERVER."
                                      "enum" = [
                                        "CLIENT_AND_SERVER",
                                        "CLIENT",
                                        "SERVER",
                                      ]
                                      "type" = "string"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "tagOverrides" = {
                                  "additionalProperties" = {
                                    "properties" = {
                                      "operation" = {
                                        "description" = "Operation controls whether or not to update/add a tag, or to remove it."
                                        "enum" = [
                                          "UPSERT",
                                          "REMOVE",
                                        ]
                                        "type" = "string"
                                      }
                                      "value" = {
                                        "description" = "Value is only considered if the operation is `UPSERT`."
                                        "type" = "string"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "description" = "Optional."
                                  "type" = "object"
                                }
                              }
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "providers" = {
                            "description" = "Optional."
                            "items" = {
                              "properties" = {
                                "name" = {
                                  "description" = "Required."
                                  "type" = "string"
                                }
                              }
                              "required" = [
                                "name",
                              ]
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "reportingInterval" = {
                            "description" = "Optional."
                            "type" = "string"
                          }
                        }
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "selector" = {
                      "description" = "Optional."
                      "properties" = {
                        "matchLabels" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "description" = "One or more labels that indicate a specific set of pods/VMs on which a policy should be applied."
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                    "targetRef" = {
                      "description" = "Optional."
                      "properties" = {
                        "group" = {
                          "description" = "group is the group of the target resource."
                          "type" = "string"
                        }
                        "kind" = {
                          "description" = "kind is kind of the target resource."
                          "type" = "string"
                        }
                        "name" = {
                          "description" = "name is the name of the target resource."
                          "type" = "string"
                        }
                        "namespace" = {
                          "description" = "namespace is the namespace of the referent."
                          "type" = "string"
                        }
                      }
                      "type" = "object"
                    }
                    "tracing" = {
                      "description" = "Optional."
                      "items" = {
                        "properties" = {
                          "customTags" = {
                            "additionalProperties" = {
                              "oneOf" = [
                                {
                                  "not" = {
                                    "anyOf" = [
                                      {
                                        "required" = [
                                          "literal",
                                        ]
                                      },
                                      {
                                        "required" = [
                                          "environment",
                                        ]
                                      },
                                      {
                                        "required" = [
                                          "header",
                                        ]
                                      },
                                    ]
                                  }
                                },
                                {
                                  "required" = [
                                    "literal",
                                  ]
                                },
                                {
                                  "required" = [
                                    "environment",
                                  ]
                                },
                                {
                                  "required" = [
                                    "header",
                                  ]
                                },
                              ]
                              "properties" = {
                                "environment" = {
                                  "description" = "Environment adds the value of an environment variable to each span."
                                  "properties" = {
                                    "defaultValue" = {
                                      "description" = "Optional."
                                      "type" = "string"
                                    }
                                    "name" = {
                                      "description" = "Name of the environment variable from which to extract the tag value."
                                      "type" = "string"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "header" = {
                                  "description" = "RequestHeader adds the value of an header from the request to each span."
                                  "properties" = {
                                    "defaultValue" = {
                                      "description" = "Optional."
                                      "type" = "string"
                                    }
                                    "name" = {
                                      "description" = "Name of the header from which to extract the tag value."
                                      "type" = "string"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "literal" = {
                                  "description" = "Literal adds the same, hard-coded value to each span."
                                  "properties" = {
                                    "value" = {
                                      "description" = "The tag value to use."
                                      "type" = "string"
                                    }
                                  }
                                  "type" = "object"
                                }
                              }
                              "type" = "object"
                            }
                            "description" = "Optional."
                            "type" = "object"
                          }
                          "disableSpanReporting" = {
                            "description" = "Controls span reporting."
                            "nullable" = true
                            "type" = "boolean"
                          }
                          "match" = {
                            "description" = "Allows tailoring of behavior to specific conditions."
                            "properties" = {
                              "mode" = {
                                "description" = "This determines whether or not to apply the tracing configuration based on the direction of traffic relative to the proxied workload."
                                "enum" = [
                                  "CLIENT_AND_SERVER",
                                  "CLIENT",
                                  "SERVER",
                                ]
                                "type" = "string"
                              }
                            }
                            "type" = "object"
                          }
                          "providers" = {
                            "description" = "Optional."
                            "items" = {
                              "properties" = {
                                "name" = {
                                  "description" = "Required."
                                  "type" = "string"
                                }
                              }
                              "required" = [
                                "name",
                              ]
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "randomSamplingPercentage" = {
                            "description" = "Controls the rate at which traffic will be selected for tracing if no prior sampling decision has been made."
                            "nullable" = true
                            "type" = "number"
                          }
                          "useRequestIdForTraceSampling" = {
                            "nullable" = true
                            "type" = "boolean"
                          }
                        }
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                  }
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = true
          "subresources" = {
            "status" = {}
          }
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "customresourcedefinition_virtualservices_networking_istio_io" {
  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "annotations" = {
        "helm.sh/resource-policy" = "keep"
      }
      "labels" = {
        "app" = "istio-pilot"
        "chart" = "istio"
        "heritage" = "Tiller"
        "release" = "istio"
      }
      "name" = "virtualservices.networking.istio.io"
    }
    "spec" = {
      "group" = "networking.istio.io"
      "names" = {
        "categories" = [
          "istio-io",
          "networking-istio-io",
        ]
        "kind" = "VirtualService"
        "listKind" = "VirtualServiceList"
        "plural" = "virtualservices"
        "shortNames" = [
          "vs",
        ]
        "singular" = "virtualservice"
      }
      "scope" = "Namespaced"
      "versions" = [
        {
          "additionalPrinterColumns" = [
            {
              "description" = "The names of gateways and sidecars that should apply these routes"
              "jsonPath" = ".spec.gateways"
              "name" = "Gateways"
              "type" = "string"
            },
            {
              "description" = "The destination hosts to which traffic is being sent"
              "jsonPath" = ".spec.hosts"
              "name" = "Hosts"
              "type" = "string"
            },
            {
              "description" = "CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC. Populated by the system. Read-only. Null for lists. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata"
              "jsonPath" = ".metadata.creationTimestamp"
              "name" = "Age"
              "type" = "date"
            },
          ]
          "name" = "v1alpha3"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Configuration affecting label/content routing, sni routing, etc. See more details at: https://istio.io/docs/reference/config/networking/virtual-service.html"
                  "properties" = {
                    "exportTo" = {
                      "description" = "A list of namespaces to which this virtual service is exported."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "gateways" = {
                      "description" = "The names of gateways and sidecars that should apply these routes."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "hosts" = {
                      "description" = "The destination hosts to which traffic is being sent."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "http" = {
                      "description" = "An ordered list of route rules for HTTP traffic."
                      "items" = {
                        "properties" = {
                          "corsPolicy" = {
                            "description" = "Cross-Origin Resource Sharing policy (CORS)."
                            "properties" = {
                              "allowCredentials" = {
                                "description" = "Indicates whether the caller is allowed to send the actual request (not the preflight) using credentials."
                                "nullable" = true
                                "type" = "boolean"
                              }
                              "allowHeaders" = {
                                "description" = "List of HTTP headers that can be used when requesting the resource."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                              "allowMethods" = {
                                "description" = "List of HTTP methods allowed to access the resource."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                              "allowOrigin" = {
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                              "allowOrigins" = {
                                "description" = "String patterns that match allowed origins."
                                "items" = {
                                  "oneOf" = [
                                    {
                                      "not" = {
                                        "anyOf" = [
                                          {
                                            "required" = [
                                              "exact",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "prefix",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "regex",
                                            ]
                                          },
                                        ]
                                      }
                                    },
                                    {
                                      "required" = [
                                        "exact",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "prefix",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "regex",
                                      ]
                                    },
                                  ]
                                  "properties" = {
                                    "exact" = {
                                      "type" = "string"
                                    }
                                    "prefix" = {
                                      "type" = "string"
                                    }
                                    "regex" = {
                                      "description" = "RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                      "type" = "string"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "type" = "array"
                              }
                              "exposeHeaders" = {
                                "description" = "A list of HTTP headers that the browsers are allowed to access."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                              "maxAge" = {
                                "description" = "Specifies how long the results of a preflight request can be cached."
                                "type" = "string"
                              }
                            }
                            "type" = "object"
                          }
                          "delegate" = {
                            "description" = "Delegate is used to specify the particular VirtualService which can be used to define delegate HTTPRoute."
                            "properties" = {
                              "name" = {
                                "description" = "Name specifies the name of the delegate VirtualService."
                                "type" = "string"
                              }
                              "namespace" = {
                                "description" = "Namespace specifies the namespace where the delegate VirtualService resides."
                                "type" = "string"
                              }
                            }
                            "type" = "object"
                          }
                          "directResponse" = {
                            "description" = "A HTTP rule can either return a direct_response, redirect or forward (default) traffic."
                            "properties" = {
                              "body" = {
                                "description" = "Specifies the content of the response body."
                                "oneOf" = [
                                  {
                                    "not" = {
                                      "anyOf" = [
                                        {
                                          "required" = [
                                            "string",
                                          ]
                                        },
                                        {
                                          "required" = [
                                            "bytes",
                                          ]
                                        },
                                      ]
                                    }
                                  },
                                  {
                                    "required" = [
                                      "string",
                                    ]
                                  },
                                  {
                                    "required" = [
                                      "bytes",
                                    ]
                                  },
                                ]
                                "properties" = {
                                  "bytes" = {
                                    "description" = "response body as base64 encoded bytes."
                                    "format" = "binary"
                                    "type" = "string"
                                  }
                                  "string" = {
                                    "type" = "string"
                                  }
                                }
                                "type" = "object"
                              }
                              "status" = {
                                "description" = "Specifies the HTTP response status to be returned."
                                "type" = "integer"
                              }
                            }
                            "required" = [
                              "status",
                            ]
                            "type" = "object"
                          }
                          "fault" = {
                            "description" = "Fault injection policy to apply on HTTP traffic at the client side."
                            "properties" = {
                              "abort" = {
                                "description" = "Abort Http request attempts and return error codes back to downstream service, giving the impression that the upstream service is faulty."
                                "oneOf" = [
                                  {
                                    "not" = {
                                      "anyOf" = [
                                        {
                                          "required" = [
                                            "httpStatus",
                                          ]
                                        },
                                        {
                                          "required" = [
                                            "grpcStatus",
                                          ]
                                        },
                                        {
                                          "required" = [
                                            "http2Error",
                                          ]
                                        },
                                      ]
                                    }
                                  },
                                  {
                                    "required" = [
                                      "httpStatus",
                                    ]
                                  },
                                  {
                                    "required" = [
                                      "grpcStatus",
                                    ]
                                  },
                                  {
                                    "required" = [
                                      "http2Error",
                                    ]
                                  },
                                ]
                                "properties" = {
                                  "grpcStatus" = {
                                    "description" = "GRPC status code to use to abort the request."
                                    "type" = "string"
                                  }
                                  "http2Error" = {
                                    "type" = "string"
                                  }
                                  "httpStatus" = {
                                    "description" = "HTTP status code to use to abort the Http request."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "percentage" = {
                                    "description" = "Percentage of requests to be aborted with the error code provided."
                                    "properties" = {
                                      "value" = {
                                        "format" = "double"
                                        "type" = "number"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                }
                                "type" = "object"
                              }
                              "delay" = {
                                "description" = "Delay requests before forwarding, emulating various failures such as network issues, overloaded upstream service, etc."
                                "oneOf" = [
                                  {
                                    "not" = {
                                      "anyOf" = [
                                        {
                                          "required" = [
                                            "fixedDelay",
                                          ]
                                        },
                                        {
                                          "required" = [
                                            "exponentialDelay",
                                          ]
                                        },
                                      ]
                                    }
                                  },
                                  {
                                    "required" = [
                                      "fixedDelay",
                                    ]
                                  },
                                  {
                                    "required" = [
                                      "exponentialDelay",
                                    ]
                                  },
                                ]
                                "properties" = {
                                  "exponentialDelay" = {
                                    "type" = "string"
                                  }
                                  "fixedDelay" = {
                                    "description" = "Add a fixed delay before forwarding the request."
                                    "type" = "string"
                                  }
                                  "percent" = {
                                    "description" = "Percentage of requests on which the delay will be injected (0-100)."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "percentage" = {
                                    "description" = "Percentage of requests on which the delay will be injected."
                                    "properties" = {
                                      "value" = {
                                        "format" = "double"
                                        "type" = "number"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                }
                                "type" = "object"
                              }
                            }
                            "type" = "object"
                          }
                          "headers" = {
                            "properties" = {
                              "request" = {
                                "properties" = {
                                  "add" = {
                                    "additionalProperties" = {
                                      "type" = "string"
                                    }
                                    "type" = "object"
                                  }
                                  "remove" = {
                                    "items" = {
                                      "type" = "string"
                                    }
                                    "type" = "array"
                                  }
                                  "set" = {
                                    "additionalProperties" = {
                                      "type" = "string"
                                    }
                                    "type" = "object"
                                  }
                                }
                                "type" = "object"
                              }
                              "response" = {
                                "properties" = {
                                  "add" = {
                                    "additionalProperties" = {
                                      "type" = "string"
                                    }
                                    "type" = "object"
                                  }
                                  "remove" = {
                                    "items" = {
                                      "type" = "string"
                                    }
                                    "type" = "array"
                                  }
                                  "set" = {
                                    "additionalProperties" = {
                                      "type" = "string"
                                    }
                                    "type" = "object"
                                  }
                                }
                                "type" = "object"
                              }
                            }
                            "type" = "object"
                          }
                          "match" = {
                            "description" = "Match conditions to be satisfied for the rule to be activated."
                            "items" = {
                              "properties" = {
                                "authority" = {
                                  "description" = "HTTP Authority values are case-sensitive and formatted as follows: - `exact: \"value\"` for exact string match - `prefix: \"value\"` for prefix-based match - `regex: \"value\"` for RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                  "oneOf" = [
                                    {
                                      "not" = {
                                        "anyOf" = [
                                          {
                                            "required" = [
                                              "exact",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "prefix",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "regex",
                                            ]
                                          },
                                        ]
                                      }
                                    },
                                    {
                                      "required" = [
                                        "exact",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "prefix",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "regex",
                                      ]
                                    },
                                  ]
                                  "properties" = {
                                    "exact" = {
                                      "type" = "string"
                                    }
                                    "prefix" = {
                                      "type" = "string"
                                    }
                                    "regex" = {
                                      "description" = "RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                      "type" = "string"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "gateways" = {
                                  "description" = "Names of gateways where the rule should be applied."
                                  "items" = {
                                    "type" = "string"
                                  }
                                  "type" = "array"
                                }
                                "headers" = {
                                  "additionalProperties" = {
                                    "oneOf" = [
                                      {
                                        "not" = {
                                          "anyOf" = [
                                            {
                                              "required" = [
                                                "exact",
                                              ]
                                            },
                                            {
                                              "required" = [
                                                "prefix",
                                              ]
                                            },
                                            {
                                              "required" = [
                                                "regex",
                                              ]
                                            },
                                          ]
                                        }
                                      },
                                      {
                                        "required" = [
                                          "exact",
                                        ]
                                      },
                                      {
                                        "required" = [
                                          "prefix",
                                        ]
                                      },
                                      {
                                        "required" = [
                                          "regex",
                                        ]
                                      },
                                    ]
                                    "properties" = {
                                      "exact" = {
                                        "type" = "string"
                                      }
                                      "prefix" = {
                                        "type" = "string"
                                      }
                                      "regex" = {
                                        "description" = "RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                        "type" = "string"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "description" = "The header keys must be lowercase and use hyphen as the separator, e.g."
                                  "type" = "object"
                                }
                                "ignoreUriCase" = {
                                  "description" = "Flag to specify whether the URI matching should be case-insensitive."
                                  "type" = "boolean"
                                }
                                "method" = {
                                  "description" = "HTTP Method values are case-sensitive and formatted as follows: - `exact: \"value\"` for exact string match - `prefix: \"value\"` for prefix-based match - `regex: \"value\"` for RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                  "oneOf" = [
                                    {
                                      "not" = {
                                        "anyOf" = [
                                          {
                                            "required" = [
                                              "exact",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "prefix",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "regex",
                                            ]
                                          },
                                        ]
                                      }
                                    },
                                    {
                                      "required" = [
                                        "exact",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "prefix",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "regex",
                                      ]
                                    },
                                  ]
                                  "properties" = {
                                    "exact" = {
                                      "type" = "string"
                                    }
                                    "prefix" = {
                                      "type" = "string"
                                    }
                                    "regex" = {
                                      "description" = "RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                      "type" = "string"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "name" = {
                                  "description" = "The name assigned to a match."
                                  "type" = "string"
                                }
                                "port" = {
                                  "description" = "Specifies the ports on the host that is being addressed."
                                  "type" = "integer"
                                }
                                "queryParams" = {
                                  "additionalProperties" = {
                                    "oneOf" = [
                                      {
                                        "not" = {
                                          "anyOf" = [
                                            {
                                              "required" = [
                                                "exact",
                                              ]
                                            },
                                            {
                                              "required" = [
                                                "prefix",
                                              ]
                                            },
                                            {
                                              "required" = [
                                                "regex",
                                              ]
                                            },
                                          ]
                                        }
                                      },
                                      {
                                        "required" = [
                                          "exact",
                                        ]
                                      },
                                      {
                                        "required" = [
                                          "prefix",
                                        ]
                                      },
                                      {
                                        "required" = [
                                          "regex",
                                        ]
                                      },
                                    ]
                                    "properties" = {
                                      "exact" = {
                                        "type" = "string"
                                      }
                                      "prefix" = {
                                        "type" = "string"
                                      }
                                      "regex" = {
                                        "description" = "RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                        "type" = "string"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "description" = "Query parameters for matching."
                                  "type" = "object"
                                }
                                "scheme" = {
                                  "description" = "URI Scheme values are case-sensitive and formatted as follows: - `exact: \"value\"` for exact string match - `prefix: \"value\"` for prefix-based match - `regex: \"value\"` for RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                  "oneOf" = [
                                    {
                                      "not" = {
                                        "anyOf" = [
                                          {
                                            "required" = [
                                              "exact",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "prefix",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "regex",
                                            ]
                                          },
                                        ]
                                      }
                                    },
                                    {
                                      "required" = [
                                        "exact",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "prefix",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "regex",
                                      ]
                                    },
                                  ]
                                  "properties" = {
                                    "exact" = {
                                      "type" = "string"
                                    }
                                    "prefix" = {
                                      "type" = "string"
                                    }
                                    "regex" = {
                                      "description" = "RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                      "type" = "string"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "sourceLabels" = {
                                  "additionalProperties" = {
                                    "type" = "string"
                                  }
                                  "description" = "One or more labels that constrain the applicability of a rule to source (client) workloads with the given labels."
                                  "type" = "object"
                                }
                                "sourceNamespace" = {
                                  "description" = "Source namespace constraining the applicability of a rule to workloads in that namespace."
                                  "type" = "string"
                                }
                                "statPrefix" = {
                                  "description" = "The human readable prefix to use when emitting statistics for this route."
                                  "type" = "string"
                                }
                                "uri" = {
                                  "description" = "URI to match values are case-sensitive and formatted as follows: - `exact: \"value\"` for exact string match - `prefix: \"value\"` for prefix-based match - `regex: \"value\"` for RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                  "oneOf" = [
                                    {
                                      "not" = {
                                        "anyOf" = [
                                          {
                                            "required" = [
                                              "exact",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "prefix",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "regex",
                                            ]
                                          },
                                        ]
                                      }
                                    },
                                    {
                                      "required" = [
                                        "exact",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "prefix",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "regex",
                                      ]
                                    },
                                  ]
                                  "properties" = {
                                    "exact" = {
                                      "type" = "string"
                                    }
                                    "prefix" = {
                                      "type" = "string"
                                    }
                                    "regex" = {
                                      "description" = "RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                      "type" = "string"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "withoutHeaders" = {
                                  "additionalProperties" = {
                                    "oneOf" = [
                                      {
                                        "not" = {
                                          "anyOf" = [
                                            {
                                              "required" = [
                                                "exact",
                                              ]
                                            },
                                            {
                                              "required" = [
                                                "prefix",
                                              ]
                                            },
                                            {
                                              "required" = [
                                                "regex",
                                              ]
                                            },
                                          ]
                                        }
                                      },
                                      {
                                        "required" = [
                                          "exact",
                                        ]
                                      },
                                      {
                                        "required" = [
                                          "prefix",
                                        ]
                                      },
                                      {
                                        "required" = [
                                          "regex",
                                        ]
                                      },
                                    ]
                                    "properties" = {
                                      "exact" = {
                                        "type" = "string"
                                      }
                                      "prefix" = {
                                        "type" = "string"
                                      }
                                      "regex" = {
                                        "description" = "RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                        "type" = "string"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "description" = "withoutHeader has the same syntax with the header, but has opposite meaning."
                                  "type" = "object"
                                }
                              }
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "mirror" = {
                            "description" = "Mirror HTTP traffic to a another destination in addition to forwarding the requests to the intended destination."
                            "properties" = {
                              "host" = {
                                "description" = "The name of a service from the service registry."
                                "type" = "string"
                              }
                              "port" = {
                                "description" = "Specifies the port on the host that is being addressed."
                                "properties" = {
                                  "number" = {
                                    "type" = "integer"
                                  }
                                }
                                "type" = "object"
                              }
                              "subset" = {
                                "description" = "The name of a subset within the service."
                                "type" = "string"
                              }
                            }
                            "required" = [
                              "host",
                            ]
                            "type" = "object"
                          }
                          "mirrorPercent" = {
                            "nullable" = true
                            "type" = "integer"
                          }
                          "mirrorPercentage" = {
                            "description" = "Percentage of the traffic to be mirrored by the `mirror` field."
                            "properties" = {
                              "value" = {
                                "format" = "double"
                                "type" = "number"
                              }
                            }
                            "type" = "object"
                          }
                          "mirror_percent" = {
                            "nullable" = true
                            "type" = "integer"
                          }
                          "mirrors" = {
                            "description" = "Specifies the destinations to mirror HTTP traffic in addition to the original destination."
                            "items" = {
                              "properties" = {
                                "destination" = {
                                  "description" = "Destination specifies the target of the mirror operation."
                                  "properties" = {
                                    "host" = {
                                      "description" = "The name of a service from the service registry."
                                      "type" = "string"
                                    }
                                    "port" = {
                                      "description" = "Specifies the port on the host that is being addressed."
                                      "properties" = {
                                        "number" = {
                                          "type" = "integer"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "subset" = {
                                      "description" = "The name of a subset within the service."
                                      "type" = "string"
                                    }
                                  }
                                  "required" = [
                                    "host",
                                  ]
                                  "type" = "object"
                                }
                                "percentage" = {
                                  "description" = "Percentage of the traffic to be mirrored by the `destination` field."
                                  "properties" = {
                                    "value" = {
                                      "format" = "double"
                                      "type" = "number"
                                    }
                                  }
                                  "type" = "object"
                                }
                              }
                              "required" = [
                                "destination",
                              ]
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "name" = {
                            "description" = "The name assigned to the route for debugging purposes."
                            "type" = "string"
                          }
                          "redirect" = {
                            "description" = "A HTTP rule can either return a direct_response, redirect or forward (default) traffic."
                            "oneOf" = [
                              {
                                "not" = {
                                  "anyOf" = [
                                    {
                                      "required" = [
                                        "port",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "derivePort",
                                      ]
                                    },
                                  ]
                                }
                              },
                              {
                                "required" = [
                                  "port",
                                ]
                              },
                              {
                                "required" = [
                                  "derivePort",
                                ]
                              },
                            ]
                            "properties" = {
                              "authority" = {
                                "description" = "On a redirect, overwrite the Authority/Host portion of the URL with this value."
                                "type" = "string"
                              }
                              "derivePort" = {
                                "description" = "On a redirect, dynamically set the port: * FROM_PROTOCOL_DEFAULT: automatically set to 80 for HTTP and 443 for HTTPS."
                                "enum" = [
                                  "FROM_PROTOCOL_DEFAULT",
                                  "FROM_REQUEST_PORT",
                                ]
                                "type" = "string"
                              }
                              "port" = {
                                "description" = "On a redirect, overwrite the port portion of the URL with this value."
                                "type" = "integer"
                              }
                              "redirectCode" = {
                                "description" = "On a redirect, Specifies the HTTP status code to use in the redirect response."
                                "type" = "integer"
                              }
                              "scheme" = {
                                "description" = "On a redirect, overwrite the scheme portion of the URL with this value."
                                "type" = "string"
                              }
                              "uri" = {
                                "description" = "On a redirect, overwrite the Path portion of the URL with this value."
                                "type" = "string"
                              }
                            }
                            "type" = "object"
                          }
                          "retries" = {
                            "description" = "Retry policy for HTTP requests."
                            "properties" = {
                              "attempts" = {
                                "description" = "Number of retries to be allowed for a given request."
                                "format" = "int32"
                                "type" = "integer"
                              }
                              "perTryTimeout" = {
                                "description" = "Timeout per attempt for a given request, including the initial call and any retries."
                                "type" = "string"
                              }
                              "retryOn" = {
                                "description" = "Specifies the conditions under which retry takes place."
                                "type" = "string"
                              }
                              "retryRemoteLocalities" = {
                                "description" = "Flag to specify whether the retries should retry to other localities."
                                "nullable" = true
                                "type" = "boolean"
                              }
                            }
                            "type" = "object"
                          }
                          "rewrite" = {
                            "description" = "Rewrite HTTP URIs and Authority headers."
                            "properties" = {
                              "authority" = {
                                "description" = "rewrite the Authority/Host header with this value."
                                "type" = "string"
                              }
                              "uri" = {
                                "description" = "rewrite the path (or the prefix) portion of the URI with this value."
                                "type" = "string"
                              }
                              "uriRegexRewrite" = {
                                "description" = "rewrite the path portion of the URI with the specified regex."
                                "properties" = {
                                  "match" = {
                                    "description" = "RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                    "type" = "string"
                                  }
                                  "rewrite" = {
                                    "description" = "The string that should replace into matching portions of original URI."
                                    "type" = "string"
                                  }
                                }
                                "type" = "object"
                              }
                            }
                            "type" = "object"
                          }
                          "route" = {
                            "description" = "A HTTP rule can either return a direct_response, redirect or forward (default) traffic."
                            "items" = {
                              "properties" = {
                                "destination" = {
                                  "description" = "Destination uniquely identifies the instances of a service to which the request/connection should be forwarded to."
                                  "properties" = {
                                    "host" = {
                                      "description" = "The name of a service from the service registry."
                                      "type" = "string"
                                    }
                                    "port" = {
                                      "description" = "Specifies the port on the host that is being addressed."
                                      "properties" = {
                                        "number" = {
                                          "type" = "integer"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "subset" = {
                                      "description" = "The name of a subset within the service."
                                      "type" = "string"
                                    }
                                  }
                                  "required" = [
                                    "host",
                                  ]
                                  "type" = "object"
                                }
                                "headers" = {
                                  "properties" = {
                                    "request" = {
                                      "properties" = {
                                        "add" = {
                                          "additionalProperties" = {
                                            "type" = "string"
                                          }
                                          "type" = "object"
                                        }
                                        "remove" = {
                                          "items" = {
                                            "type" = "string"
                                          }
                                          "type" = "array"
                                        }
                                        "set" = {
                                          "additionalProperties" = {
                                            "type" = "string"
                                          }
                                          "type" = "object"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "response" = {
                                      "properties" = {
                                        "add" = {
                                          "additionalProperties" = {
                                            "type" = "string"
                                          }
                                          "type" = "object"
                                        }
                                        "remove" = {
                                          "items" = {
                                            "type" = "string"
                                          }
                                          "type" = "array"
                                        }
                                        "set" = {
                                          "additionalProperties" = {
                                            "type" = "string"
                                          }
                                          "type" = "object"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "weight" = {
                                  "description" = "Weight specifies the relative proportion of traffic to be forwarded to the destination."
                                  "format" = "int32"
                                  "type" = "integer"
                                }
                              }
                              "required" = [
                                "destination",
                              ]
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "timeout" = {
                            "description" = "Timeout for HTTP requests, default is disabled."
                            "type" = "string"
                          }
                        }
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "tcp" = {
                      "description" = "An ordered list of route rules for opaque TCP traffic."
                      "items" = {
                        "properties" = {
                          "match" = {
                            "description" = "Match conditions to be satisfied for the rule to be activated."
                            "items" = {
                              "properties" = {
                                "destinationSubnets" = {
                                  "description" = "IPv4 or IPv6 ip addresses of destination with optional subnet."
                                  "items" = {
                                    "type" = "string"
                                  }
                                  "type" = "array"
                                }
                                "gateways" = {
                                  "description" = "Names of gateways where the rule should be applied."
                                  "items" = {
                                    "type" = "string"
                                  }
                                  "type" = "array"
                                }
                                "port" = {
                                  "description" = "Specifies the port on the host that is being addressed."
                                  "type" = "integer"
                                }
                                "sourceLabels" = {
                                  "additionalProperties" = {
                                    "type" = "string"
                                  }
                                  "description" = "One or more labels that constrain the applicability of a rule to workloads with the given labels."
                                  "type" = "object"
                                }
                                "sourceNamespace" = {
                                  "description" = "Source namespace constraining the applicability of a rule to workloads in that namespace."
                                  "type" = "string"
                                }
                                "sourceSubnet" = {
                                  "type" = "string"
                                }
                              }
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "route" = {
                            "description" = "The destination to which the connection should be forwarded to."
                            "items" = {
                              "properties" = {
                                "destination" = {
                                  "description" = "Destination uniquely identifies the instances of a service to which the request/connection should be forwarded to."
                                  "properties" = {
                                    "host" = {
                                      "description" = "The name of a service from the service registry."
                                      "type" = "string"
                                    }
                                    "port" = {
                                      "description" = "Specifies the port on the host that is being addressed."
                                      "properties" = {
                                        "number" = {
                                          "type" = "integer"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "subset" = {
                                      "description" = "The name of a subset within the service."
                                      "type" = "string"
                                    }
                                  }
                                  "required" = [
                                    "host",
                                  ]
                                  "type" = "object"
                                }
                                "weight" = {
                                  "description" = "Weight specifies the relative proportion of traffic to be forwarded to the destination."
                                  "format" = "int32"
                                  "type" = "integer"
                                }
                              }
                              "required" = [
                                "destination",
                              ]
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                        }
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "tls" = {
                      "description" = "An ordered list of route rule for non-terminated TLS & HTTPS traffic."
                      "items" = {
                        "properties" = {
                          "match" = {
                            "description" = "Match conditions to be satisfied for the rule to be activated."
                            "items" = {
                              "properties" = {
                                "destinationSubnets" = {
                                  "description" = "IPv4 or IPv6 ip addresses of destination with optional subnet."
                                  "items" = {
                                    "type" = "string"
                                  }
                                  "type" = "array"
                                }
                                "gateways" = {
                                  "description" = "Names of gateways where the rule should be applied."
                                  "items" = {
                                    "type" = "string"
                                  }
                                  "type" = "array"
                                }
                                "port" = {
                                  "description" = "Specifies the port on the host that is being addressed."
                                  "type" = "integer"
                                }
                                "sniHosts" = {
                                  "description" = "SNI (server name indicator) to match on."
                                  "items" = {
                                    "type" = "string"
                                  }
                                  "type" = "array"
                                }
                                "sourceLabels" = {
                                  "additionalProperties" = {
                                    "type" = "string"
                                  }
                                  "description" = "One or more labels that constrain the applicability of a rule to workloads with the given labels."
                                  "type" = "object"
                                }
                                "sourceNamespace" = {
                                  "description" = "Source namespace constraining the applicability of a rule to workloads in that namespace."
                                  "type" = "string"
                                }
                              }
                              "required" = [
                                "sniHosts",
                              ]
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "route" = {
                            "description" = "The destination to which the connection should be forwarded to."
                            "items" = {
                              "properties" = {
                                "destination" = {
                                  "description" = "Destination uniquely identifies the instances of a service to which the request/connection should be forwarded to."
                                  "properties" = {
                                    "host" = {
                                      "description" = "The name of a service from the service registry."
                                      "type" = "string"
                                    }
                                    "port" = {
                                      "description" = "Specifies the port on the host that is being addressed."
                                      "properties" = {
                                        "number" = {
                                          "type" = "integer"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "subset" = {
                                      "description" = "The name of a subset within the service."
                                      "type" = "string"
                                    }
                                  }
                                  "required" = [
                                    "host",
                                  ]
                                  "type" = "object"
                                }
                                "weight" = {
                                  "description" = "Weight specifies the relative proportion of traffic to be forwarded to the destination."
                                  "format" = "int32"
                                  "type" = "integer"
                                }
                              }
                              "required" = [
                                "destination",
                              ]
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                        }
                        "required" = [
                          "match",
                        ]
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                  }
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = true
          "subresources" = {
            "status" = {}
          }
        },
        {
          "additionalPrinterColumns" = [
            {
              "description" = "The names of gateways and sidecars that should apply these routes"
              "jsonPath" = ".spec.gateways"
              "name" = "Gateways"
              "type" = "string"
            },
            {
              "description" = "The destination hosts to which traffic is being sent"
              "jsonPath" = ".spec.hosts"
              "name" = "Hosts"
              "type" = "string"
            },
            {
              "description" = "CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC. Populated by the system. Read-only. Null for lists. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata"
              "jsonPath" = ".metadata.creationTimestamp"
              "name" = "Age"
              "type" = "date"
            },
          ]
          "name" = "v1beta1"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Configuration affecting label/content routing, sni routing, etc. See more details at: https://istio.io/docs/reference/config/networking/virtual-service.html"
                  "properties" = {
                    "exportTo" = {
                      "description" = "A list of namespaces to which this virtual service is exported."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "gateways" = {
                      "description" = "The names of gateways and sidecars that should apply these routes."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "hosts" = {
                      "description" = "The destination hosts to which traffic is being sent."
                      "items" = {
                        "type" = "string"
                      }
                      "type" = "array"
                    }
                    "http" = {
                      "description" = "An ordered list of route rules for HTTP traffic."
                      "items" = {
                        "properties" = {
                          "corsPolicy" = {
                            "description" = "Cross-Origin Resource Sharing policy (CORS)."
                            "properties" = {
                              "allowCredentials" = {
                                "description" = "Indicates whether the caller is allowed to send the actual request (not the preflight) using credentials."
                                "nullable" = true
                                "type" = "boolean"
                              }
                              "allowHeaders" = {
                                "description" = "List of HTTP headers that can be used when requesting the resource."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                              "allowMethods" = {
                                "description" = "List of HTTP methods allowed to access the resource."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                              "allowOrigin" = {
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                              "allowOrigins" = {
                                "description" = "String patterns that match allowed origins."
                                "items" = {
                                  "oneOf" = [
                                    {
                                      "not" = {
                                        "anyOf" = [
                                          {
                                            "required" = [
                                              "exact",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "prefix",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "regex",
                                            ]
                                          },
                                        ]
                                      }
                                    },
                                    {
                                      "required" = [
                                        "exact",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "prefix",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "regex",
                                      ]
                                    },
                                  ]
                                  "properties" = {
                                    "exact" = {
                                      "type" = "string"
                                    }
                                    "prefix" = {
                                      "type" = "string"
                                    }
                                    "regex" = {
                                      "description" = "RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                      "type" = "string"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "type" = "array"
                              }
                              "exposeHeaders" = {
                                "description" = "A list of HTTP headers that the browsers are allowed to access."
                                "items" = {
                                  "type" = "string"
                                }
                                "type" = "array"
                              }
                              "maxAge" = {
                                "description" = "Specifies how long the results of a preflight request can be cached."
                                "type" = "string"
                              }
                            }
                            "type" = "object"
                          }
                          "delegate" = {
                            "description" = "Delegate is used to specify the particular VirtualService which can be used to define delegate HTTPRoute."
                            "properties" = {
                              "name" = {
                                "description" = "Name specifies the name of the delegate VirtualService."
                                "type" = "string"
                              }
                              "namespace" = {
                                "description" = "Namespace specifies the namespace where the delegate VirtualService resides."
                                "type" = "string"
                              }
                            }
                            "type" = "object"
                          }
                          "directResponse" = {
                            "description" = "A HTTP rule can either return a direct_response, redirect or forward (default) traffic."
                            "properties" = {
                              "body" = {
                                "description" = "Specifies the content of the response body."
                                "oneOf" = [
                                  {
                                    "not" = {
                                      "anyOf" = [
                                        {
                                          "required" = [
                                            "string",
                                          ]
                                        },
                                        {
                                          "required" = [
                                            "bytes",
                                          ]
                                        },
                                      ]
                                    }
                                  },
                                  {
                                    "required" = [
                                      "string",
                                    ]
                                  },
                                  {
                                    "required" = [
                                      "bytes",
                                    ]
                                  },
                                ]
                                "properties" = {
                                  "bytes" = {
                                    "description" = "response body as base64 encoded bytes."
                                    "format" = "binary"
                                    "type" = "string"
                                  }
                                  "string" = {
                                    "type" = "string"
                                  }
                                }
                                "type" = "object"
                              }
                              "status" = {
                                "description" = "Specifies the HTTP response status to be returned."
                                "type" = "integer"
                              }
                            }
                            "required" = [
                              "status",
                            ]
                            "type" = "object"
                          }
                          "fault" = {
                            "description" = "Fault injection policy to apply on HTTP traffic at the client side."
                            "properties" = {
                              "abort" = {
                                "description" = "Abort Http request attempts and return error codes back to downstream service, giving the impression that the upstream service is faulty."
                                "oneOf" = [
                                  {
                                    "not" = {
                                      "anyOf" = [
                                        {
                                          "required" = [
                                            "httpStatus",
                                          ]
                                        },
                                        {
                                          "required" = [
                                            "grpcStatus",
                                          ]
                                        },
                                        {
                                          "required" = [
                                            "http2Error",
                                          ]
                                        },
                                      ]
                                    }
                                  },
                                  {
                                    "required" = [
                                      "httpStatus",
                                    ]
                                  },
                                  {
                                    "required" = [
                                      "grpcStatus",
                                    ]
                                  },
                                  {
                                    "required" = [
                                      "http2Error",
                                    ]
                                  },
                                ]
                                "properties" = {
                                  "grpcStatus" = {
                                    "description" = "GRPC status code to use to abort the request."
                                    "type" = "string"
                                  }
                                  "http2Error" = {
                                    "type" = "string"
                                  }
                                  "httpStatus" = {
                                    "description" = "HTTP status code to use to abort the Http request."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "percentage" = {
                                    "description" = "Percentage of requests to be aborted with the error code provided."
                                    "properties" = {
                                      "value" = {
                                        "format" = "double"
                                        "type" = "number"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                }
                                "type" = "object"
                              }
                              "delay" = {
                                "description" = "Delay requests before forwarding, emulating various failures such as network issues, overloaded upstream service, etc."
                                "oneOf" = [
                                  {
                                    "not" = {
                                      "anyOf" = [
                                        {
                                          "required" = [
                                            "fixedDelay",
                                          ]
                                        },
                                        {
                                          "required" = [
                                            "exponentialDelay",
                                          ]
                                        },
                                      ]
                                    }
                                  },
                                  {
                                    "required" = [
                                      "fixedDelay",
                                    ]
                                  },
                                  {
                                    "required" = [
                                      "exponentialDelay",
                                    ]
                                  },
                                ]
                                "properties" = {
                                  "exponentialDelay" = {
                                    "type" = "string"
                                  }
                                  "fixedDelay" = {
                                    "description" = "Add a fixed delay before forwarding the request."
                                    "type" = "string"
                                  }
                                  "percent" = {
                                    "description" = "Percentage of requests on which the delay will be injected (0-100)."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                  "percentage" = {
                                    "description" = "Percentage of requests on which the delay will be injected."
                                    "properties" = {
                                      "value" = {
                                        "format" = "double"
                                        "type" = "number"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                }
                                "type" = "object"
                              }
                            }
                            "type" = "object"
                          }
                          "headers" = {
                            "properties" = {
                              "request" = {
                                "properties" = {
                                  "add" = {
                                    "additionalProperties" = {
                                      "type" = "string"
                                    }
                                    "type" = "object"
                                  }
                                  "remove" = {
                                    "items" = {
                                      "type" = "string"
                                    }
                                    "type" = "array"
                                  }
                                  "set" = {
                                    "additionalProperties" = {
                                      "type" = "string"
                                    }
                                    "type" = "object"
                                  }
                                }
                                "type" = "object"
                              }
                              "response" = {
                                "properties" = {
                                  "add" = {
                                    "additionalProperties" = {
                                      "type" = "string"
                                    }
                                    "type" = "object"
                                  }
                                  "remove" = {
                                    "items" = {
                                      "type" = "string"
                                    }
                                    "type" = "array"
                                  }
                                  "set" = {
                                    "additionalProperties" = {
                                      "type" = "string"
                                    }
                                    "type" = "object"
                                  }
                                }
                                "type" = "object"
                              }
                            }
                            "type" = "object"
                          }
                          "match" = {
                            "description" = "Match conditions to be satisfied for the rule to be activated."
                            "items" = {
                              "properties" = {
                                "authority" = {
                                  "description" = "HTTP Authority values are case-sensitive and formatted as follows: - `exact: \"value\"` for exact string match - `prefix: \"value\"` for prefix-based match - `regex: \"value\"` for RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                  "oneOf" = [
                                    {
                                      "not" = {
                                        "anyOf" = [
                                          {
                                            "required" = [
                                              "exact",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "prefix",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "regex",
                                            ]
                                          },
                                        ]
                                      }
                                    },
                                    {
                                      "required" = [
                                        "exact",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "prefix",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "regex",
                                      ]
                                    },
                                  ]
                                  "properties" = {
                                    "exact" = {
                                      "type" = "string"
                                    }
                                    "prefix" = {
                                      "type" = "string"
                                    }
                                    "regex" = {
                                      "description" = "RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                      "type" = "string"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "gateways" = {
                                  "description" = "Names of gateways where the rule should be applied."
                                  "items" = {
                                    "type" = "string"
                                  }
                                  "type" = "array"
                                }
                                "headers" = {
                                  "additionalProperties" = {
                                    "oneOf" = [
                                      {
                                        "not" = {
                                          "anyOf" = [
                                            {
                                              "required" = [
                                                "exact",
                                              ]
                                            },
                                            {
                                              "required" = [
                                                "prefix",
                                              ]
                                            },
                                            {
                                              "required" = [
                                                "regex",
                                              ]
                                            },
                                          ]
                                        }
                                      },
                                      {
                                        "required" = [
                                          "exact",
                                        ]
                                      },
                                      {
                                        "required" = [
                                          "prefix",
                                        ]
                                      },
                                      {
                                        "required" = [
                                          "regex",
                                        ]
                                      },
                                    ]
                                    "properties" = {
                                      "exact" = {
                                        "type" = "string"
                                      }
                                      "prefix" = {
                                        "type" = "string"
                                      }
                                      "regex" = {
                                        "description" = "RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                        "type" = "string"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "description" = "The header keys must be lowercase and use hyphen as the separator, e.g."
                                  "type" = "object"
                                }
                                "ignoreUriCase" = {
                                  "description" = "Flag to specify whether the URI matching should be case-insensitive."
                                  "type" = "boolean"
                                }
                                "method" = {
                                  "description" = "HTTP Method values are case-sensitive and formatted as follows: - `exact: \"value\"` for exact string match - `prefix: \"value\"` for prefix-based match - `regex: \"value\"` for RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                  "oneOf" = [
                                    {
                                      "not" = {
                                        "anyOf" = [
                                          {
                                            "required" = [
                                              "exact",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "prefix",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "regex",
                                            ]
                                          },
                                        ]
                                      }
                                    },
                                    {
                                      "required" = [
                                        "exact",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "prefix",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "regex",
                                      ]
                                    },
                                  ]
                                  "properties" = {
                                    "exact" = {
                                      "type" = "string"
                                    }
                                    "prefix" = {
                                      "type" = "string"
                                    }
                                    "regex" = {
                                      "description" = "RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                      "type" = "string"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "name" = {
                                  "description" = "The name assigned to a match."
                                  "type" = "string"
                                }
                                "port" = {
                                  "description" = "Specifies the ports on the host that is being addressed."
                                  "type" = "integer"
                                }
                                "queryParams" = {
                                  "additionalProperties" = {
                                    "oneOf" = [
                                      {
                                        "not" = {
                                          "anyOf" = [
                                            {
                                              "required" = [
                                                "exact",
                                              ]
                                            },
                                            {
                                              "required" = [
                                                "prefix",
                                              ]
                                            },
                                            {
                                              "required" = [
                                                "regex",
                                              ]
                                            },
                                          ]
                                        }
                                      },
                                      {
                                        "required" = [
                                          "exact",
                                        ]
                                      },
                                      {
                                        "required" = [
                                          "prefix",
                                        ]
                                      },
                                      {
                                        "required" = [
                                          "regex",
                                        ]
                                      },
                                    ]
                                    "properties" = {
                                      "exact" = {
                                        "type" = "string"
                                      }
                                      "prefix" = {
                                        "type" = "string"
                                      }
                                      "regex" = {
                                        "description" = "RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                        "type" = "string"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "description" = "Query parameters for matching."
                                  "type" = "object"
                                }
                                "scheme" = {
                                  "description" = "URI Scheme values are case-sensitive and formatted as follows: - `exact: \"value\"` for exact string match - `prefix: \"value\"` for prefix-based match - `regex: \"value\"` for RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                  "oneOf" = [
                                    {
                                      "not" = {
                                        "anyOf" = [
                                          {
                                            "required" = [
                                              "exact",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "prefix",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "regex",
                                            ]
                                          },
                                        ]
                                      }
                                    },
                                    {
                                      "required" = [
                                        "exact",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "prefix",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "regex",
                                      ]
                                    },
                                  ]
                                  "properties" = {
                                    "exact" = {
                                      "type" = "string"
                                    }
                                    "prefix" = {
                                      "type" = "string"
                                    }
                                    "regex" = {
                                      "description" = "RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                      "type" = "string"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "sourceLabels" = {
                                  "additionalProperties" = {
                                    "type" = "string"
                                  }
                                  "description" = "One or more labels that constrain the applicability of a rule to source (client) workloads with the given labels."
                                  "type" = "object"
                                }
                                "sourceNamespace" = {
                                  "description" = "Source namespace constraining the applicability of a rule to workloads in that namespace."
                                  "type" = "string"
                                }
                                "statPrefix" = {
                                  "description" = "The human readable prefix to use when emitting statistics for this route."
                                  "type" = "string"
                                }
                                "uri" = {
                                  "description" = "URI to match values are case-sensitive and formatted as follows: - `exact: \"value\"` for exact string match - `prefix: \"value\"` for prefix-based match - `regex: \"value\"` for RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                  "oneOf" = [
                                    {
                                      "not" = {
                                        "anyOf" = [
                                          {
                                            "required" = [
                                              "exact",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "prefix",
                                            ]
                                          },
                                          {
                                            "required" = [
                                              "regex",
                                            ]
                                          },
                                        ]
                                      }
                                    },
                                    {
                                      "required" = [
                                        "exact",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "prefix",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "regex",
                                      ]
                                    },
                                  ]
                                  "properties" = {
                                    "exact" = {
                                      "type" = "string"
                                    }
                                    "prefix" = {
                                      "type" = "string"
                                    }
                                    "regex" = {
                                      "description" = "RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                      "type" = "string"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "withoutHeaders" = {
                                  "additionalProperties" = {
                                    "oneOf" = [
                                      {
                                        "not" = {
                                          "anyOf" = [
                                            {
                                              "required" = [
                                                "exact",
                                              ]
                                            },
                                            {
                                              "required" = [
                                                "prefix",
                                              ]
                                            },
                                            {
                                              "required" = [
                                                "regex",
                                              ]
                                            },
                                          ]
                                        }
                                      },
                                      {
                                        "required" = [
                                          "exact",
                                        ]
                                      },
                                      {
                                        "required" = [
                                          "prefix",
                                        ]
                                      },
                                      {
                                        "required" = [
                                          "regex",
                                        ]
                                      },
                                    ]
                                    "properties" = {
                                      "exact" = {
                                        "type" = "string"
                                      }
                                      "prefix" = {
                                        "type" = "string"
                                      }
                                      "regex" = {
                                        "description" = "RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                        "type" = "string"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "description" = "withoutHeader has the same syntax with the header, but has opposite meaning."
                                  "type" = "object"
                                }
                              }
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "mirror" = {
                            "description" = "Mirror HTTP traffic to a another destination in addition to forwarding the requests to the intended destination."
                            "properties" = {
                              "host" = {
                                "description" = "The name of a service from the service registry."
                                "type" = "string"
                              }
                              "port" = {
                                "description" = "Specifies the port on the host that is being addressed."
                                "properties" = {
                                  "number" = {
                                    "type" = "integer"
                                  }
                                }
                                "type" = "object"
                              }
                              "subset" = {
                                "description" = "The name of a subset within the service."
                                "type" = "string"
                              }
                            }
                            "required" = [
                              "host",
                            ]
                            "type" = "object"
                          }
                          "mirrorPercent" = {
                            "nullable" = true
                            "type" = "integer"
                          }
                          "mirrorPercentage" = {
                            "description" = "Percentage of the traffic to be mirrored by the `mirror` field."
                            "properties" = {
                              "value" = {
                                "format" = "double"
                                "type" = "number"
                              }
                            }
                            "type" = "object"
                          }
                          "mirror_percent" = {
                            "nullable" = true
                            "type" = "integer"
                          }
                          "mirrors" = {
                            "description" = "Specifies the destinations to mirror HTTP traffic in addition to the original destination."
                            "items" = {
                              "properties" = {
                                "destination" = {
                                  "description" = "Destination specifies the target of the mirror operation."
                                  "properties" = {
                                    "host" = {
                                      "description" = "The name of a service from the service registry."
                                      "type" = "string"
                                    }
                                    "port" = {
                                      "description" = "Specifies the port on the host that is being addressed."
                                      "properties" = {
                                        "number" = {
                                          "type" = "integer"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "subset" = {
                                      "description" = "The name of a subset within the service."
                                      "type" = "string"
                                    }
                                  }
                                  "required" = [
                                    "host",
                                  ]
                                  "type" = "object"
                                }
                                "percentage" = {
                                  "description" = "Percentage of the traffic to be mirrored by the `destination` field."
                                  "properties" = {
                                    "value" = {
                                      "format" = "double"
                                      "type" = "number"
                                    }
                                  }
                                  "type" = "object"
                                }
                              }
                              "required" = [
                                "destination",
                              ]
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "name" = {
                            "description" = "The name assigned to the route for debugging purposes."
                            "type" = "string"
                          }
                          "redirect" = {
                            "description" = "A HTTP rule can either return a direct_response, redirect or forward (default) traffic."
                            "oneOf" = [
                              {
                                "not" = {
                                  "anyOf" = [
                                    {
                                      "required" = [
                                        "port",
                                      ]
                                    },
                                    {
                                      "required" = [
                                        "derivePort",
                                      ]
                                    },
                                  ]
                                }
                              },
                              {
                                "required" = [
                                  "port",
                                ]
                              },
                              {
                                "required" = [
                                  "derivePort",
                                ]
                              },
                            ]
                            "properties" = {
                              "authority" = {
                                "description" = "On a redirect, overwrite the Authority/Host portion of the URL with this value."
                                "type" = "string"
                              }
                              "derivePort" = {
                                "description" = "On a redirect, dynamically set the port: * FROM_PROTOCOL_DEFAULT: automatically set to 80 for HTTP and 443 for HTTPS."
                                "enum" = [
                                  "FROM_PROTOCOL_DEFAULT",
                                  "FROM_REQUEST_PORT",
                                ]
                                "type" = "string"
                              }
                              "port" = {
                                "description" = "On a redirect, overwrite the port portion of the URL with this value."
                                "type" = "integer"
                              }
                              "redirectCode" = {
                                "description" = "On a redirect, Specifies the HTTP status code to use in the redirect response."
                                "type" = "integer"
                              }
                              "scheme" = {
                                "description" = "On a redirect, overwrite the scheme portion of the URL with this value."
                                "type" = "string"
                              }
                              "uri" = {
                                "description" = "On a redirect, overwrite the Path portion of the URL with this value."
                                "type" = "string"
                              }
                            }
                            "type" = "object"
                          }
                          "retries" = {
                            "description" = "Retry policy for HTTP requests."
                            "properties" = {
                              "attempts" = {
                                "description" = "Number of retries to be allowed for a given request."
                                "format" = "int32"
                                "type" = "integer"
                              }
                              "perTryTimeout" = {
                                "description" = "Timeout per attempt for a given request, including the initial call and any retries."
                                "type" = "string"
                              }
                              "retryOn" = {
                                "description" = "Specifies the conditions under which retry takes place."
                                "type" = "string"
                              }
                              "retryRemoteLocalities" = {
                                "description" = "Flag to specify whether the retries should retry to other localities."
                                "nullable" = true
                                "type" = "boolean"
                              }
                            }
                            "type" = "object"
                          }
                          "rewrite" = {
                            "description" = "Rewrite HTTP URIs and Authority headers."
                            "properties" = {
                              "authority" = {
                                "description" = "rewrite the Authority/Host header with this value."
                                "type" = "string"
                              }
                              "uri" = {
                                "description" = "rewrite the path (or the prefix) portion of the URI with this value."
                                "type" = "string"
                              }
                              "uriRegexRewrite" = {
                                "description" = "rewrite the path portion of the URI with the specified regex."
                                "properties" = {
                                  "match" = {
                                    "description" = "RE2 style regex-based match (https://github.com/google/re2/wiki/Syntax)."
                                    "type" = "string"
                                  }
                                  "rewrite" = {
                                    "description" = "The string that should replace into matching portions of original URI."
                                    "type" = "string"
                                  }
                                }
                                "type" = "object"
                              }
                            }
                            "type" = "object"
                          }
                          "route" = {
                            "description" = "A HTTP rule can either return a direct_response, redirect or forward (default) traffic."
                            "items" = {
                              "properties" = {
                                "destination" = {
                                  "description" = "Destination uniquely identifies the instances of a service to which the request/connection should be forwarded to."
                                  "properties" = {
                                    "host" = {
                                      "description" = "The name of a service from the service registry."
                                      "type" = "string"
                                    }
                                    "port" = {
                                      "description" = "Specifies the port on the host that is being addressed."
                                      "properties" = {
                                        "number" = {
                                          "type" = "integer"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "subset" = {
                                      "description" = "The name of a subset within the service."
                                      "type" = "string"
                                    }
                                  }
                                  "required" = [
                                    "host",
                                  ]
                                  "type" = "object"
                                }
                                "headers" = {
                                  "properties" = {
                                    "request" = {
                                      "properties" = {
                                        "add" = {
                                          "additionalProperties" = {
                                            "type" = "string"
                                          }
                                          "type" = "object"
                                        }
                                        "remove" = {
                                          "items" = {
                                            "type" = "string"
                                          }
                                          "type" = "array"
                                        }
                                        "set" = {
                                          "additionalProperties" = {
                                            "type" = "string"
                                          }
                                          "type" = "object"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "response" = {
                                      "properties" = {
                                        "add" = {
                                          "additionalProperties" = {
                                            "type" = "string"
                                          }
                                          "type" = "object"
                                        }
                                        "remove" = {
                                          "items" = {
                                            "type" = "string"
                                          }
                                          "type" = "array"
                                        }
                                        "set" = {
                                          "additionalProperties" = {
                                            "type" = "string"
                                          }
                                          "type" = "object"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                  }
                                  "type" = "object"
                                }
                                "weight" = {
                                  "description" = "Weight specifies the relative proportion of traffic to be forwarded to the destination."
                                  "format" = "int32"
                                  "type" = "integer"
                                }
                              }
                              "required" = [
                                "destination",
                              ]
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "timeout" = {
                            "description" = "Timeout for HTTP requests, default is disabled."
                            "type" = "string"
                          }
                        }
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "tcp" = {
                      "description" = "An ordered list of route rules for opaque TCP traffic."
                      "items" = {
                        "properties" = {
                          "match" = {
                            "description" = "Match conditions to be satisfied for the rule to be activated."
                            "items" = {
                              "properties" = {
                                "destinationSubnets" = {
                                  "description" = "IPv4 or IPv6 ip addresses of destination with optional subnet."
                                  "items" = {
                                    "type" = "string"
                                  }
                                  "type" = "array"
                                }
                                "gateways" = {
                                  "description" = "Names of gateways where the rule should be applied."
                                  "items" = {
                                    "type" = "string"
                                  }
                                  "type" = "array"
                                }
                                "port" = {
                                  "description" = "Specifies the port on the host that is being addressed."
                                  "type" = "integer"
                                }
                                "sourceLabels" = {
                                  "additionalProperties" = {
                                    "type" = "string"
                                  }
                                  "description" = "One or more labels that constrain the applicability of a rule to workloads with the given labels."
                                  "type" = "object"
                                }
                                "sourceNamespace" = {
                                  "description" = "Source namespace constraining the applicability of a rule to workloads in that namespace."
                                  "type" = "string"
                                }
                                "sourceSubnet" = {
                                  "type" = "string"
                                }
                              }
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "route" = {
                            "description" = "The destination to which the connection should be forwarded to."
                            "items" = {
                              "properties" = {
                                "destination" = {
                                  "description" = "Destination uniquely identifies the instances of a service to which the request/connection should be forwarded to."
                                  "properties" = {
                                    "host" = {
                                      "description" = "The name of a service from the service registry."
                                      "type" = "string"
                                    }
                                    "port" = {
                                      "description" = "Specifies the port on the host that is being addressed."
                                      "properties" = {
                                        "number" = {
                                          "type" = "integer"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "subset" = {
                                      "description" = "The name of a subset within the service."
                                      "type" = "string"
                                    }
                                  }
                                  "required" = [
                                    "host",
                                  ]
                                  "type" = "object"
                                }
                                "weight" = {
                                  "description" = "Weight specifies the relative proportion of traffic to be forwarded to the destination."
                                  "format" = "int32"
                                  "type" = "integer"
                                }
                              }
                              "required" = [
                                "destination",
                              ]
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                        }
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "tls" = {
                      "description" = "An ordered list of route rule for non-terminated TLS & HTTPS traffic."
                      "items" = {
                        "properties" = {
                          "match" = {
                            "description" = "Match conditions to be satisfied for the rule to be activated."
                            "items" = {
                              "properties" = {
                                "destinationSubnets" = {
                                  "description" = "IPv4 or IPv6 ip addresses of destination with optional subnet."
                                  "items" = {
                                    "type" = "string"
                                  }
                                  "type" = "array"
                                }
                                "gateways" = {
                                  "description" = "Names of gateways where the rule should be applied."
                                  "items" = {
                                    "type" = "string"
                                  }
                                  "type" = "array"
                                }
                                "port" = {
                                  "description" = "Specifies the port on the host that is being addressed."
                                  "type" = "integer"
                                }
                                "sniHosts" = {
                                  "description" = "SNI (server name indicator) to match on."
                                  "items" = {
                                    "type" = "string"
                                  }
                                  "type" = "array"
                                }
                                "sourceLabels" = {
                                  "additionalProperties" = {
                                    "type" = "string"
                                  }
                                  "description" = "One or more labels that constrain the applicability of a rule to workloads with the given labels."
                                  "type" = "object"
                                }
                                "sourceNamespace" = {
                                  "description" = "Source namespace constraining the applicability of a rule to workloads in that namespace."
                                  "type" = "string"
                                }
                              }
                              "required" = [
                                "sniHosts",
                              ]
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                          "route" = {
                            "description" = "The destination to which the connection should be forwarded to."
                            "items" = {
                              "properties" = {
                                "destination" = {
                                  "description" = "Destination uniquely identifies the instances of a service to which the request/connection should be forwarded to."
                                  "properties" = {
                                    "host" = {
                                      "description" = "The name of a service from the service registry."
                                      "type" = "string"
                                    }
                                    "port" = {
                                      "description" = "Specifies the port on the host that is being addressed."
                                      "properties" = {
                                        "number" = {
                                          "type" = "integer"
                                        }
                                      }
                                      "type" = "object"
                                    }
                                    "subset" = {
                                      "description" = "The name of a subset within the service."
                                      "type" = "string"
                                    }
                                  }
                                  "required" = [
                                    "host",
                                  ]
                                  "type" = "object"
                                }
                                "weight" = {
                                  "description" = "Weight specifies the relative proportion of traffic to be forwarded to the destination."
                                  "format" = "int32"
                                  "type" = "integer"
                                }
                              }
                              "required" = [
                                "destination",
                              ]
                              "type" = "object"
                            }
                            "type" = "array"
                          }
                        }
                        "required" = [
                          "match",
                        ]
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                  }
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = false
          "subresources" = {
            "status" = {}
          }
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "customresourcedefinition_wasmplugins_extensions_istio_io" {
  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "annotations" = {
        "helm.sh/resource-policy" = "keep"
      }
      "labels" = {
        "app" = "istio-pilot"
        "chart" = "istio"
        "heritage" = "Tiller"
        "release" = "istio"
      }
      "name" = "wasmplugins.extensions.istio.io"
    }
    "spec" = {
      "group" = "extensions.istio.io"
      "names" = {
        "categories" = [
          "istio-io",
          "extensions-istio-io",
        ]
        "kind" = "WasmPlugin"
        "listKind" = "WasmPluginList"
        "plural" = "wasmplugins"
        "singular" = "wasmplugin"
      }
      "scope" = "Namespaced"
      "versions" = [
        {
          "additionalPrinterColumns" = [
            {
              "description" = "CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC. Populated by the system. Read-only. Null for lists. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata"
              "jsonPath" = ".metadata.creationTimestamp"
              "name" = "Age"
              "type" = "date"
            },
          ]
          "name" = "v1alpha1"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Extend the functionality provided by the Istio proxy through WebAssembly filters. See more details at: https://istio.io/docs/reference/config/proxy_extensions/wasm-plugin.html"
                  "properties" = {
                    "failStrategy" = {
                      "description" = "Specifies the failure behavior for the plugin due to fatal errors."
                      "enum" = [
                        "FAIL_CLOSE",
                        "FAIL_OPEN",
                      ]
                      "type" = "string"
                    }
                    "imagePullPolicy" = {
                      "description" = "The pull behaviour to be applied when fetching Wasm module by either OCI image or http/https."
                      "enum" = [
                        "UNSPECIFIED_POLICY",
                        "IfNotPresent",
                        "Always",
                      ]
                      "type" = "string"
                    }
                    "imagePullSecret" = {
                      "description" = "Credentials to use for OCI image pulling."
                      "maxLength" = 253
                      "minLength" = 1
                      "type" = "string"
                    }
                    "match" = {
                      "description" = "Specifies the criteria to determine which traffic is passed to WasmPlugin."
                      "items" = {
                        "properties" = {
                          "mode" = {
                            "description" = "Criteria for selecting traffic by their direction."
                            "enum" = [
                              "UNDEFINED",
                              "CLIENT",
                              "SERVER",
                              "CLIENT_AND_SERVER",
                            ]
                            "type" = "string"
                          }
                          "ports" = {
                            "description" = "Criteria for selecting traffic by their destination port."
                            "items" = {
                              "properties" = {
                                "number" = {
                                  "maximum" = 65535
                                  "minimum" = 1
                                  "type" = "integer"
                                }
                              }
                              "required" = [
                                "number",
                              ]
                              "type" = "object"
                            }
                            "type" = "array"
                            "x-kubernetes-list-map-keys" = [
                              "number",
                            ]
                            "x-kubernetes-list-type" = "map"
                          }
                        }
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "phase" = {
                      "description" = "Determines where in the filter chain this `WasmPlugin` is to be injected."
                      "enum" = [
                        "UNSPECIFIED_PHASE",
                        "AUTHN",
                        "AUTHZ",
                        "STATS",
                      ]
                      "type" = "string"
                    }
                    "pluginConfig" = {
                      "description" = "The configuration that will be passed on to the plugin."
                      "type" = "object"
                      "x-kubernetes-preserve-unknown-fields" = true
                    }
                    "pluginName" = {
                      "description" = "The plugin name to be used in the Envoy configuration (used to be called `rootID`)."
                      "maxLength" = 256
                      "minLength" = 1
                      "type" = "string"
                    }
                    "priority" = {
                      "description" = "Determines ordering of `WasmPlugins` in the same `phase`."
                      "nullable" = true
                      "type" = "integer"
                    }
                    "selector" = {
                      "description" = "Criteria used to select the specific set of pods/VMs on which this plugin configuration should be applied."
                      "properties" = {
                        "matchLabels" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "description" = "One or more labels that indicate a specific set of pods/VMs on which a policy should be applied."
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                    "sha256" = {
                      "description" = "SHA256 checksum that will be used to verify Wasm module or OCI container."
                      "pattern" = "(^$|^[a-f0-9]{64}$)"
                      "type" = "string"
                    }
                    "targetRef" = {
                      "description" = "Optional."
                      "properties" = {
                        "group" = {
                          "description" = "group is the group of the target resource."
                          "type" = "string"
                        }
                        "kind" = {
                          "description" = "kind is kind of the target resource."
                          "type" = "string"
                        }
                        "name" = {
                          "description" = "name is the name of the target resource."
                          "type" = "string"
                        }
                        "namespace" = {
                          "description" = "namespace is the namespace of the referent."
                          "type" = "string"
                        }
                      }
                      "type" = "object"
                    }
                    "type" = {
                      "description" = "Specifies the type of Wasm Extension to be used."
                      "enum" = [
                        "UNSPECIFIED_PLUGIN_TYPE",
                        "HTTP",
                        "NETWORK",
                      ]
                      "type" = "string"
                    }
                    "url" = {
                      "description" = "URL of a Wasm module or OCI container."
                      "minLength" = 1
                      "type" = "string"
                      "x-kubernetes-validations" = [
                        {
                          "message" = "url must have schema one of [http, https, file, oci]"
                          "rule" = "isURL(self) ? (url(self).getScheme() in ['', 'http', 'https', 'oci', 'file']) : (isURL('http://' + self) && url('http://' +self).getScheme() in ['', 'http', 'https', 'oci', 'file'])"
                        },
                      ]
                    }
                    "verificationKey" = {
                      "type" = "string"
                    }
                    "vmConfig" = {
                      "description" = "Configuration for a Wasm VM."
                      "properties" = {
                        "env" = {
                          "description" = "Specifies environment variables to be injected to this VM."
                          "items" = {
                            "properties" = {
                              "name" = {
                                "description" = "Name of the environment variable."
                                "maxLength" = 256
                                "minLength" = 1
                                "type" = "string"
                              }
                              "value" = {
                                "description" = "Value for the environment variable."
                                "maxLength" = 2048
                                "type" = "string"
                              }
                              "valueFrom" = {
                                "description" = "Source for the environment variable's value."
                                "enum" = [
                                  "INLINE",
                                  "HOST",
                                ]
                                "type" = "string"
                              }
                            }
                            "required" = [
                              "name",
                            ]
                            "type" = "object"
                            "x-kubernetes-validations" = [
                              {
                                "message" = "value may only be set when valueFrom is INLINE"
                                "rule" = "(has(self.valueFrom) ? self.valueFrom : '') != 'HOST' || !has(self.value)"
                              },
                            ]
                          }
                          "maxItems" = 256
                          "type" = "array"
                          "x-kubernetes-list-map-keys" = [
                            "name",
                          ]
                          "x-kubernetes-list-type" = "map"
                        }
                      }
                      "type" = "object"
                    }
                  }
                  "required" = [
                    "url",
                  ]
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "required" = [
                "spec",
              ]
              "type" = "object"
            }
          }
          "served" = true
          "storage" = true
          "subresources" = {
            "status" = {}
          }
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "customresourcedefinition_workloadentries_networking_istio_io" {
  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "annotations" = {
        "helm.sh/resource-policy" = "keep"
      }
      "labels" = {
        "app" = "istio-pilot"
        "chart" = "istio"
        "heritage" = "Tiller"
        "release" = "istio"
      }
      "name" = "workloadentries.networking.istio.io"
    }
    "spec" = {
      "group" = "networking.istio.io"
      "names" = {
        "categories" = [
          "istio-io",
          "networking-istio-io",
        ]
        "kind" = "WorkloadEntry"
        "listKind" = "WorkloadEntryList"
        "plural" = "workloadentries"
        "shortNames" = [
          "we",
        ]
        "singular" = "workloadentry"
      }
      "scope" = "Namespaced"
      "versions" = [
        {
          "additionalPrinterColumns" = [
            {
              "description" = "CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC. Populated by the system. Read-only. Null for lists. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata"
              "jsonPath" = ".metadata.creationTimestamp"
              "name" = "Age"
              "type" = "date"
            },
            {
              "description" = "Address associated with the network endpoint."
              "jsonPath" = ".spec.address"
              "name" = "Address"
              "type" = "string"
            },
          ]
          "name" = "v1alpha3"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Configuration affecting VMs onboarded into the mesh. See more details at: https://istio.io/docs/reference/config/networking/workload-entry.html"
                  "properties" = {
                    "address" = {
                      "description" = "Address associated with the network endpoint without the port."
                      "type" = "string"
                    }
                    "labels" = {
                      "additionalProperties" = {
                        "type" = "string"
                      }
                      "description" = "One or more labels associated with the endpoint."
                      "type" = "object"
                    }
                    "locality" = {
                      "description" = "The locality associated with the endpoint."
                      "type" = "string"
                    }
                    "network" = {
                      "description" = "Network enables Istio to group endpoints resident in the same L3 domain/network."
                      "type" = "string"
                    }
                    "ports" = {
                      "additionalProperties" = {
                        "type" = "integer"
                      }
                      "description" = "Set of ports associated with the endpoint."
                      "type" = "object"
                    }
                    "serviceAccount" = {
                      "description" = "The service account associated with the workload if a sidecar is present in the workload."
                      "type" = "string"
                    }
                    "weight" = {
                      "description" = "The load balancing weight associated with the endpoint."
                      "type" = "integer"
                    }
                  }
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = true
          "subresources" = {
            "status" = {}
          }
        },
        {
          "additionalPrinterColumns" = [
            {
              "description" = "CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC. Populated by the system. Read-only. Null for lists. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata"
              "jsonPath" = ".metadata.creationTimestamp"
              "name" = "Age"
              "type" = "date"
            },
            {
              "description" = "Address associated with the network endpoint."
              "jsonPath" = ".spec.address"
              "name" = "Address"
              "type" = "string"
            },
          ]
          "name" = "v1beta1"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Configuration affecting VMs onboarded into the mesh. See more details at: https://istio.io/docs/reference/config/networking/workload-entry.html"
                  "properties" = {
                    "address" = {
                      "description" = "Address associated with the network endpoint without the port."
                      "type" = "string"
                    }
                    "labels" = {
                      "additionalProperties" = {
                        "type" = "string"
                      }
                      "description" = "One or more labels associated with the endpoint."
                      "type" = "object"
                    }
                    "locality" = {
                      "description" = "The locality associated with the endpoint."
                      "type" = "string"
                    }
                    "network" = {
                      "description" = "Network enables Istio to group endpoints resident in the same L3 domain/network."
                      "type" = "string"
                    }
                    "ports" = {
                      "additionalProperties" = {
                        "type" = "integer"
                      }
                      "description" = "Set of ports associated with the endpoint."
                      "type" = "object"
                    }
                    "serviceAccount" = {
                      "description" = "The service account associated with the workload if a sidecar is present in the workload."
                      "type" = "string"
                    }
                    "weight" = {
                      "description" = "The load balancing weight associated with the endpoint."
                      "type" = "integer"
                    }
                  }
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = false
          "subresources" = {
            "status" = {}
          }
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "customresourcedefinition_workloadgroups_networking_istio_io" {
  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "labels" = {
        "app" = "istio-pilot"
        "chart" = "istio"
        "heritage" = "Tiller"
        "release" = "istio"
      }
      "name" = "workloadgroups.networking.istio.io"
    }
    "spec" = {
      "group" = "networking.istio.io"
      "names" = {
        "categories" = [
          "istio-io",
          "networking-istio-io",
        ]
        "kind" = "WorkloadGroup"
        "listKind" = "WorkloadGroupList"
        "plural" = "workloadgroups"
        "shortNames" = [
          "wg",
        ]
        "singular" = "workloadgroup"
      }
      "scope" = "Namespaced"
      "versions" = [
        {
          "additionalPrinterColumns" = [
            {
              "description" = "CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC. Populated by the system. Read-only. Null for lists. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata"
              "jsonPath" = ".metadata.creationTimestamp"
              "name" = "Age"
              "type" = "date"
            },
          ]
          "name" = "v1alpha3"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "Describes a collection of workload instances. See more details at: https://istio.io/docs/reference/config/networking/workload-group.html"
                  "properties" = {
                    "metadata" = {
                      "description" = "Metadata that will be used for all corresponding `WorkloadEntries`."
                      "properties" = {
                        "annotations" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "type" = "object"
                        }
                        "labels" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                    "probe" = {
                      "description" = "`ReadinessProbe` describes the configuration the user must provide for healthchecking on their workload."
                      "oneOf" = [
                        {
                          "not" = {
                            "anyOf" = [
                              {
                                "required" = [
                                  "httpGet",
                                ]
                              },
                              {
                                "required" = [
                                  "tcpSocket",
                                ]
                              },
                              {
                                "required" = [
                                  "exec",
                                ]
                              },
                            ]
                          }
                        },
                        {
                          "required" = [
                            "httpGet",
                          ]
                        },
                        {
                          "required" = [
                            "tcpSocket",
                          ]
                        },
                        {
                          "required" = [
                            "exec",
                          ]
                        },
                      ]
                      "properties" = {
                        "exec" = {
                          "description" = "Health is determined by how the command that is executed exited."
                          "properties" = {
                            "command" = {
                              "description" = "Command to run."
                              "items" = {
                                "type" = "string"
                              }
                              "type" = "array"
                            }
                          }
                          "type" = "object"
                        }
                        "failureThreshold" = {
                          "description" = "Minimum consecutive failures for the probe to be considered failed after having succeeded."
                          "format" = "int32"
                          "type" = "integer"
                        }
                        "httpGet" = {
                          "description" = "`httpGet` is performed to a given endpoint and the status/able to connect determines health."
                          "properties" = {
                            "host" = {
                              "description" = "Host name to connect to, defaults to the pod IP."
                              "type" = "string"
                            }
                            "httpHeaders" = {
                              "description" = "Headers the proxy will pass on to make the request."
                              "items" = {
                                "properties" = {
                                  "name" = {
                                    "type" = "string"
                                  }
                                  "value" = {
                                    "type" = "string"
                                  }
                                }
                                "type" = "object"
                              }
                              "type" = "array"
                            }
                            "path" = {
                              "description" = "Path to access on the HTTP server."
                              "type" = "string"
                            }
                            "port" = {
                              "description" = "Port on which the endpoint lives."
                              "type" = "integer"
                            }
                            "scheme" = {
                              "type" = "string"
                            }
                          }
                          "required" = [
                            "port",
                          ]
                          "type" = "object"
                        }
                        "initialDelaySeconds" = {
                          "description" = "Number of seconds after the container has started before readiness probes are initiated."
                          "format" = "int32"
                          "type" = "integer"
                        }
                        "periodSeconds" = {
                          "description" = "How often (in seconds) to perform the probe."
                          "format" = "int32"
                          "type" = "integer"
                        }
                        "successThreshold" = {
                          "description" = "Minimum consecutive successes for the probe to be considered successful after having failed."
                          "format" = "int32"
                          "type" = "integer"
                        }
                        "tcpSocket" = {
                          "description" = "Health is determined by if the proxy is able to connect."
                          "properties" = {
                            "host" = {
                              "type" = "string"
                            }
                            "port" = {
                              "type" = "integer"
                            }
                          }
                          "required" = [
                            "port",
                          ]
                          "type" = "object"
                        }
                        "timeoutSeconds" = {
                          "description" = "Number of seconds after which the probe times out."
                          "format" = "int32"
                          "type" = "integer"
                        }
                      }
                      "type" = "object"
                    }
                    "template" = {
                      "description" = "Template to be used for the generation of `WorkloadEntry` resources that belong to this `WorkloadGroup`."
                      "properties" = {
                        "address" = {
                          "description" = "Address associated with the network endpoint without the port."
                          "type" = "string"
                        }
                        "labels" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "description" = "One or more labels associated with the endpoint."
                          "type" = "object"
                        }
                        "locality" = {
                          "description" = "The locality associated with the endpoint."
                          "type" = "string"
                        }
                        "network" = {
                          "description" = "Network enables Istio to group endpoints resident in the same L3 domain/network."
                          "type" = "string"
                        }
                        "ports" = {
                          "additionalProperties" = {
                            "type" = "integer"
                          }
                          "description" = "Set of ports associated with the endpoint."
                          "type" = "object"
                        }
                        "serviceAccount" = {
                          "description" = "The service account associated with the workload if a sidecar is present in the workload."
                          "type" = "string"
                        }
                        "weight" = {
                          "description" = "The load balancing weight associated with the endpoint."
                          "type" = "integer"
                        }
                      }
                      "type" = "object"
                    }
                  }
                  "required" = [
                    "template",
                  ]
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = true
          "subresources" = {
            "status" = {}
          }
        },
        {
          "additionalPrinterColumns" = [
            {
              "description" = "CreationTimestamp is a timestamp representing the server time when this object was created. It is not guaranteed to be set in happens-before order across separate operations. Clients may not set this value. It is represented in RFC3339 form and is in UTC. Populated by the system. Read-only. Null for lists. More info: https://git.k8s.io/community/contributors/devel/api-conventions.md#metadata"
              "jsonPath" = ".metadata.creationTimestamp"
              "name" = "Age"
              "type" = "date"
            },
          ]
          "name" = "v1beta1"
          "schema" = {
            "openAPIV3Schema" = {
              "properties" = {
                "spec" = {
                  "description" = "`WorkloadGroup` enables specifying the properties of a single workload for bootstrap and provides a template for `WorkloadEntry`, similar to how `Deployment` specifies properties of workloads via `Pod` templates."
                  "properties" = {
                    "metadata" = {
                      "description" = "Metadata that will be used for all corresponding `WorkloadEntries`."
                      "properties" = {
                        "annotations" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "type" = "object"
                        }
                        "labels" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                    "probe" = {
                      "description" = "`ReadinessProbe` describes the configuration the user must provide for healthchecking on their workload."
                      "oneOf" = [
                        {
                          "not" = {
                            "anyOf" = [
                              {
                                "required" = [
                                  "httpGet",
                                ]
                              },
                              {
                                "required" = [
                                  "tcpSocket",
                                ]
                              },
                              {
                                "required" = [
                                  "exec",
                                ]
                              },
                            ]
                          }
                        },
                        {
                          "required" = [
                            "httpGet",
                          ]
                        },
                        {
                          "required" = [
                            "tcpSocket",
                          ]
                        },
                        {
                          "required" = [
                            "exec",
                          ]
                        },
                      ]
                      "properties" = {
                        "exec" = {
                          "description" = "Health is determined by how the command that is executed exited."
                          "properties" = {
                            "command" = {
                              "description" = "Command to run."
                              "items" = {
                                "type" = "string"
                              }
                              "type" = "array"
                            }
                          }
                          "type" = "object"
                        }
                        "failureThreshold" = {
                          "description" = "Minimum consecutive failures for the probe to be considered failed after having succeeded."
                          "format" = "int32"
                          "type" = "integer"
                        }
                        "httpGet" = {
                          "description" = "`httpGet` is performed to a given endpoint and the status/able to connect determines health."
                          "properties" = {
                            "host" = {
                              "description" = "Host name to connect to, defaults to the pod IP."
                              "type" = "string"
                            }
                            "httpHeaders" = {
                              "description" = "Headers the proxy will pass on to make the request."
                              "items" = {
                                "properties" = {
                                  "name" = {
                                    "type" = "string"
                                  }
                                  "value" = {
                                    "type" = "string"
                                  }
                                }
                                "type" = "object"
                              }
                              "type" = "array"
                            }
                            "path" = {
                              "description" = "Path to access on the HTTP server."
                              "type" = "string"
                            }
                            "port" = {
                              "description" = "Port on which the endpoint lives."
                              "type" = "integer"
                            }
                            "scheme" = {
                              "type" = "string"
                            }
                          }
                          "required" = [
                            "port",
                          ]
                          "type" = "object"
                        }
                        "initialDelaySeconds" = {
                          "description" = "Number of seconds after the container has started before readiness probes are initiated."
                          "format" = "int32"
                          "type" = "integer"
                        }
                        "periodSeconds" = {
                          "description" = "How often (in seconds) to perform the probe."
                          "format" = "int32"
                          "type" = "integer"
                        }
                        "successThreshold" = {
                          "description" = "Minimum consecutive successes for the probe to be considered successful after having failed."
                          "format" = "int32"
                          "type" = "integer"
                        }
                        "tcpSocket" = {
                          "description" = "Health is determined by if the proxy is able to connect."
                          "properties" = {
                            "host" = {
                              "type" = "string"
                            }
                            "port" = {
                              "type" = "integer"
                            }
                          }
                          "required" = [
                            "port",
                          ]
                          "type" = "object"
                        }
                        "timeoutSeconds" = {
                          "description" = "Number of seconds after which the probe times out."
                          "format" = "int32"
                          "type" = "integer"
                        }
                      }
                      "type" = "object"
                    }
                    "template" = {
                      "description" = "Template to be used for the generation of `WorkloadEntry` resources that belong to this `WorkloadGroup`."
                      "properties" = {
                        "address" = {
                          "description" = "Address associated with the network endpoint without the port."
                          "type" = "string"
                        }
                        "labels" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "description" = "One or more labels associated with the endpoint."
                          "type" = "object"
                        }
                        "locality" = {
                          "description" = "The locality associated with the endpoint."
                          "type" = "string"
                        }
                        "network" = {
                          "description" = "Network enables Istio to group endpoints resident in the same L3 domain/network."
                          "type" = "string"
                        }
                        "ports" = {
                          "additionalProperties" = {
                            "type" = "integer"
                          }
                          "description" = "Set of ports associated with the endpoint."
                          "type" = "object"
                        }
                        "serviceAccount" = {
                          "description" = "The service account associated with the workload if a sidecar is present in the workload."
                          "type" = "string"
                        }
                        "weight" = {
                          "description" = "The load balancing weight associated with the endpoint."
                          "type" = "integer"
                        }
                      }
                      "type" = "object"
                    }
                  }
                  "required" = [
                    "template",
                  ]
                  "type" = "object"
                }
                "status" = {
                  "type" = "object"
                  "x-kubernetes-preserve-unknown-fields" = true
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = false
          "subresources" = {
            "status" = {}
          }
        },
      ]
    }
  }
}

resource "kubernetes_manifest" "serviceaccount_istio_system_istio_ingressgateway_service_account" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "ServiceAccount"
    "metadata" = {
      "labels" = {
        "app" = "istio-ingressgateway"
        "install.operator.istio.io/owning-resource" = "unknown"
        "istio" = "ingressgateway"
        "istio.io/rev" = "default"
        "operator.istio.io/component" = "IngressGateways"
        "release" = "istio"
      }
      "name" = "istio-ingressgateway-service-account"
      "namespace" = "istio-system"
    }
  }
}
