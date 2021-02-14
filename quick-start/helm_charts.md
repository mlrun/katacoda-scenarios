# Helm Charts

The MLRun Kit includes the following Helm charts:

- [MLRun](https://github.com/mlrun/mlrun
- [Nuclio](https://github.com/nuclio/nuclio)
- [Jupyter](https://github.com/jupyterlab/jupyterlab "(+MLRun integrated)")
- [NFS](https://github.com/kubernetes-retired/external-storage/tree/master/nfs)
- [MPI Operator](https://github.com/kubeflow/mpi-operator)

In this tutorial you will be installed _MLRun_, _Nuclio_ and _Jupyter_.

To begin, first add V3io stable helm charts:

`helm repo add v3io-stable https://v3io.github.io/helm-charts/stable`{{execute}}

Create a namespace for the deployed components:

`kubectl create namespace mlrun`{{execute}}

Create Docker registry secret:

`kubectl --namespace mlrun create secret docker-registry registry-credentials --docker-server $REGISTRY`{{execute}}

_NOTE_: On production, your docker registry secret will include more fields such as username, password and an email address, as demonstrate below:

```shell
    --docker-server <your-registry-server>
    --docker-username <your-username> \
    --docker-password <your-password> \
    --docker-email <your-email>
```

Where:
- _<your-registry-server>_ is your Private Docker Registry FQDN. (https://index.docker.io/v1/ for Docker Hub).
- _<your-username>_ is your Docker username.
- _<your-password>_ is your Docker password.
- _<your-email>_ is your Docker email.

Install MLRun Kit Chart, and note its reference to the pre-created registry credentials:

```
helm --namespace mlrun 
    --install mlrun-kit \
    --wait \
    --set global.registry.url=$REGISTRY \
    --set global.registry.secretName=registry-credentials \
    v3io-stable/mlrun-kit
```{{execute}}

_NOTE_: _global.registry.url_ is the registry URL which can be authenticated by the registry-credentials secret (e.g., `index.docker.io/<your-username>` for Docker Hub>).

Now, your MLRun Kit is available and serving at:

*Jupyer* - `[[HOST_SUBDOMAIN]]-30040-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]`
*MLRun* - `[[HOST_SUBDOMAIN]]-30050-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]`
*Nuclio* - `[[HOST_SUBDOMAIN]]-30060-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]`
