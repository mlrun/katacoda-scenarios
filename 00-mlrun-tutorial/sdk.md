**Using MLRun SDK to Run Functions**

Open the `examples.py`{{open}} file, we will run different methods in it:

Run the training function using the SDK:

`python -c 'import examples; examples.run()'`{{execute}}

When we run a function via the SDK (`run_function()`) the run object is returned, which allows us to access 
run metadata, state, and results while its running (some jobs can run for hours). 

Run object has the following methods/properties:
- `uid()` &mdash; returns the unique ID.
- `state()` &mdash; returns the last known state.
- `show()` &mdash; shows the latest job info in a visual Jupyter widget.
- `outputs` &mdash; returns a dict of the run results and artifact paths.
- `logs(watch=True)` &mdash; returns the latest logs.
- `artifact(key)` &mdash; returns an artifact (as `DataItem` object).
- `output(key)` &mdash; returns a specific result or an artifact path.
- `wait_for_completion()` &mdash; wait for async run to complete
- `to_dict()`, `to_yaml()`, `to_json()` &mdash; run object serialization.

**MLRun Hyper-param and Iterative Tasks**

MLRun support running **hyper-param** jobs in parallel with various strategies and options (read the about MLRun
[Hyper-Param and Iterative jobs](https://docs.mlrun.org/en/latest/hyper-params.html)).
 
We will run a GridSearch with couple of parameters, select the best run (with `max accuracy`) and print the results:

`python -c 'import examples; examples.run_hyper()'`{{execute}}

> Hyper-param runs also generate an interactive parallel coordinates plot, check it out 

You can notice that our run output include the following auto generated results/artifacts:

```python
{'accuracy': 1.0,
 'auc-macro': 1.0,
 'auc-micro': 1.0,
 'auc-weighted': 1.0,
 'best_iteration': 1,
 'confusion-matrix': '.../confusion-matrix.html',
 'f1_score': 1.0,
 'feature-importance': '.../feature-importance.html',
 'iteration_results': '.../iteration_results.csv',
 'model': 'store://....',
 'parallel_coordinates': '.../parallel_coordinates.html',
 'precision_score': 1.0,
 'recall_score': 1.0,
 'roc-curves': '.../roc-curves.html',
 'test_set': 'store://...'}
```
