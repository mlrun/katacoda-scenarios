
We will now multiple jobs in prallel for **hyperparameters tuning**. We will run a `GridSearch` with couple of 
parameters, select the best run with respect to the `max accuracy`. (read more about MLRun 
[Hyper-Param and Iterative jobs](https://docs.mlrun.org/en/latest/hyper-params.html)).

For basic usage we can run our hyperparameters tuning job by using the keywords arguments: 

* `hyperparams` for the hyperparameters options and values of choice.
* `selector` for specifying how to select the best model.

```python
hp_tuning_run = project.run_function(
    "trainer", 
    inputs={"dataset": gen_data_run.outputs["dataset"]}, 
    hyperparams={
        "n_estimators": [100, 500, 1000], 
        "max_depth": [5, 15, 30]
    }, 
    selector="max.accuracy", 
    local=True
)
```{{execute}}

The returned run object in this case represents the `parent` (and the **best** result), we can also access the 
individual child runs (called iterations in the MLRun UI).

## Review the Results

When running Hyper-param job the job `results` tab showes us the list and marks the best run:

<img src="./assets/results.png" alt="results" width="400"/>

We can also view results by printing the artifact `iteration_results`:

```hp_tuning_run.artifact("iteration_results").as_df()```{{execute}}

MLRun also generates a `parallel coordinates plot` for the run, you can view it in the MLRun UI!

![parallel_coordinates](./assets/parallel_coordinates.png)

