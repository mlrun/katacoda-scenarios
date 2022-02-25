- Deploy the function as a local container

`function_address = serving_fn.deploy("http://localhost:8070")`{{execute}}

**[Open the Nuclio UI](https://[[HOST_SUBDOMAIN]]-8070-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]/projects/coda-[[HOST_SUBDOMAIN]]/functions/coda-[[HOST_SUBDOMAIN]]-serving/code) to see the function**

Once the function is deployed we can make direct HTTP calls to it using the `invoke()` method

- list models behind the function endpoint/router

`serving_fn.invoke("/v2/models", method="GET")`{{execute}}`

- Make prediction using `my_model` and the vectors in `my_data`

`serving_fn.invoke("/v2/models/my_model/infer", body=my_data)`{{execute}}`

> We can test the function from the [Nuclio UI](https://[[HOST_SUBDOMAIN]]-8070-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]/projects/coda-[[HOST_SUBDOMAIN]]/functions/coda-[[HOST_SUBDOMAIN]]-serving/code), see the screenshot below 
> (need to update the fields marked in yellow and click on **test**):

<img src="./assets/nuclio.png" alt="mlrun-ui" width="400"/>
