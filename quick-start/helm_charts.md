On this step, you will install the MLRun Kit Helm chart, which includes the following components:

- [MLRun Orchestration framework](https://github.com/mlrun/mlrun)
- [Nuclio Serverless framework](https://github.com/nuclio/nuclio)
- [Jupyter Notebook](https://github.com/jupyterlab/jupyterlab) (with MLRun pre-installed)
- [NFS Provisioner](https://github.com/kubernetes-retired/external-storage/tree/master/nfs)
- [MPI Operator](https://github.com/kubeflow/mpi-operator)

First, start by creating the namespace for the deployed components,

`kubectl create namespace mlrun`{{execute}}

Next, Install MLRun Kit chart:

```shell
python3 /usr/local/bin/mlrunkit_install.py \
    --registry-url ${REGISTRY} \
    --nuclio-ui-url https://[[HOST_SUBDOMAIN]]-30050-[[KATACODA_HOST]].[[KATACODA_DOMAIN]] \
    --mlrun-ui-url https://[[HOST_SUBDOMAIN]]-30060-[[KATACODA_HOST]].[[KATACODA_DOMAIN]] \
```{{execute}}

>**Note**: Installing MLRun Kit might take several minutes.

Now, your MLRun Kit is up and running, and the various components are available.

For easy access, click on each of the links below to make the appropriate terminal tab
 on the top right screen operational:

- [Nuclio](https://[[HOST_SUBDOMAIN]]-30050-[[KATACODA_HOST]].[[KATACODA_DOMAIN]])

- [MLRun](https://[[HOST_SUBDOMAIN]]-30060-[[KATACODA_HOST]].[[KATACODA_DOMAIN]])

- [Jupyter](https://[[HOST_SUBDOMAIN]]-30040-[[KATACODA_HOST]].[[KATACODA_DOMAIN]])

Hop in MLRun/Nuclio/Jupyter and explore!
