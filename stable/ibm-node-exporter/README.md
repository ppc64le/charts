# Node Exporter

[Node Exporter](https://prometheus.io/) An open-source monitoring system with a dimensional data model, flexible query language, efficient time series database and modern alerting approach.

```console
$ helm install stable/ibm-node-exporter
```

## Prerequisites

- Kubernetes 1.7+
- Tiller 2.7.2 or later

## Resources Required
The chart deploys pods consuming minimum resources as specified in the resources configuration parameter (default: Memory: 200Mi, CPU: 100m)

## Introduction

This chart bootstraps a [Node Exporter](https://github.com/prometheus/node_exporter) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.


## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm intall --name my-release stable/ibm-node-exporter
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Chart Details
This chart bootstraps a [Node Exporter](https://hub.docker.com/r/ibmcom/node-exporter-ppc64le/) deployment on a [Kubernetes](http://kubernetes.io) cluster


## Configuration

The following table lists the configurable parameters of the Node Exporter chart and their default values.

|      Parameter            |          Description            |                         Default                         |
|---------------------------|---------------------------------|---------------------------------------------------------|
| `image`                   | The image to pull and run       | ibmcom/node-exporter-ppc64le:v0.15.2                    |
| `imagePullPolicy`         | Image pull policy               | `Always` if `imageTag` is `latest`, else `IfNotPresent` |
| `node`                    | Specify what architecture Node  | `amd64` or `ppc64le`                                    |


The above parameters map to `ibm-node-exporter` params.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. 

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml stable/ibm-node-exporter
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Limitations
