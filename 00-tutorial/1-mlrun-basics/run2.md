Function parameters are tracked and can be manipulated via the SDK/CLI.
Run the function again, this time pass the `format=parquet` arg:

`mlrun run -f gen-iris -p format=parquet --local`{{execute}}

You can see that this time the dataset is created in `parquet` format

> `-p` is used to specify parameters, see `mlrun run --help` for more flags

Results can be accessed via the CLI, SDK, or UI, click the next line:

`mlrun get run -p coda-[[HOST_SUBDOMAIN]]`{{execute}}

**Explore progress, results and artifacts - [Open MLRun UI](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]/mlrun/projects/coda-[[HOST_SUBDOMAIN]]/jobs/monitor-jobs/gen-iris)**

Zoom into the specific run and select the `artifacts` tab

<img src="./assets/mlrun-ui.png" alt="mlrun-ui" width="400"/>

> Note: The UI was installed as local container, and is not fully features like k8s based installation