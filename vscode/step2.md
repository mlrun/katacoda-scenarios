[MLRun **Project**](https://docs.mlrun.org/en/latest/projects/overview.html) is a container for all your work on a particular activity/application. Projects hosts `functions`, `workflow`, 
`artifacts`, `secrets`, and more. Projects have access control and can be accessed by one or more people, they are usually assosiated with a GIT repo.
See MLRun [Projects documentation](https://docs.mlrun.org/en/latest/projects/overview.html).

We will start with a simple project which contains two function definitions,
You can create a `project.yaml`{{open}} file manually, or use the SDK, for example to 
create a project and register the two function in it use:

```python
project = mlrun.new_project("katacoda", "./")
project.set_function("gen_iris.py", "gen-iris", image="mlrun/mlrun")
project.set_function("trainer.py", "gen-iris", 
                     handler="train", image="mlrun/mlrun")
project.export()
```

The [MLRun **Function**](https://docs.mlrun.org/en/latest/runtimes/functions.html) objects define the source code (.py, .ipynb, ..), 
extra packages, runtime configuration and desired resources (cpu, gpu, mem, storage, ..), functions can also be loaded
from the [MLRun Marketplace](https://www.mlrun.org/marketplace/functions/) for now we will use basic functions.  

Run the data generation project function `gen-iris` (see `gen_iris.py`{{open}}):

`mlrun run -f gen-iris`{{execute}}

Check out the output CSV file in `artifacts/katacoda/dataset.csv`{{open}}

We can run the function using the regular `Python` command, notice the use of MLRun `with mlrun.get_or_create_ctx()` in the code, 
it wraps your code allowing to automatically track the execution, try the following command:

`python gen_iris.py`{{execute}}

Using `python` however, doesnt allow data and parameter or hyper parameter injection. 
