
- Create a mock server (simulator) from our function:

`server = serving_fn.to_mock_server()`{{execute}}

- list models behind the function endpoint/router

`server.test("/v2/models/", method="GET")`{{execute}}

- Provide sample inputs for prediction, and test `infer` method

```python
my_data = {"inputs":[[5.1, 3.5, 1.4, 0.2],[7.7, 3.8, 6.7, 2.2]]}
server.test("/v2/models/my_model/infer", body=my_data)
```{{execute}}

> Read more about the [model serving API](https://docs.mlrun.org/en/stable/serving/model-api.html)
