The parameters used for the functions are tracked and can be manipulated via the SDK/CLI.
Run the function again, this time pass `format=parquet` as arg to the function:

`mlrun run -f gen-iris -p format=parquet`{{execute}}

You can see that the dataset is now created in `parquet` format

> The `-p` flag is used to specify parameters, see `mlrun run --help` for more command options

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

Results can be accessed via the CLI, SDK, or UI, click the next line:

`mlrun get run -p katacoda`{{execute}}

Or in the UI:

![MlRun UI](https://docs.mlrun.org/en/latest/_static/images/mlrun-quick-start/train-artifacts.png)


> Note: UI is usually runs on the k8s service, it can also be installed as local docker image
