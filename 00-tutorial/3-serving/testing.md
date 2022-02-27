You can create a mock serving pipeline which simulates the real deployment and allow testing of your model 
along with pre/post-processing steps:

`server = serving_fn.to_mock_server()`{{execute}}

<br>

**Using and Testing The Serving API**

> MLRun Serving API is compatible with Triton and [KFServing v2](https://github.com/kubeflow/kfserving/blob/master/docs/predict-api/v2/required_api.md).
> See the [**Model API documentation**](https://docs.mlrun.org/en/stable/serving/model-api.html) for details.

The `.test()` method injects an event to the `mock` pipeline and return the expected response, 
events consist of the HTTP `path`, `body`, `method`, etc.
 
API test examples:

- list the models behind the function endpoint/router

`server.test("/v2/models/", method="GET")`{{execute}}

- Provide sample inputs for prediction, and test `infer` method results.

```python
my_data = {"inputs":[[5.1, 3.5, 1.4, 0.2],[7.7, 3.8, 6.7, 2.2]]}
server.test("/v2/models/my_model/infer", body=my_data)
```{{execute}}

> The API accepts/returns `json` messages by default, the `input` data is an array of request vectors
> and the returned `output` data is an array of corresponding predicted results. 