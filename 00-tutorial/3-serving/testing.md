
- Create a mock server (simulator) from our function:

`server = serving_fn.to_mock_server()`{{execute}}

- Provide sample inputs for prediction:

`my_data = {"inputs":[[5.1, 3.5, 1.4, 0.2],[7.7, 3.8, 6.7, 2.2]]}`{{execute}}

- Test the serving function

`server.test("/v2/models/my_model/infer", body=my_data)`{{execute}}

