Run the data generation function `gen-iris` (see `gen_iris.py`{{open}}):

`mlrun run -f gen-iris --local`{{execute}}

> `--local` indicate we run locally (not over the cluster)

Check out the output CSV file in `artifacts/katacoda/dataset.csv`{{open}}

We can run the function using the regular `Python` command, notice the use of MLRun `with mlrun.get_or_create_ctx()` in the code, 
it wraps your code allowing to automatically track the execution, try the following command:

`python gen_iris.py`{{execute}}

Running `python` however, doesnt allow data/parameter injection and status tracking. 

**Using MLRun execution context**

functions can specify a `context` input or get it using `get_or_create_ctx()`,
the context allow us to read task metadata (name, uid, ..), parameters, secrets, etc.
The context also provide APIs to log `results`, `artifacts`, `datasets`, `models`, `text`, and `labels` 
(for tagging/searching across runs).

Common context methods (read more under [MLRun execution context](https://docs.mlrun.org/en/latest/api/mlrun.execution.html)):
```python
get_secret(key: str)   # get the value of a secret
logger.info("started experiment..")  # textual logs
log_result(key: str, value)  # log simple values
set_label(key, value)  # set a label tag for that task
# log an artifacts (body or local file)
log_artifact(key, body=None, local_path=None, ...) 
log_dataset(key, df, ...) # log a dataframe object
log_model(key, ...) # log a model object
```
