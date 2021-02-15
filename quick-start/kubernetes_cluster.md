To spin up your cluster, click on:

`launch.sh`{{execute}}

A wait a few seconds, to allow Katacoda, create your Kubernetes cluster.

Next thing, is running *kubectl*, the Kubernetes command-line tool, which is available throughout the terminal screen, e.g.:

`kubectl get nodes -o wide && kubectl cluster-info`{{execute}}

*helm*, a command line package manager for Kubernetes, is available throughout the terminal screen, e.g.:

`helm version --short && helm env`{{execute}}

Initialize Helm Chart Repositories

`helm repo add stable https://charts.helm.sh/stable`{{execute}}

`helm repo add v3io-stable https://v3io.github.io/helm-charts/stable`{{execute}}

`helm repo update`{{execute}}
