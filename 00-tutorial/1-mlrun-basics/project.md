Installing MLRun package (with the API service) and sklearn using the following command:

`pip install mlrun[api] sklearn plotly`

The install may take a few minutes !

We will start by reviewing the MLRun project and function objects:

**MLRun project**

[MLRun **Project**](https://docs.mlrun.org/en/latest/projects/overview.html) is a container for all your work on a particular activity/application. Projects hosts `functions`, `workflow`, 
`artifacts`, `secrets`, and more. Projects have access control and can be accessed by one or more people, they are usually assosiated with a GIT repo.
See MLRun [Projects documentation](https://docs.mlrun.org/en/latest/projects/overview.html).

The project root usually contains a project specification file, you can create it manually
(see the `project.yaml`{{open}} file), or preferably use MLRun SDK for generating it. 

Example: Defining a project with two functions using the SDK:
```python
project = mlrun.new_project("coda", "./", user_project=True)
project.set_function("gen_iris.py", "gen-iris", image="mlrun/mlrun")
project.set_function("trainer.py", "gen-iris", 
                     handler="train", image="mlrun/mlrun")
project.export()
```

**MLRun Functions**

[MLRun **Function**](https://docs.mlrun.org/en/latest/runtimes/functions.html) define the source code (.py, .ipynb, ..), 
extra packages, runtime configuration and desired resources (cpu, gpu, mem, storage, ..), functions can be loaded
from the [MLRun Marketplace](https://www.mlrun.org/marketplace/functions/).

MLRun can execute an entire file/notebook (see `gen_iris.py`{{open}}) or 
specific function classes/handlers (see `trainer.py`{{open}}).
