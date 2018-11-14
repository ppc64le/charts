# TensorFlow Notebook Helm Chart

TensorFlow is an open source software library for numerical computation using data flow graphs, and tensorboard is the tool visualizing TensorFlow programs. Using Jupyter notebook to get into TensorFlow and develop models is the great way for data scientist. With these three tools you are able to start your machine learning work in two minutes.

-  https://www.tensorflow.org
-  https://www.tensorflow.org/programmers_guide/summaries_and_tensorboard
-  http://jupyter.org/

## Prerequisites

- Kubernetes cluster v1.7+ 
- Tiller 2.7.2 or later

## Resources Required

The chart deploys pods consuming minimum resources as specified in values.yaml file.

## Introduction

This chart will deploy Jupyter Notebook with TensorFlow

## Chart Details

This chart will deploy the followings:

- Jupyter Notebook with TensorFlow
- Tensorboard

## Note
The original work for this helm chart is present @ [Helm Charts Charts]( https://github.com/helm/charts) Based on the [tensorflow-notebook]( https://github.com/helm/charts/tree/master/stable/tensorflow-notebook) chart.

## Installing the Chart

* To install the chart with the release name `notebook`:

  ```bash
  $ helm install --name notebook stable/ibm-tensorflow-notebook
  ```

* To install with custom values via file :
  
  ```
  $ helm install  --values values.yaml  --name notebook  stable/ibm-tensorflow-notebook
  ```
  
  Below is an example of the custom value file values.yaml with GPU support.
  
  ```
  jupyter:
    image:
      repository: ibmcom/ibm-tensorflow-ppc64le
      tag: 1.3.1-gpu
      pullPolicy: IfNotPresent
    password: tensorflow
    resources:
      limits:
        nvidia.com/gpu: 1
    requests:
        nvidia.com/gpu: 1
  tensorboard: 
    image:   
      repository: ibmcom/tensorflow-ppc64le 
      tag: 1.3.1-gpu
      pullPolicy: IfNotPresent
  service:
    type: LoadBalancer
  ```


## Run TensorFlow Example [tensorboard_basic.ipynb](https://github.com/cheyang/TensorFlow-Examples/blob/master/notebooks/4_Utils/tensorboard_basic.ipynb)

> Notice: you should set the log_path  `/output/training_logs`

![](jupyter.jpg)

## Check the TensorBoard

![](tensorboard.jpg)

## Uninstalling the Chart

* To uninstall/delete the `notebook` deployment:

	```bash
	$ helm delete notebook
	```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the Service Tensorflow Development
chart and their default values.

| Parameter | Description | Default |
|-----------|-------------|---------|
| `jupyter.image.repository` | TensorFlow Development image repository | `ibmcom/tensorflow-ppc64le` |
| `jupyter.image.tag` | TensorFlow Development image tag | `1.3.1-gpu` |
| `jupyter.password` | The password to access jupyter | `mytest` |
| `jupyter.image.pullPolicy` | image pullPolicy for the  jupyter | `IfNotPresent` |
| `tensorboard.image.repository` | TensorFlow Development image repository | `ibmcom/tensorflow-ppc64le` |
| `tensorboard.image.tag` | TensorFlow Development image tag | `1.3.1-gpu` |
| `tensorboard.image.pullPolicy` | image pullPolicy for the  tensorboard | `IfNotPresent` |
| `resources` | Set the resource to be allocated and allowed for the Pods | `{}` |
| `service.type` | service type | `LoadBalancer` |

## Limitations
