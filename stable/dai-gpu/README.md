# H2O  DriverlessAI  HELM Chart 

## Introduction  
H2O Driverless AI is an artificial intelligence (AI) platform that automates some of the most difficult data science and machine learning workflows such as feature engineering, model validation, model tuning, model selection and model deployment. It aims to achieve highest predictive accuracy, comparable to expert data scientists, but in much shorter time thanks to end-to-end automation. Driverless AI also offers automatic visualizations and machine learning interpretability (MLI). Especially in regulated industries, model transparency and explanation are just as important as predictive performance.

For Licensing information contact sales@h2o.ai

## Chart Details
This chart creates a service based on the public opsh2oai/dai image. This creates a DriverlessAI instance, and supports an additional jupyter environment for interacting with the DriverlessAI process.
GPUs are mounted and utilizaed using the alpha.kubernetes.io/nvidia-gpu property.

## Prerequisites
This process is inteded to run on a GPU capable system that supports CUDA 8 or 9
This process utilizes NVIDIA's persistence mode.  Enable the drivers persistence mode by running the command "sudo nvidia-smi -pm 1" on the host system.

## Resources Required
You should provide DAI with enough memory to hold 2x the size of your largest dataset 

## Installing the Chart
The default values for this chart is to claim 10g of memory and one GPU
These can be changed by setting 
Values.resources.limits.gpu
Values.resources.limits.memory
Values.resources.requests.gpu
Values.resources.requests.memory


## Configuration
The major source of configuration for this chart is in memory size and the number of GPUs to utilize.

## Limitations
Importing data from HDFS to DAI is not currently supported with this helm chart.

