You can build automated ML pipelines by chaining function runs, they can incorporate custom 
functions and marketplace functions. Pipelines can also run on a cluster, be scheduled, or run in CI/CD context, 
you can also use pipelines to deploy services or models.

In the following example we run a 3 stage workflow:
- Run the data generator
- Train a model using the data from the generator
- Load and run a serving function from MLRun marketplace

> We run the serving function in simulation mode (mock) for now, since we are not connected to a real cluster

check the `simple_pipe` code in the editor, and run the following:

`python -c 'import examples; examples.simple_pipe()'`{{execute}}

We can the pipeline from the CLI (or the SDK):

`mlrun project -r examples.py -w --handler simple_pipe --engine local .`{{execute}}

> When we run a pipeline MLRun adds extra reporting, visualization, and notifications (e.g. to Slack, Git, ..)
> Pipelines can run locally, over Kubeflow, or inside a CI/CD system (Github Actions, GitLab CI, Jenkins, ..). 

Visual Pipeline Run (in MLRun UI):

<img src="../assets/monitor-workflow.png" width="250x" alt="mlrun-ui">

> MLRun support Real-Time Pipelines for data processing, APIs, and serving, see: 
> [MLRun Real-time Serving Pipelines](https://docs.mlrun.org/en/latest/serving/serving-graph.html) docs.