
**Define an MLRun project:**

MLRun Project is a container for all your work on a particular activity/application. All the associated code, functions, 
jobs/workflows and artifacts are organized within the projects.

We can create a `project.yaml`{{open}} file manually, or using the SDK, for example to 
create a project and register a function in it use:

```python
project = mlrun.new_project("katacoda", "./")
project.set_function("gen_iris.py", "gen-iris", 
                     image="mlrun/mlrun", handler="iris_generator")
project.export()
```

Run the data generation function () from the project:

`mlrun run -f gen-iris`{{execute}}

Check out the autput artifacts under `artifacts/katacoda`{{open}}

Run again, this time pass `format=parquet` as arg to the function:

`mlrun run -f gen-iris -x format=parquet --dump`{{execute}}
