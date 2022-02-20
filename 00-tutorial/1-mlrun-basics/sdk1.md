- Load the current project:

`project = mlrun.load_project("./")`{{execute}}

- Run the iris data gen function:

`gen_data_run = project.run_function("gen-iris", params={"format": "csv"}, local=True)`{{execute}}

When we run a function via the SDK (`run_function()`) the run object is returned, which allows us to access 
run metadata, state, and results while its running (some jobs can run for hours). 

- Print the run state and outputs:

`gen_data_run.state()`{{execute}}

`pprint(gen_data_run.outputs)`{{execute}}

- Print the output dataset artifact (`DataItem` object) as dataframe

`gen_data_run.artifact("dataset").as_df().head()`{{execute}}

Run object has the following methods/properties:
- `uid()` &mdash; returns the unique ID.
- `state()` &mdash; returns the last known state.
- `show()` &mdash; shows the latest job info in a visual Jupyter widget.
- `outputs` &mdash; returns a dict of the run results and artifact paths.
- `logs(watch=True)` &mdash; returns or watch on the latest logs.
- `artifact(key)` &mdash; returns an artifact (as `DataItem` object).
- `wait_for_completion()` &mdash; wait for async run to complete
- `to_dict()`, `to_yaml()`, `to_json()` &mdash; run object serialization.

describe_run = describe.run(params={'label_column': 'label'},
                            inputs={"table": "./artifacts/dataset.csv"}, local=True)