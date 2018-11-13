# Prometheus Pushgateway

* Installs prometheus [pushgateway](https://github.com/prometheus/pushgateway)

## NOTE
The original work for this helm chart is present @ [Helm Charts Charts]( https://github.com/helm/charts) Based on the [prometheus-pushgateway]( https://github.com/helm/charts/tree/master/stable/prometheus-pushgateway) chart

```console
$ helm install stable/ibm-prometheus-pushgateway
```

## Introduction

This chart bootstraps a prometheus [pusgateway](http://github.com/prometheus/pushgateway) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Resources Required
The chart deploys pods consuming minimum resources as specified in the resources configuration parameter (default: Memory: 200Mi, CPU: 100m)

## Prerequisites

- Kubernetes 1.7+ 
- Tiller 2.7.2 or later

## Chart Details
Installs prometheus [pushgateway]

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release stable/ibm-prometheus-pushgateway
```

The command deploys pushgateway on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the pushgateway chart and their default values.

|        Parameter        |                                                          Description                                                          |      Default       |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ------------------ |
| `affinity`              | Affinity settings for pod assignment                                                                                          | `{}`               |
| `extraArgs`             | Optional flags for pushgateway                                                                                                | `[]`               |
| `image.repository`      | Image repository                                                                                                              | `machi029/pushgateway-ppc64le` |
| `image.tag`             | Image tag                                                                                                                     | `latest`           |
| `image.pullPolicy`      | Image pull policy                                                                                                             | `IfNotPresent`     |
| `ingress.enabled`       | Enables Ingress for pushgateway                                                                                               | `false`            |
| `ingress.annotations`   | Ingress annotations                                                                                                           | `{}`               |
| `ingress.hosts`         | Ingress accepted hostnames                                                                                                    | `nil`              |
| `ingress.tls`           | Ingress TLS configuration                                                                                                     | `[]`               |
| `resources`             | CPU/Memory resource requests/limits                                                                                           | `{}`               |
| `replicaCount`          | Number of replicas                                                                                                            | `1`                |
| `service.type`          | Service type                                                                                                                  | `ClusterIP`        |
| `service.port`          | The service port                                                                                                              | `9091`             |
| `service.targetPort`    | The target port of the container                                                                                              | `9091`             |
| `serviceAccount.create` | Specifies whether a service account should be created.                                                                        | `true`             |
| `serviceAccount.name`   | Service account to be used. If not set and `serviceAccount.create` is `true`, a name is generated using the fullname template |                    |
| `tolerations`           | List of node taints to tolerate                                                                                               | `{}`               |
| `nodeSelector`          | Node labels for pod assignment                                                                                                | `{}`               |
| `podAnnotations`        | Annotations for pod                                                                                                           | `{}`               |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install --name my-release \
  --set serviceAccount.name=pushgateway  \
    stable/ibm-prometheus-pushgateway
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install --name my-release -f values.yaml stable/ibm-prometheus-pushgateway
```

## Limitations
