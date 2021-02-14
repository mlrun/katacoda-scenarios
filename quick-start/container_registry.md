# Container Registry

[MLRun](https://github.com/mlrun/mlrun) requires an accessible docker-registry (such as Docker Hub). The registry’s URL and credentials are consumed by the applications via a pre-created Kubernetes secret.

In this tutorial, you will use a local Docker registry.

_NOTE_: in production environment, you should use a remote docker registry, which persists its storage and allow us to shuttle private images from being exposed.

Installing a registry throughout [Helm](https://github.com/helm/charts/tree/master/stable/docker-registry#docker-registry-helm-chart):

`helm install registry stable/docker-registry --namespace kube-system --set service.type=NodePort --set service.nodePort=30100`{{execute}}

Export the registry URL as an environment variable:

`export REGISTRY=[[HOST_SUBDOMAIN]]-30100-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]`{{execute}}

Once the registry is serving, you would be able to inspect its contents via:

`curl $REGISTRY/v2/_catalog`{{execute}}
