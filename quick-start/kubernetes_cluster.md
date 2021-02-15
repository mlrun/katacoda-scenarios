# Kubernetes cluster

To spin up your cluster, click on:

`launch.sh`{{execute}}

A wait a few seconds, to allow Katacoda, create your Kubernetes cluster.

Next thing, is running *kubectl*, the Kubernetes command-line tool, which is available throughout the terminal screen, e.g.:

`kubectl get nodes -o wide && kubectl cluster-info`{{execute}}

*helm*, a command line package manager for Kubernetes, is available throughout the terminal screen, e.g.:

`helm version --short && helm env`{{execute}}

_Kubernetes Dashboard_, which provide a convenient UI to administrate your cluster can be used, using the following token:

`token.sh`{{execute}}
