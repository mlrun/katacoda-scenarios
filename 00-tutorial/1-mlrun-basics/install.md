Please wait until the (pip) install is completed and MLRun DB/API service has started before moving forward !

MLRun supports running and tracking functions **locally** (with partial capabilities), 
over **remote Kubernetes** (See MLRun-kit install over k8s scenario), or over [**Iguazio's**](https://www.iguazio.com/), a managed MLOps platform. 

We will set mlrun environment with basic local configuration (see `local.env`{{open}}), pointing to the local DB/API service:

`export MLRUN_ENV_FILE=/root/editor/local.env`{{execute}}

> Note: in local runtime environment we cannot build and run containers, to use a remote service with 
> extended capabilities edit and use the `remote.env` instead.
