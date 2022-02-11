Installing MLRun package (with the API service) and sklearn using the following command:

`pip install mlrun[api] sklearn plotly`

Please wait until the install is completed, this may take a few minutes !

MLRun support running and tracking functions locally (with partial capabilities), 
over remote Kubernetes, or over [Iguazio's](https://www.iguazio.com/) managed MLOps service. 

We will start with creating a project, running and tracking jobs locally.  

to start MLRun DB/API service locally type:

`mlrun db &`{{execute}}

>  it is recommended to run the API in the 2nd terminal to save the clutter (click the "+" to open a new terminal)

Go back to the first terminal and set mlrun environment with basic local configuration (see `local.env`{{open}}):

`export MLRUN_ENV_FILE=/root/editor/local.env`{{execute}}

> Note: in local runtime environment we cannot build and run containers.
