Now that we have everything up and running, it is time to kick the tires and start working with MLRun.

Open up Jupyter, Select `quick-start.ipynb` notebook, and follow each step as it will thoroughly guide you on how to Train, Test and Serve a ML Model.

### MLRun artifacts

Navigate to **[MLRun UI](https://[[HOST_SUBDOMAIN]]-30060-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]/mlrun/projects/quick-start)** screen to view your project artifacts including your models, train and test jobs.

### Nuclio artifacts

Navigate to **[Nuclio UI](https://[[HOST_SUBDOMAIN]]-30050-[[KATACODA_HOST]].[[KATACODA_DOMAIN]])** to see the deployment output and configuration and invoke the function manually.

> Select the `mlrun` namespace from the left drop-down menu and then select your "quick-start" project.  
> Now, click on your serving function - `v2-model-server` to see detailed information and configuration about the function.  
> On the right side of the `code` tab you will see the test pane - where you can invoke your function manually and inspect the outputs.  
> Feel free to explore the various tabs and details of the function while you're here.

For more details about Nuclio, check out the [official Nuclio documentation](https://nuclio.io/docs/latest/introduction/)
