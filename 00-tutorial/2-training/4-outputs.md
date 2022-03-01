
The auto-logging for SciKit-Learn includes many plots and metrics. The metrics and artifacts are chosen according to the 
model algorithm used (classification or regression). You are able to add more metrics and artifacts and even write your 
own. To learn more about choosing metrics, artifacts and adding custom ones, we suggest reading more on MLRun's docs.

Print the metrics and artifacts generated automatically by the apply_mlrun()` method:

`pprint(trainer_run.outputs)`{{execute}}

Once the run is complete [**open the MLRun UI**](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]/mlrun/projects/coda-[[HOST_SUBDOMAIN]]/jobs/monitor-jobs/trainer-train) and see the artifacts and results

<img src="./assets/artifacts.png" alt="artifacts" width="400"/>

<img src="./assets/results.png" alt="results" width="400"/>

> All of the metrics and artifacts, are stored as metadata of our model, so it will be easy to do comparison 
> between models later on.

**Model Registry**

Models and their metadata are automatically stored in the **Model Registry**, check the
[**Model Artifacts Tab**](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]/mlrun/projects/coda-[[HOST_SUBDOMAIN]]/models/models)
to see the models

<img src="./assets/models.png" alt="models" width="500"/>

Listing the model objects, and printing as YAML:

```python
models = mlrun.get_run_db().list_artifacts(kind="model")
print(models.objects()[0].to_yaml())
```{{execute}}
