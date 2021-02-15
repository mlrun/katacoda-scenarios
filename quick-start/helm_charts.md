The MLRun Kit includes the following Helm charts:

- [MLRun](https://github.com/mlrun/mlrun)
- [Nuclio](https://github.com/nuclio/nuclio)
- [Jupyter](https://github.com/jupyterlab/jupyterlab "(+MLRun integrated)")
- [NFS](https://github.com/kubernetes-retired/external-storage/tree/master/nfs)
- [MPI Operator](https://github.com/kubeflow/mpi-operator)

In this tutorial you will install _MLRun_, _Nuclio_ and _Jupyter_.

First, start by creating the namespace for the deployed components,

`kubectl create namespace mlrun`{{execute}}

Install MLRun Kit chart:

```shell
helm install mlrun-kit \
    --namespace mlrun \
    --version 0.1.0 \
    --wait \
    --set global.registry.url=$REGISTRY \
    v3io-stable/mlrun-kit
```{{execute}}

Now, your MLRun Kit is available and serving at:

- *Jupyer*: `[[HOST_SUBDOMAIN]]-30040-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]`{{copy}}

- *MLRun*: `[[HOST_SUBDOMAIN]]-30050-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]`{{copy}}

- *Nuclio*: `[[HOST_SUBDOMAIN]]-30060-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]`{{copy}}

For easy access, use the tabs on the top right screen.
