Now we will run the training function, setting the input (using the `-i` flag) to point to the CSV file:

`mlrun run -f trainer -p label_column=label -i dataset=./artifacts/katacoda/iris_dataset.csv --dump`{{execute}}

We use the `--dump` flag to dump the task object in YAML format, you can see the output `results` and `artifacts` in it

Functions can be executed through the SDK, open the `examples.py`{{open}} file:

Run the training function using the SDK:

`python -c 'import examples; examples.run()`{{execute}}

MLRun support running hyper-param jobs in parallel with various strategies (read the about []()), 
we will run a GridSearch with couple of parameters and print the results:

`python -c 'import examples; examples.run_hyper()`{{execute}}

You can build automated ML pipelines by chaining function runs, they can incorporate custom 
functions and marketplace functions. Pipelines can also run on a cluster, be scheduled, or run in CI/CD context, 
you can also use pipelines to deploy services or models.

In the following example we import a serving function object and run/test it in simulation mode for now, 
see the code and click on the nect command to execute it:

`python -c 'import examples; examples.simple_pipe()`{{execute}}

running a pipeline from the CLI:

`mlrun project -r examples.py -w --handler simple_pipe --engine local .`{{execute}}

