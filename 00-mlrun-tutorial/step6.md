The real power of MLRun is automatically turning our code to elastic batch or real-time **Serverless Functions**
with continuous monitoring and rolling upgrades, allowing us to scale runs, rapidly move to production, and have continuous deployment.

**Setting up the remote environment** 

Open the `remote.env`{{open}} file and update the MLRun service address, 
when using Iguazio manage service or trial set Iguazio credentials which were sent to you, for example:

```yaml
V3IO_USERNAME=joe
V3IO_ACCESS_KEY=12345678-1234-1234-1234-1234567890
MLRUN_DBPATH=https://mlrun-api.default-tenant.app.xxx.iguazio-cd1.com
``` 

> When running jobs over the cluster you must use shared storage media (e.g. cloud storage, Iguazio FS, NFS, ..)
> you can specify cloud storage and other credentials in the file

Switch to the remote environment:

`export MLRUN_ENV_FILE=/root/editor/remote.env`{{execute}}

*Run our function on the remote service**

We will first rename the project to something unique (making sure we dont overwrite an existing project):

`sed -i "s/name: katacoda/name: coda-$HOSTNAME/" project.yaml`{{execute}}

Run the data generation function `gen-iris` (this time without the `--local` flag):

`mlrun run -f gen-iris`{{execute}}

Examine the results in the MLRun service UI (see the printed url link `click https://...`)

> Notice we did not have to do any extra engineering work in order to run our Py code as a remote serverless function

**Build a complete pipeline**

...

**Submit to the cluster and view results**

...