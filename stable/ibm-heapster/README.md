# Heapster

## Introduction
[Heapster](https://github.com/kubernetes/heapster) enables Container Cluster Monitoring and Performance Analysis. It collects and interprets various signals like compute resource usage, lifecycle events, etc, and exports cluster metrics via REST endpoints.
The Chart can also enable eventer, which can send the kubernetes event logs to a remote location.

## Chart Details
[Heapster](https://github.com/kubernetes/heapster) enables Container Cluster Monitoring and Performance Analysis.

## Note 
The original work for this helm chart is present @ [Helm Charts Charts]( https://github.com/helm/charts) Based on the [Heapster]( https://github.com/helm/charts/tree/master/stable/heapster) chart

## Resources Required
The chart deploys pods consuming minimum resources as specified in the resources configuration parameter (default: Memory: 200Mi, CPU: 100m)

## Prerequisites
Kubernetes 1.7+  
-Tiller 2.7.2 or later

## Note 

The original work for this helm chart is present @ [Helm Charts Charts]( https://github.com/helm/charts) Based on the [Heapster]( https://github.com/helm/charts/tree/master/stable/heapster) chart.

## QuickStart

```bash
$ helm install stable/ibm-heapster
```

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install --name my-release stable/ibm-heapster
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release --purge
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The default configuration values for this chart are listed in `values.yaml`.

| Parameter                             | Description                                                  | Default                                           |
|---------------------------------------|-------------------------------------                         |---------------------------------------------------|
| `image.repository`                    | Repository for container image                               | ibmcom/heapster-ppc64le             |
| `image.tag`                           | Container image tag                                          | v1.4.0                                            |
| `image.pullPolicy`                    | Image pull policy                                            | IfNotPresent                                      |
| `service.name`                        | Service port name                                            | api                                               |
| `service.type`                        | Type for the service                                         | ClusterIP                                         |
| `service.externalPort`                | Service external port                                        | 8082                                              |
| `service.internalPort`                | Service internal port                                        | 8082                                              |
| `service.annotations`                 | Service annotations, specified as a map                      | `{}`                                              |
| `resources.limits`                    | Server resource  limits                                      | limits: {cpu: 100m, memory: 128Mi}                |
| `resources.requests`                  | Server resource requests                                     | requests: {cpu: 100m, memory: 128Mi}              |
| `command`                             | Commands for heapster pod                                    | "/heapster --source=kubernetes.summary_api:''     |
| `rbac.create`                         | Bind system:heapster role                                    | false                                             |
| `rbac.serviceAccountName`             | existing ServiceAccount to use (ignored if rbac.create=true) | default                                           |
| `resizer.enabled`                     | If enabled, scale resources                                  | true                                              |
| `eventer.enabled`                     | If enabled, start eventer                                    | false                                             |
| `podAnnotations`                      | Pod Annotations to be added to the heapster Pod              | `{}`                                              |
| `nodeSelector`                        | Node labels for pod assignment                               | `{}`                                              |

The table below is only applicable if `resizer.enabled` is `true`. More information on resizer can be found [here](https://github.com/kubernetes/contrib/blob/master/addon-resizer/README.md).

| Parameter                             | Description                         | Default                                           |
|---------------------------------------|-------------------------------------|---------------------------------------------------|
| `resizer.image.repository`            | Repository for container image      | k8s.gcr.io/addon-resizer                          |
| `resizer.image.tag`                   | Container image tag                 | 2.1                                               |
| `resizer.image.pullPolicy`            | Image pull policy                   | IfNotPresent                                      |
| `resizer.resources.limits`            | Server resource  limits             | limits: {cpu: 50m, memory: 90Mi}                  |
| `resizer.resources.requests`          | Server resource requests            | requests: {cpu: 50m, memory: 90Mi}                |
| `resizer.flags`                       | Flags for pod nanny command         | Defaults set in values.yaml                       |

The table below is only applicable if `eventer.enabled` is `true`. More information on eventer can be found
[here]https://github.com/kubernetes/heapster/blob/master/docs/overview.md

| Parameter                             | Description                              | Default                                           |
|---------------------------------------|------------------------------------------|---------------------------------------------------|
| `eventer.flags`                       | Flags for eventer command                | Defaults set in values.yaml                       |
| `eventer.resources.limits`            | Server resource  limits                  | requests: {}                                      |
| `eventer.resources.requests`          | Server resource requests                 | requests: {}                                      |
| `eventer.resizer.enabled`             | If enabled, scale resources              | true                                              |
| `eventer.resizer.flags`               | Flags for pod nanny command for eventer  | Defaults set in values.yaml                       |
| `eventer.resizer.resources.limits`    | Server resource limits                   | requests: {}                                      |
| `eventer.resizer.resources.requests`  | Server resource requests                 | requests: {}                                      |

## Limitations
