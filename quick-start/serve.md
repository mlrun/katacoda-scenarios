MLRun serving can take MLRun models or standard model files and produce managed real-time serverless functions based on Nuclio real-time serverless engine, which can be deployed everywhere.

[Nuclio](https://github.com/nuclio/nuclio) is a high-performance “serverless” framework focused on data, I/O, and compute intensive workloads.

### Serve

```python
serve = import_function('hub://v2_model_server').apply(auto_mount())
model_name='iris'
serve.add_model(model_name, model_path=train_run.outputs['model'])
addr = serve.deploy(project=project_name)
```{{copy}}

Once function has deployed, invoke it:

```python
import json

inputs = [[5.1, 3.5, 1.4, 0.2],
          [7.7, 3.8, 6.7, 2.2]]
my_data = json.dumps({'inputs': inputs})
print(f'Invoke function with data {my_data}')
serve.invoke(f'v2/models/{model_name}/infer', my_data)
```{{copy}}

Open Nuclio UI and check the function deployment progress and invoke from here:

https://[[HOST_SUBDOMAIN]]-30060-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]/

Select `mlrun` namespace from the left menu and then select your "quick start" project.
You will see your serving function - `quick-start-v2-model-server`.
