The parameters used for the functions are tracked and can be manipulated via the SDK/CLI.
Run the function again, this time pass `format=parquet` as arg to the function:

`mlrun run -f gen-iris -p format=parquet --local`{{execute}}

You can see that the dataset is now created in `parquet` format

> The `-p` flag is used to specify parameters, see `mlrun run --help` for more command options

Results can be accessed via the CLI, SDK, or UI, click the next line:

`mlrun get run -p katacoda`{{execute}}

**Explore run progress, results and artifacts in the UI**

MLRun has a rich UI for tracking runs and artifacts:

![MlRun UI](./assets/mlrun-ui.png)

> Note: The UI is is installed on the k8s cluster or the managed MLRun service, it can also be installed as local docker image

