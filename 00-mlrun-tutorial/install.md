Installing MLRun package (with the API service) and sklearn using the following command:

`pip install mlrun[api] sklearn plotly`

Please wait until the install is completed, this may take a few minutes !

MLRun support running and tracking functions **locally** (with partial capabilities), 
over **remote Kubernetes** (See MLRun-kit install over k8s scenario), or over [**Iguazio's**](https://www.iguazio.com/) managed MLOps service. 

We will start with creating a project, running and tracking jobs locally.  

to start MLRun DB/API service as a local process:

`mlrun db &`{{execute T2}}

>  This will run in the 2nd terminal to save the clutter

Go back to the first terminal and set mlrun environment with basic local configuration (see `local.env`{{open}}):

`export MLRUN_ENV_FILE=/root/editor/local.env`{{execute T1}}

> Note: in local runtime environment we cannot build and run containers, to use a remote service with UI and 
> extended capabilities edit and use `remote.env`.
