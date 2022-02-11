Now we will run the training function, setting the input (using the `-i` flag) to point to the CSV file:

`mlrun run -f trainer -p label_column=label -i dataset=./artifacts/katacoda/dataset.csv --dump`{{execute}}

We use the `--dump` flag to dump the task object in YAML format, you can see the output `results` and `artifacts` in it

> MLRun uses special Data URIs which support different storage options including local or cloud storage, structured data, 
> automated versioning, and security, read more about MLRun [Data Stores and Data Items](https://docs.mlrun.org/en/latest/store/datastore.html). 

**Using MLRun SDK to Run Functions and Pipelines**

Open the `examples.py`{{open}} file, we will run different methods in it:

Run the training function using the SDK:

`python -c 'import examples; examples.run()'`{{execute}}

MLRun support running **hyper-param** jobs in parallel with various strategies and options (read the about MLRun
[Hyper-Param and Iterative jobs](https://docs.mlrun.org/en/latest/hyper-params.html)).
 
We will run a GridSearch with couple of parameters, select the best run (with `max accuracy`) and print the results:

`python -c 'import examples; examples.run_hyper()'`{{execute}}

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
> Pipelines can run locally, over Kubeflow, or inside a CI/CD system (Github Actions, GitLac CI, Jenkins, ..). 