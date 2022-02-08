Installing MLRun package (with the API service) using the following command:

`pip install mlrun[api]`

set mlrun environment vars (from `/root/editor/local.env`{{open}}):

`export MLRUN_ENV_FILE=/root/editor/local.env`{{execute}}

run MLRun DB/API service in the background:

`mlrun db &&`{{execute}}

**Define an MLRun project:**

MLRun Project is a container for all your work on a particular activity/application. All the associated code, functions, 
jobs/workflows and artifacts are organized within the projects.

We can create a `project.yaml` file manually, or using the SDK, for example to 
create a project and register a function in it use:

```python
project = mlrun.new_project("katacoda", "./")
project.set_function(
    "gen_iris.py", "gen-iris", image="mlrun/mlrun", handler="iris_generator",
)
project.save()
```

See the `/root/editor/project.yaml`{{open}} file

