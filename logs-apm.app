{
  "template": {
    "settings": {
      "index": {
        "lifecycle": {
          "name": "logs-apm.app_logs-default_policy"
        },
        "codec": "best_compression",
        "routing": {
          "allocation": {
            "include": {
              "_tier_preference": "data_hot"
            }
          }
        },
        "mapping": {
          "total_fields": {
            "limit": "10000"
          }
        },
        "final_pipeline": ".fleet_final_pipeline-1",
        "query": {
          "default_field": [
            "agent.ephemeral_id",
            "agent.name",
            "agent.version",
            "client.domain",
            "client.geo.city_name",
            "client.geo.continent_name",
            "client.geo.country_iso_code",
            "client.geo.country_name",
            "client.geo.region_iso_code",
            "client.geo.region_name",
            "cloud.account.id",
            "cloud.account.name",
            "cloud.availability_zone",
            "cloud.instance.id",
            "cloud.instance.name",
            "cloud.machine.type",
            "cloud.project.id",
            "cloud.project.name",
            "cloud.provider",
            "cloud.region",
            "cloud.service.name",
            "container.id",
            "destination.address",
            "ecs.version",
            "event.outcome",
            "event.action",
            "host.architecture",
            "host.hostname",
            "host.name",
            "host.os.platform",
            "http.request.method",
            "http.request.referrer",
            "http.version",
            "log.level",
            "observer.hostname",
            "observer.name",
            "observer.type",
            "observer.version",
            "process.args",
            "process.title",
            "service.environment",
            "service.name",
            "service.node.name",
            "service.version",
            "source.domain",
            "span.id",
            "trace.id",
            "transaction.id",
            "url.domain",
            "url.fragment",
            "url.query",
            "url.scheme",
            "user.domain",
            "user.email",
            "user.id",
            "user.name",
            "user_agent.device.name",
            "user_agent.name",
            "user_agent.original",
            "user_agent.os.family",
            "user_agent.os.full",
            "user_agent.os.kernel",
            "user_agent.os.name",
            "user_agent.os.platform",
            "user_agent.os.version",
            "user_agent.version",
            "kubernetes.namespace",
            "kubernetes.node.name",
            "kubernetes.pod.name",
            "kubernetes.pod.uid",
            "observer.ephemeral_id",
            "observer.id",
            "service.framework.name",
            "service.framework.version",
            "service.language.name",
            "service.language.version",
            "service.runtime.name",
            "service.runtime.version"
          ]
        },
        "default_pipeline": "logs-apm.app-8.1.2"
      }
    },
    "mappings": {
      "dynamic": "false",
      "_meta": {
        "package": {
          "name": "apm"
        },
        "managed_by": "fleet",
        "managed": true
      },
      "dynamic_templates": [
        {
          "numeric_labels": {
            "path_match": "numeric_labels.*",
            "mapping": {
              "scaling_factor": 1000000,
              "type": "scaled_float"
            }
          }
        },
        {
          "strings_as_keyword": {
            "match_mapping_type": "string",
            "mapping": {
              "ignore_above": 1024,
              "type": "keyword"
            }
          }
        }
      ],
      "date_detection": false,
      "properties": {
        "@timestamp": {
          "type": "date"
        },
        "agent": {
          "properties": {
            "ephemeral_id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "version": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "client": {
          "properties": {
            "domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "geo": {
              "properties": {
                "city_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "continent_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "country_iso_code": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "country_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "location": {
                  "type": "geo_point"
                },
                "region_iso_code": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "region_name": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "ip": {
              "type": "ip"
            },
            "port": {
              "type": "long"
            }
          }
        },
        "cloud": {
          "properties": {
            "account": {
              "properties": {
                "id": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "availability_zone": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "instance": {
              "properties": {
                "id": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "machine": {
              "properties": {
                "type": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "project": {
              "properties": {
                "id": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "provider": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "region": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "service": {
              "properties": {
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            }
          }
        },
        "container": {
          "properties": {
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "data_stream": {
          "properties": {
            "dataset": {
              "type": "constant_keyword"
            },
            "namespace": {
              "type": "constant_keyword"
            },
            "type": {
              "type": "constant_keyword"
            }
          }
        },
        "destination": {
          "properties": {
            "address": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "ip": {
              "type": "ip"
            },
            "port": {
              "type": "long"
            }
          }
        },
        "ecs": {
          "properties": {
            "version": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "event": {
          "properties": {
            "action": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "agent_id_status": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "ingested": {
              "type": "date",
              "format": "strict_date_time_no_millis||strict_date_optional_time||epoch_millis"
            },
            "outcome": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "severity": {
              "type": "long"
            }
          }
        },
        "host": {
          "properties": {
            "architecture": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "hostname": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "ip": {
              "type": "ip"
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "os": {
              "properties": {
                "platform": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            }
          }
        },
        "http": {
          "properties": {
            "request": {
              "properties": {
                "headers": {
                  "type": "object"
                },
                "method": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "referrer": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "response": {
              "properties": {
                "finished": {
                  "type": "boolean"
                },
                "headers": {
                  "type": "object"
                },
                "status_code": {
                  "type": "long"
                }
              }
            },
            "version": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "kubernetes": {
          "properties": {
            "namespace": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "node": {
              "properties": {
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "pod": {
              "properties": {
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "uid": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            }
          }
        },
        "labels": {
          "type": "object",
          "dynamic": "true"
        },
        "log": {
          "properties": {
            "level": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "message": {
          "type": "match_only_text"
        },
        "numeric_labels": {
          "type": "object",
          "dynamic": "true"
        },
        "observer": {
          "properties": {
            "ephemeral_id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "hostname": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "type": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "version": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "version_major": {
              "type": "byte"
            }
          }
        },
        "process": {
          "properties": {
            "args": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "pid": {
              "type": "long"
            },
            "ppid": {
              "type": "long"
            },
            "title": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "processor": {
          "properties": {
            "event": {
              "type": "constant_keyword"
            },
            "name": {
              "type": "constant_keyword"
            }
          }
        },
        "service": {
          "properties": {
            "environment": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "framework": {
              "properties": {
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "version": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "language": {
              "properties": {
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "version": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "node": {
              "properties": {
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "runtime": {
              "properties": {
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "version": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "version": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "source": {
          "properties": {
            "domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "ip": {
              "type": "ip"
            },
            "port": {
              "type": "long"
            }
          }
        },
        "span": {
          "properties": {
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "trace": {
          "properties": {
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "transaction": {
          "properties": {
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "url": {
          "properties": {
            "domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "fragment": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "full": {
              "type": "wildcard",
              "ignore_above": 1024
            },
            "original": {
              "type": "wildcard",
              "ignore_above": 1024
            },
            "path": {
              "type": "wildcard",
              "ignore_above": 1024
            },
            "port": {
              "type": "long"
            },
            "query": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "scheme": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "user": {
          "properties": {
            "domain": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "email": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "id": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        },
        "user_agent": {
          "properties": {
            "device": {
              "properties": {
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "name": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "original": {
              "type": "keyword",
              "ignore_above": 1024
            },
            "os": {
              "properties": {
                "family": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "full": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "kernel": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "name": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "platform": {
                  "type": "keyword",
                  "ignore_above": 1024
                },
                "version": {
                  "type": "keyword",
                  "ignore_above": 1024
                }
              }
            },
            "version": {
              "type": "keyword",
              "ignore_above": 1024
            }
          }
        }
      }
    },
    "aliases": {}
  }
}
