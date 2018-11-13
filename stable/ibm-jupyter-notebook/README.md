# Jupyter Notebook

[Jupyter Notebook](https://jupyter-notebook.readthedocs.io/)The Jupyter notebook is a web-based notebook environment for interactive computing.

```console
$ helm install stable/ibm-jupyter-notebook
```

## Prerequisites

- Kubernetes 1.7+                        
- Tiller 2.7.2 or later

## Resources Required
The chart deploys pods consuming minimum resources as specified in the resources configuration parameter (default: Memory: 200Mi, CPU: 100m)

## Introduction

This chart bootstraps a [Jupyter Notebook](https://github.com/jupyter/notebook) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.


## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm intall --name my-release stable/ibm-jupyter-notebook
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Chart Details
This chart bootstraps a [Jupyter Notebook](https://hub.docker.com/r/ppc64le/jupyter-base-notebook/) deployment on a [Kubernetes](http://kubernetes.io) cluster


## Configuration

The following table lists the configurable parameters of the Jupyter Notebook chart and their default values.

|      Parameter            |          Description            |                         Default                         |
|---------------------------|---------------------------------|---------------------------------------------------------|
| `image`                   | The image to pull and run       | ppc64le/jupyter-base-notebook:latest                    |
| `imagePullPolicy`         | Image pull policy               | `Always` if `imageTag` is `latest`, else `IfNotPresent` |
| `nodeSelector`            | Specify what architecture Node  | `amd64` or `ppc64le`                                    |


The above parameters map to `ibm-jupyter-notebook` params.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. 

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml stable/ibm-jupyter-notebook
```

> **Tip**: You can use the default `values.yaml`

## Limitations
