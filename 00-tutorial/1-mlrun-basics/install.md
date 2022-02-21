Please wait until the (pip) install is completed before moving forward !

MLRun supports running and tracking functions **locally** (with partial capabilities), 
over **remote Kubernetes** (See MLRun-kit install over k8s scenario), or over [**Iguazio's**](https://www.iguazio.com/), a managed MLOps platform. 

We will start with local execution.  

Start MLRun DB/API service as a local process:

>  Run the API in the 2nd terminal to save the cluster (click the "+" to open a new terminal)

`mlrun db &`{{execute T2}}

Go back to the first terminal and set mlrun environment with basic local configuration (see `local.env`{{open}}):

`export MLRUN_ENV_FILE=/root/editor/local.env`{{execute T1}}

> Note: in local runtime environment we cannot build and run containers, to use a remote service with 
> extended capabilities edit and use the `remote.env` instead.
