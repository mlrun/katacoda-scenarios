Now that we have everything up and running, it is time to kick the tires and start working with MLRun.

Open up Jupyter, Select `quick-start.ipynb` notebook, and follow each step as it will thoroughly guide you on how to 
Train, Test and Serve your ML Model.

### MLRun Dashboard

Navigate to the **[MLRun UI](https://[[HOST_SUBDOMAIN]]-30060-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]/mlrun/projects/quick-start)**
to view your project resources - including your models, train and test jobs, and artifacts.

### Nuclio Dashboard

Navigate to the **[Nuclio UI](https://[[HOST_SUBDOMAIN]]-30050-[[KATACODA_HOST]].[[KATACODA_DOMAIN]])**
to see the real-time functions' deployment outputs, configuration, and even to invoke them manually.

> Select the `mlrun` namespace from the left drop-down menu and then select your "quick-start" project.  
> Now, click on your serving function (`v2-model-server`) to see detailed information and configuration about the function.  
> On the right side of the `code` tab you will see the test pane - where you can invoke your function with test inputs
> and inspect the outputs. Feel free to explore the various tabs to learn about the different details of the function
> while you're here.

For more details about Nuclio, check out the [official Nuclio documentation](https://nuclio.io/docs/latest/introduction/)
