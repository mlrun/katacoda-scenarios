Function parameters are tracked and can be manipulated via the SDK/CLI.
Run the function again, this time pass the `format=parquet` arg:

`mlrun run -f gen-iris -p format=parquet --local`{{execute}}

You can see that this time the dataset is created in `parquet` format

> `-p` is used to specify parameters, see `mlrun run --help` for more flags

Results can be accessed via the CLI, SDK, or UI, click the next line:

`mlrun get run -p coda-[[HOST_SUBDOMAIN]]`{{execute}}

**Explore progress, results and artifacts in MLRun UI**

<img src="./images/mlrun-ui.png" alt="mlrun-ui" width="400"/>

> Note: The UI is installed on the remote k8s cluster or the managed MLRun service, it can be installed as local docker image

<details><summary>Open to view Data Dictionary</summary>

|Feature|Format|Type|Description|
|---|---|---|---|
|**Id**|*integer*|Nominal|Identifier for each property.|
|**PID**|*integer*|Nominal|Parcel identification number - can be usedwith city web site for parcel review.|
|**MS SubClass**|*integer*|Nominal|Identifies the type of dwellinginvolved in the sale. Type is coded, please refer to full datadocumentation|
|**MS Zoning**|*string*|Nominal|Identifies the general zoningclassification of the sale.|
</details>
