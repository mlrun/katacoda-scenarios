MLRun Project is a container for all your work on a particular activity/application. Projects hosts `functions`, `workflow`, 
`artifacts`, `secrets`, and more. Projects have access control and can be accessed by one or more people.

We will start with a simple project which contains two local function definitions,
You can create a `project.yaml`{{open}} file manually, or use the SDK, for example to 
create a project and register the two function in it use:

```python
project = mlrun.new_project("katacoda", "./")
project.set_function("gen_iris.py", "gen-iris", kind="local")
project.set_function("trainer.py", "gen-iris", 
                     handler="train", kind="local")
project.export()
```

The MLRun `function` objects define the source code, extra packages, runtime configuration and desired 
resources (cpu, gpu, mem, storage, ..), for now we will run basic `local` functions.  

Run the data generation project function `gen-iris` (see `gen_iris.py`{{open}}):

`mlrun run -f gen-iris`{{execute}}

Check out the output CSV file in `artifacts/katacoda/dataset.csv`{{open}}

Run again, this time pass `format=parquet` as arg to the function:

`mlrun run -f gen-iris -p format=parquet`{{execute}}

You can see that the dataset is now created in `parquet` format

> The `-p` flag is used to specify parameters, see `mlrun run --help` for more command options
