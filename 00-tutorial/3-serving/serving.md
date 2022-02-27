Installing MLRun package and sklearn, this may take a few minutes!: `> pip install mlrun[api] scikit-learn`

This part of the tutorial walks you through the steps for creating, testing, and deploying serving pipelines 

**MLRun Serving Pipelines** allow to easily build serverless pipelines using Nuclio real-time serverless engine, and deploy them anywhere.
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
2. Writing and Testing a Simple Serving Class
3. Deploying the Model-Serving Function (to Nuclio)
4. Using the Live Model-Serving Function (via UI or API)
