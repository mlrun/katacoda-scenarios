- Deploy the 

`function_address = serving_fn.deploy("http://localhost:8070")`{{execute}}


**[Open the Nuclio UI](https://[[HOST_SUBDOMAIN]]-8070-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]/projects/coda-[[HOST_SUBDOMAIN]]/functions/coda-[[HOST_SUBDOMAIN]]-serving/code) to see the function**

- list models behind the function endpoint/router

`serving_fn.invoke("/v2/models", method="GET")`{{execute}}`

- Make prediction using `my_model` and the vectors in `my_data`

`serving_fn.invoke("/v2/models/my_model/infer", body=my_data)`{{execute}}`
