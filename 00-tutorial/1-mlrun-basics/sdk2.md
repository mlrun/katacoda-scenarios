You can perform further data exploration by leveraging the [MLRun functions marketplace](https://www.mlrun.org/marketplace/functions/). 
This marketplace is a centralized location for open-source contributions of function components that are commonly used 
in machine-learning development.

Use the `import_function` method, which imports a function object from a file, url or the marketplace (url starts with `hub://`).
We will use the `describe` function which analyzes a dataset and generates various plots and statistics.

`describe = mlrun.import_function('hub://describe')`{{execute}}

Print the function doc:

`describe.doc()`{{execute}}

Run the `describe` function with the dataset output from the `gen-iris` function:

```python
describe_run = describe.run(params={'label_column': 'label'},
                            inputs={"table": gen_data_run.outputs['dataset']}, local=True)
```{{execute}}

Print the list of output results and artifacts:

`pprint(gen_data_run.outputs)`{{execute}}

Open the UI to see the various charts

**Explore progress, results and artifacts - [Open MLRun UI](https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]/mlrun/projects/coda-[[HOST_SUBDOMAIN]]/jobs/monitor-jobs/gen-iris)**
