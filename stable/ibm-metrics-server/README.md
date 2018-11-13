# metric-server
## Introduction

Metrics Server is a cluster-wide aggregator of resource usage data.

## Note 
The original work for this helm chart is present @ [Helm Charts]( https://github.com/helm/charts) Based on the [metrics-server]( https://github.com/helm/charts/tree/master/stable/metrics-server) chart

## Resources Required
The chart deploys pods consuming minimum resources as specified in the resources configuration parameter (default: Memory: 200Mi, CPU: 100m)

## Chart Details
The Chart is used to deploy Metrics Server.

## Prerequisites
- Kubernetes 1.7+
- Tiller 2.7.2 or later 

## Installing the Chart
To install the chart
- helm install --name <release-name> stable/ibm-metrics-server
## Configuration

Parameter | Description | Default
--- | --- | ---
`rbac.create` | Enable Role-based authentication | `true`
`serviceAccount.create` | If `true`, create a new service account | `true`
`serviceAccount.name` | Service account to be used. If not set and `serviceAccount.create` is `true`, a name is generated using the fullname template | ``
`apiService.create` | Create the v1beta1.metrics.k8s.io API service | `true`
`image.repository` | Image repository | default ex.`ibmcom/metrics-server-ppc64le`
`image.tag` | Image tag | `v0.2.1`
`image.pullPolicy` | Image pull policy | `IfNotPresent`

## Limitations

