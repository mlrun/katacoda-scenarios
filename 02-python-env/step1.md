Installing MLRun package (with the API service) and sklearn (using the following command):

`pip install mlrun[api] sklearn plotly`

Please wait until the install is completed, this may take a few minutes !

MLRun support running and tracking functions locally (with partial capabilities), 
over remote Kubernetes, or over Iguazio's managed MLOps service. 

We will start with creating a project, running and tracking jobs locally.  

set mlrun environment vars with basic local configuraion (see `local.env`{{open}}):

`export MLRUN_ENV_FILE=/root/editor/local.env`{{execute}}

to start MLRun DB/API service locally type:

`mlrun db`{{execute}}
