Instal MLRun package and sklearn (using: `pip install mlrun`)(this may take a few minutes!)

We will start by reviewing the MLRun project and function objects:

**MLRun Serving Pipelines**

This part of the tutorial walks you through the steps for creating, deploying, and testing a model-serving function 
using MLRun serving and Nuclio runtimes.

MLRun serving allow to easily build real-time serverless pipelines and use the Nuclio real-time serverless engine, which can be deployed anywhere.
[Nuclio](https://nuclio.io/) is a high-performance open-source "serverless" framework that's focused on data, I/O, and compute-intensive workloads.

The real-time pipelines can handle events and data processing across structured and unstructured (text, images, video) data, 
model serving, ensembles, and various built-in or custom activities.
Simple model serving classes can be written in Python or be taken from a set of pre-developed ML/DL classes.
Serving pipelines are tightly integrated with [MLRun Feature Store](https://docs.mlrun.org/en/stable/feature-store/feature-store.html) 
for real-time feature enrichment and processing.

The MLRun serving supports the full application life cycle;
this includes auto generation of microservices, APIs, auto-scaling, model logging and monitoring, and configuration management.
For more details and examples, see the [MLRun Serving Graphs](https://docs.mlrun.org/en/stable/serving/serving-graph.html) 
and [Model Monitoring](https://docs.mlrun.org/en/stable/model_monitoring/index.html) documentation.

The tutorial consists of the following steps:

1. Setup and Configuration
2. Writing A Simple Serving Class
3. Deploying the Model-Serving Function (Service)
4. Using the Live Model-Serving Function
5. Viewing the Nuclio Serving Function on the Dashboard
