
Please wait until the (pip) install is completed and MLRun DB/API service has started before moving forward !

**Initialize MLRun Project and Generate Data**

load the MLRun project: 

`project = mlrun.load_project("./", init_git=True)`{{execute}}

run the data generation function `gen-iris` as we learned in the previous scenario:

`gen_data_run = project.run_function("gen-iris", local=True)`{{execute}}

**Train The Model**

Now, we wish to train a `RandomForestClassifier` model on our training data. For that, 
we wrote the following training function: `trainer.py`{{open}}

We execute our training function with specific data inputs and parameters, those will be recorded and versioned with our run. 
Our training function is already set in the project, so all we need to do is use our dataset from the `gen_data_run` outputs:

```python
trainer_run = project.run_function(
    "trainer", 
    inputs={"dataset": gen_data_run.outputs["dataset"]}, 
    params = {"n_estimators": 100, "max_depth": 5},
    local=True
)
```{{execute}}
