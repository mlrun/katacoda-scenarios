[MLRun **Project**](https://docs.mlrun.org/en/latest/projects/overview.html) is a container for all your work on a particular activity/application. Projects hosts `functions`, `workflow`, 
`artifacts`, `secrets`, and more. Projects have access control and can be accessed by one or more people, they are usually assosiated with a GIT repo.
See MLRun [Projects documentation](https://docs.mlrun.org/en/latest/projects/overview.html).

**Defining an MLRun project:**

The project root should contain a project specification (YAML) file, you can create it manually
(see the `project.yaml`{{open}} file), or preferably use MLRun SDK for generating it. 

Example: Defining a project with two functions using the SDK:
```python
project = mlrun.new_project("katacoda", "./")
project.set_function("gen_iris.py", "gen-iris", image="mlrun/mlrun")
project.set_function("trainer.py", "gen-iris", 
                     handler="train", image="mlrun/mlrun")
project.export()
```

**MLRun Functions**

[MLRun **Function**](https://docs.mlrun.org/en/latest/runtimes/functions.html) define the source code (.py, .ipynb, ..), 
extra packages, runtime configuration and desired resources (cpu, gpu, mem, storage, ..), functions can also be loaded
from the [MLRun Marketplace](https://www.mlrun.org/marketplace/functions/).

MLRun can execute any Python function module, file, handler or class as is over different local and remote **runtime** environments, 
in this tutorial we demonstrate running a file main (`gen_iris.py`{{open}}) and running a function handler (`trainer.py`{{open}}).
