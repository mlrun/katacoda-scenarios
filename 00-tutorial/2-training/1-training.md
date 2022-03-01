Installing MLRun package and sklearn, this may take a few minutes!: 
`> pip install mlrun[api] scikit-learn plotly`

> This setup include a local MLRun service, in order to work with a remote k8s cluster or [**Iguazio's platform**](https://www.iguazio.com/) you need to edit the 
> `remote.env`{{open}} file with the remote address and credentials and swap the environment using: 
> `mlrun.set_env_from_file("remote.env")` inside python.

In the meantime, we will review MLRun's model development features.

**Training, Experiment Tracking, and Automation**

MLRun simplifies the effort of developing, testing, and deploying ML/DL Models, you can focus 
on the model and business logic.

In this tutorial we will cover the following:
* Writing, executing, and tracking a model training function
* Using `apply_mlrun()` for automated logging and MLOps
* Automating, scaling and tracking jobs with hyper-parameter
* Using the Model Registry  

**Using Automated Logging and MLOps with `apply_mlrun()`**

You can write custom training functions or use built-in marketplace functions for training models using 
common open-source frameworks and/or cloud services (such as AzureML, Sagemaker, etc.). 

Inside the ML function you can use the `apply_mlrun()` method which adds automates the tracking and MLOps
functionality.

With `apply_mlrun()` the following outputs are generated automatically:
* Plots (loss convergence, ROC, confusion matrix, feature importance, etc.)
* Metrics (accuracy, loss, etc.)
* Dataset Artifacts (like the dataset used for training and / or testing)
* Custom code (like custom layers, metrics and so on)
* Model Artifact (enabling versioning, monitoring and automated deployment)

In addition it handles automation of various MLOps tasks like scaling runs over multiple containers 
(with Dask, Horovod, and Spark), run profiling, hyper-parameter tuning, ML Pipeline and CI/CD integration, etc.) 
