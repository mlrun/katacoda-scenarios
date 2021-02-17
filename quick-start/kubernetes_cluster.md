To spin up your cluster, click on:

`launch.sh`{{execute}}

Wait a few seconds, to allow Katacoda to spin up your Kubernetes cluster.

First, you will be using [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/), the Kubernetes
 command-line tool, available through the terminal session.

Run the below command now, to see some basic info about your newly created cluster:

`kubectl get nodes -o wide && kubectl cluster-info`{{execute}}

Next up, you will be using [helm](https://helm.sh/docs/) - a command line package manager for Kubernetes.

Run the below command to list the version and related environment variables:

`helm version --short && helm env`{{execute}}

Initialize the `stable` and `v3io-stable` Helm Chart Repositories:

```shell
helm repo add stable https://charts.helm.sh/stable \
  && helm repo add v3io-stable https://v3io.github.io/helm-charts/stable \
  && helm repo update
```{{execute}}

We will be using those Helm Chart Repositories next, to install the MLRun chart.
