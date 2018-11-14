# Elasticsearch Exporter

Prometheus exporter for various metrics about ElasticSearch, written in Go.

Learn more: https://github.com/justwatchcom/elasticsearch_exporter

## Note 
The original work for this helm chart is present @ [Helm Charts Charts]( https://github.com/helm/charts) Based on the [elasticsearch-exporter]( https://github.com/helm/charts/tree/master/stable/elasticsearch-exporter) chart

```bash
$ helm install stable/ibm-elasticsearch-exporter
```

## Introduction

This chart creates an Elasticsearch-Exporter deployment on a [Kubernetes](http://kubernetes.io)
cluster using the [Helm](https://helm.sh) package manager.

## Resources Required
The chart deploys pods consuming minimum resources as specified in the resources configuration parameter (default: Memory: 200Mi, CPU: 100m)

## Chart Details
This chart installs Prometheus exporter 

## Prerequisites

- Kubernetes 1.7+ 
- Tiller 2.7.2 or later

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install --name my-release stable/ibm-elasticsearch-exporter
```

The command deploys Elasticsearch-Exporter on the Kubernetes cluster using the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete --purge my-release
```
The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the Elasticsearch-Exporter chart and their default values.

Parameter | Description | Default
--- | --- | ---
`replicaCount` | desired number of pods | `1`
`restartPolicy` | container restart policy | `Always`
`image.repository` | container image repository | `ibmcom/elasticsearch-exporter-ppc64le`
`image.tag` | container image tag | `1.0.2`
`image.pullPolicy` | container image pull policy | `IfNotPresent`
`resources` | resource requests & limits | `{}`
`priorityClassName` | priorityClassName | `nil` |
`nodeSelector` | Node labels for pod assignment | `{}` |
`service.type` | type of service to create | `ClusterIP`
`service.httpPort` | port for the http service | `9108`
`es.uri` | address of the Elasticsearch node to connect to | `localhost:9200`
`es.all` | if `true`, query stats for all nodes in the cluster, rather than just the node we connect to | `true`
`es.indices` | if true, query stats for all indices in the cluster | `true`
`es.timeout` | timeout for trying to get stats from Elasticsearch | `30s`
`es.ssl.enabled` | If true, a secure connection to E cluster is used | `false`
`es.ssl.client.ca.pem` | PEM that contains trusted CAs used for setting up secure Elasticsearch connection |
`es.ssl.client.pem` | PEM that contains the client cert to connect to Elasticsearch |
`es.ssl.client.key` | Private key for client auth when connecting to Elasticsearch |
`web.path` | path under which to expose metrics | `/metrics`

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install --name my-release \
    --set key_1=value_1,key_2=value_2 \
    stable/ibm-elasticsearch-exporter
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
# example for staging
$ helm install --name my-release -f values.yaml stable/ibm-elasticsearch-exporter
```

> **Tip**: You can use the default `values.yaml`

## Limitations
