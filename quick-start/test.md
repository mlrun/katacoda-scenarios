Now that you have a trained model, you can test it: run a task that uses the [test_classifier](https://github.com/mlrun/functions/tree/master/test_classifier) marketplace function to run the selected trained model against the test data set, as returned for the training task (train) in the previous step

### Test

```python

# run the selected trained model against the test data set
test = import_function('hub://test_classifier').apply(auto_mount())

# view function documentation
test.doc()
```{{copy}}

Configure parameters for the test function

```python
test_run = test.run(name="test",
                    params={"label_column": "label"},
                    inputs={"models_path": train_run.outputs['model'],
                            "test_set": train_run.outputs['test_set']},
                    project=project_name)
```{{copy}}
