Now we will run the training function, setting the input (using the `-i` flag) to point to the CSV file:

`mlrun run -f trainer -p label_column=label -i dataset=./artifacts/katacoda/dataset.csv --dump`{{execute}}

We use the `--dump` flag to dump the task object in YAML format, you can see the output `results` and `artifacts` in it

> MLRun uses special Data URIs which support different storage options including local or cloud storage, structured data, 
> **MLRun Feature Store** objects, automated versioning, and security, read more about MLRun [Data Stores and Data Items](https://docs.mlrun.org/en/latest/store/datastore.html). 

Inside the function we use the `DataItem` object which allow us to access data regardless of its type, 
physical location, format, etc. The `dataset.as_df()` call simply returns a dataframe without the headache of using 
specific data backend APIs or format.

**Using MLRun SDK to Run Functions**

Open the `examples.py`{{open}} file, we will run different methods in it:

Run the training function using the SDK:

`python -c 'import examples; examples.run()'`{{execute}}

When we run a function via the SDK (`run_function()`) the run object is returned, which allows us to access 
run metadata, state, and results while its running (some jobs can run for hours). 

Run object has the following methods/properties:
- `uid()` &mdash; returns the unique ID.
- `state()` &mdash; returns the last known state.
- `show()` &mdash; shows the latest job state and data in a visual Jupyter widget (with hyperlinks and hints).
- `outputs` &mdash; returns a dictionary of the run results and artifact paths.
- `logs(watch=True)` &mdash; returns the latest logs.
    Use `Watch=False` to disable the interactive mode in running jobs.
- `artifact(key)` &mdash; returns an artifact for the provided key (as `DataItem` object).
- `output(key)` &mdash; returns a specific result or an artifact path for the provided key.
- `wait_for_completion()` &mdash; wait for async run to complete
- `refresh()` &mdash; refresh run state from the db/service
- `to_dict()`, `to_yaml()`, `to_json()` &mdash; converts the run object to a dictionary, YAML, or JSON format (respectively).

**MLRun Hyper-param and Iterative Tasks**

MLRun support running **hyper-param** jobs in parallel with various strategies and options (read the about MLRun
[Hyper-Param and Iterative jobs](https://docs.mlrun.org/en/latest/hyper-params.html)).
 
We will run a GridSearch with couple of parameters, select the best run (with `max accuracy`) and print the results:

`python -c 'import examples; examples.run_hyper()'`{{execute}}

> Hyper-param runs also generate an interactive parallel coordinates plot, check it out 

**MLRun Auto-Logging & MLOps Automation**

In the training code we can spot the line with `apply_mlrun(model=model, ...)`, this single line adds a complete set 
of (framework specific) MLOps automation tasks such as:
* Auto logging and versioning of parameters, results, artifacts, models, etc.
* Workload auto-scaling + GPU optimizations (when running over containers)
* Glueless pipeline and CI/CD integration
* External reporting and profiling (e.g. to Tensorboard)
* Control model format conversions and optimizations, and more..

You can notice that our run output include the following auto generated results/artifacts:

```python
{'accuracy': 1.0,
 'auc-macro': 1.0,
 'auc-micro': 1.0,
 'auc-weighted': 1.0,
 'best_iteration': 1,
 'confusion-matrix': './artifacts/katacoda/confusion-matrix.html',
 'f1_score': 1.0,
 'feature-importance': './artifacts/katacoda/feature-importance.html',
 'iteration_results': './artifacts/katacoda/iteration_results.csv',
 'model': 'store://artifacts/katacoda/my_model:e68afd8d9a2d4dde93ab2beea1c135e8',
 'parallel_coordinates': './artifacts/katacoda/parallel_coordinates.html',
 'precision_score': 1.0,
 'recall_score': 1.0,
 'roc-curves': './artifacts/katacoda/1/roc-curves.html',
 'test_set': 'store://artifacts/katacoda/trainer-train_test_set:e68afd8d9a2d4dde93ab2beea1c135e8'}
```
