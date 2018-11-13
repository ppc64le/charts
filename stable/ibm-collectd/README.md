# collectd-exporter
An exporter for collectd. It accepts collectd's binary network protocol as sent by collectd's network plugin and metrics in JSON format via HTTP POST as sent by collectd's write http plugin, and transforms and exposes them for consumption by Prometheus.

```console
$ helm install stable/ibm-collectd
```
## Prerequisites

- Kubernetes 1.7+ 
- Tiller 2.7.2 or later

## Resources Required
The chart deploys pods consuming minimum resources as specified in the resources configuration parameter (default: Memory: 200Mi, CPU: 100m)

## Introduction

This chart bootstraps a [ibm-collectd](https://hub.docker.com/r/ibmcom/collectd-exporter-ppc64le/) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.


## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release stable/ibm-collectd
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Chart Details
This chart bootstraps a [ibm-collectd](https://hub.docker.com/r/ibmcom/collectd-exporter-ppc64le/) deployment on a [Kubernetes](http://kubernetes.io) cluster


## Configuration

The following table lists the configurable parameters of the collectd chart and their default values.

|      Parameter            |          Description            |                         Default                         |
|---------------------------|---------------------------------|---------------------------------------------------------|
| `image`                   | The image to pull and run       | ibmcom/collectd-exporter-ppc64le:latest                 |
| `imagePullPolicy`         | Image pull policy               | `Always` if `imageTag` is `latest`, else `IfNotPresent` |
| `nodeSelector`            | Specify what architecture Node  | `amd64` or `ppc64le`                                    |


The above parameters map to `ibm-collectd` params.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. 

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml stable/ibm-collectd
```

> **Tip**: You can use the default `values.yaml`

## Limitations
