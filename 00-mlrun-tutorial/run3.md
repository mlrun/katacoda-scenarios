Now we will run the training function, and set the input to point to the CSV file (using the `-i` flag):

`mlrun run -f trainer -p label_column=label -i dataset=./artifacts/katacoda/dataset.csv --local`{{execute}}

> MLRun uses special Data URIs which support different data sources and **MLRun Feature Store** objects, 
> data versioning, and security, read more about MLRun [Data Stores and Data Items](https://docs.mlrun.org/en/latest/store/datastore.html). 

Inside the function (see `trainer.py`{{open}}) we use the `DataItem` object which allow us to access data regardless of its type, 
physical location, format, etc. 

The `dataset.as_df()` call simply returns a dataframe without the headache of using 
specific data backend APIs or format.

**MLRun Auto-Logging & MLOps Automation**

In the training code we can spot the line with `apply_mlrun(model=model, ...)`.
This will provide **codeless** Auto logging and versioning of parameters, results, artifacts, models, etc.

The `apply_mlrun()` provides additional (framework specific) MLOps automation tasks such as:
* Workload auto-scaling + GPU optimizations (when running over containers)
* Glueless pipeline and CI/CD integration
* External reporting and profiling (e.g. to Tensorboard)
* Control model format conversions and optimizations, and more.
