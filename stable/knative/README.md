# Knative

This chart installs Knative components for Build, Serving and Eventing.

## Introduction

- Visit [knative build](./charts/build/README.md) for more information about Build.
- Visit [knative eventing](./charts/eventing/README.md) for more information about Eventing.
- Visit [knative serving](./charts/serving/README.md) for more information about Serving.

## Chart Details

In its default configuration, this chart will create the following Kubernetes resources:

- Internal Services
    - controller, webhook

- Knative Build Pods:
    - Deployments: controller, webhook

- Knative Serving Pods:
    - Deployments: kube-state-metrics, knative-ingressgateway
    - DaemonSet: fluent-ds
    - ServiceAccounts: elasticsearch-logging, fluentd-ds, kube-state-metrics, node-exporter, prometheus-system, autoscaler, controller
    - metric: revisionrequestcount, revisionrequestduration, revisionrequestsize, revisionresponsesize

- Knative Eventing Pods:
    - Deployments: in-memory-channel-controller, in-memory-channel-dispatcher, eventing-controller, webhook

- Custom Resource Definitions:
    - buildtemplates.build.knative.dev
    - builds.build.knative.dev
    - clusterbuildtemplates.build.knative.dev
    - subscriptions.eventing.knative.dev
    - channels.eventing.knative.dev
    - revisions.serving.knative.dev
    - clusteringresses.networking.internal.knative.dev
    - configurations.serving.knative.dev
    - services.serving.knative.dev
    - podautoscalers.autoscaling.internal.knative.dev
    - routes.serving.knative.dev
    - images.caching.internal.knative.dev

- HorizontalPodAutoscaler:
    - knative-ingressgateway

## Prerequisites

- Knative requires a Kubernetes cluster v1.10 or newer with the
[MutatingAdmissionWebhook admission controller](https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/#how-do-i-turn-on-an-admission-controller)
enabled.
- Requires kubectl v1.10+.
- Istio - You should have Istio installed on your Kubernetes cluster. If you do not have it installed already you can do so by following the steps mentioned here https://github.com/IBM/charts/tree/master/stable/ibm-istio 

### Container image security requirements

If Container Image Security is enabled, you will not be able to download non-trusted container images. If this is the case, please add the following to the trusted registries at the cluster level, so that knative container images can be pulled during chart installation:


- docker.io/ibmcom/knative-build-cmd-controller-ppc64le
- docker.io/ibmcom/knative-build-cmd-creds-init-ppc64le
- docker.io/ibmcom/knative-build-cmd-git-init-ppc64le
- docker.io/ibmcom/knative-build-cmd-nop-ppc64le
- docker.io/ibmcom/knative-build-cmd-webhook-ppc64le

- docker.io/ibmcom/knative-serving-cmd-activator-ppc64le
- docker.io/ibmcom/knative-serving-cmd-autoscaler-ppc64le
- docker.io/ibmcom/knative-serving-cmd-queue-ppc64le
- docker.io/ibmcom/knative-serving-cmd-controller-ppc64le
- docker.io/ibmcom/knative-serving-cmd-webhook-ppc64le

- docker.io/ibmcom/knative-eventing-cmd-controller-ppc64le
- docker.io/ibmcom/knative-eventing-cmd-webhook-ppc64le
- docker.io/ibmcom/knative-eventing-pkg-controller-eventing-inmemory-controller-ppc64le
- docker.io/ibmcom/knative-eventing-cmd-fanoutsidecar-ppc64le
- docker.io/ibmcom/knative-eventing-pkg-provisioners-kafka-cmd-controller-ppc64le
- docker.io/ibmcom/knative-eventing-pkg-provisioners-kafka-cmd-dispatcher-ppc64le


- docker.io/ibmcom/cloud-builders-gcs-fetcher-ppc64le
- docker.io/ibmcom/fluentd-elasticsearch-ppc64le
- docker.io/ibmcom/elasticsearch-ppc64le
- docker.io/googlecontainer/addon-resizer-ppc64le
- docker.io/ibmcom/kube-rbac-proxy-ppc64le
- docker.io/ibmcom/kube-state-metrics-ppc64le
- docker.io/ibmcom/grafana-ppc64le
- docker.io/ibmcom/node-exporter
- docker.io/ibmcom/prometheus-ppc64le
- docker.io/ibmcom/zipkin
- docker.io/ibmcom/istio-proxy

Follow [image security enforcement using ICP](https://www.ibm.com/support/knowledgecenter/SSBS6K_3.1.1/manage_images/image_security.html) for more information.

## Installing the Chart

Please ensure that you have reviewed the [prerequisites](#prerequisites).

To install the chart using helm cli:

Install Knative

```bash
$ helm install ./knative --name <my-release> [--tls]
```

The command deploys Knative on the Kubernetes cluster in the default configuration.  The [configuration](#configuration) section lists the parameters that can be configured during installation.

You can use the command ```helm status <my-release> [--tls]``` to get a summary of the various Kubernetes artifacts that make up your Knative deployment.

### Configuration

[Values.yaml](./values.yaml) outlines the configuration options that are supported by this chart.
To configure the individual components, change the values located within each subchart.

### Verifying the Chart

To verify all Pods are running, try:
```bash
$ helm status <my-release> [--tls]
```

## Uninstalling the Chart

To uninstall/delete the deployment:
```bash
$ helm delete <my-release> --purge [--tls]
```

To uninstall/delete the crds:
```bash
$ kubectl delete --filename knative/all-crds.yaml
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Limitations

Look inside each subchart to view the their limitations.

## Documentation

To learn more about Knative in general, see the [Overview](https://github.com/knative/docs/blob/master/README.md).

# Support

If you're a developer, operator, or contributor trying to use Knative, the
following resources are available for you:

- [Knative Users](https://groups.google.com/forum/#!forum/knative-users)
- [Knative Developers](https://groups.google.com/forum/#!forum/knative-dev)

For contributors to Knative, we also have [Knative Slack](https://slack.knative.dev).
