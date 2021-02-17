MLRun serving can take MLRun models or standard model files and produce managed, real-time, serverless functions
based on the [Nuclio real-time serverless framework](https://www.iguazio.com/open-source/nuclio/).
Nuclio is focused on performance and flexibility, and is built around data, I/O, and compute intensive workloads.

### Serve a model

```python
serve = import_function('hub://v2_model_server').apply(auto_mount())
model_name='iris'
serve.add_model(model_name, model_path=train_run.outputs['model'])
addr = serve.deploy(project=project_name)
```{{copy}}

Once the function is successfully deployed, invoke it from the Jupyter notebook:

```python
import json

inputs = [[5.1, 3.5, 1.4, 0.2],
          [7.7, 3.8, 6.7, 2.2]]
my_data = json.dumps({'inputs': inputs})
print(f'Invoke function with data {my_data}')
serve.invoke(f'v2/models/{model_name}/infer', my_data)
```{{copy}}

Next, open the Nuclio UI - from there you can see the deployment output and configuration and invoke the function manually:

https://[[HOST_SUBDOMAIN]]-30060-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]/

Select the `mlrun` namespace from the left drop-down menu and then select your "quick-start" project.
Now, click on your serving function - `v2-model-server` to see detailed information and configuration about the function.
On the right side of the `code` tab you will see the test pane - where you can invoke your function manually and inspect 
the outputs.
Feel free to explose the various tabs and details of the function while you're here.

For more details about Nuclio, check out the [official Nuclio documentation](https://nuclio.io/docs/latest/introduction/)
