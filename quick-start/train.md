Now that we have everything up and running, it is time working with  MLRun Kit

Open up Jupyter, Select `File -> New -> Notebook`.

Open the created notebook, select kernel: `Python 3`

On the bottom status bar, wait until `Python 3` kernel is _idle_.

For each section you may want to copy, paste to your notebook and execute it.

### Set environment

Initialize MLRun by calling set_environment and provide it the project name

```python
from mlrun import set_environment
project_name = 'quick-start'
_, artifact_path = set_environment(project=project_name)
```{{copy}}

### Train

Use the [sklearn_classifer](https://github.com/mlrun/functions/tree/master/sklearn_classifier) from the function marketplace to train our model.

```python
from mlrun import import_function
from mlrun.platforms import auto_mount

train = import_function('hub://sklearn_classifier').apply(auto_mount())

train_run = train.run(name='train',
                      inputs={'dataset': 'https://s3.wasabisys.com/iguazio/data/iris/iris_dataset.csv'},
                      params={'model_pkg_class': 'sklearn.linear_model.LogisticRegression',
                              'label_column': 'label'},
                      project=project_name)
```{{copy}}

Open MLRun UI and check the train job progress and its artifacts from here:

https://[[HOST_SUBDOMAIN]]-30050-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]/mlrun/projects/quick-start/jobs/monitor
