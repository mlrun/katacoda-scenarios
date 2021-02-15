On this step, you will install the MLRun Kit Helm chart which includes the following components:

- [MLRun](https://github.com/mlrun/mlrun)
- [Nuclio](https://github.com/nuclio/nuclio)
- [Jupyter](https://github.com/jupyterlab/jupyterlab "(+MLRun integrated)")
- [NFS](https://github.com/kubernetes-retired/external-storage/tree/master/nfs)
- [MPI Operator](https://github.com/kubeflow/mpi-operator)

First, start by creating the namespace for the deployed components,

`kubectl create namespace mlrun`{{execute}}

Install MLRun Kit chart:

`python3 /usr/local/bin/mlkit_install.py --chart-version 0.1.0 --registry-url ${REGISTRY}`{{execute}}

*Note*: Installing MLRun Kit might take several of minutes.

Now, your MLRun Kit is available and serving at (Click on each link, to make tabs operational):

- [Jupyer](https://[[HOST_SUBDOMAIN]]-30040-[[KATACODA_HOST]].[[KATACODA_DOMAIN]])

- [MLRun](https://[[HOST_SUBDOMAIN]]-30050-[[KATACODA_HOST]].[[KATACODA_DOMAIN]])

- [Nuclio](https://[[HOST_SUBDOMAIN]]-30060-[[KATACODA_HOST]].[[KATACODA_DOMAIN]])

For easy access, use the tabs on the top right screen.
