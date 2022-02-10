Installing MLRun package (with the API service) and sklearn (using the following command):

`pip install mlrun[api] sklearn plotly`

Please wait until the install is completed, this may take a few minutes !

MLRun support running and tracking functions locally (with partial capabilities), 
over remote Kubernetes, or over [Iguazio's](https://www.iguazio.com/) managed MLOps service. 

We will start with creating a project, running and tracking jobs locally.  

to start MLRun DB/API service locally type:

`mlrun db &`{{execute}}

>  can run it in the 2nd terminal to save the clutter

set mlrun environment vars with basic local configuraion (see `local.env`{{open}}):

`export MLRUN_ENV_FILE=/root/editor/local.env`{{execute}}

> Note: in local environment we cannot build and run containers, 
> we will connect to a remote Kubernetes environment in the 2nd part of this scenario.
