[MLRun](https://github.com/mlrun/mlrun) requires an accessible docker-registry (such as Docker Hub).
The registry’s URL and credentials are provided to the applications via a Kubernetes secret.

Configure remote registry using the following command (edit with your information):

```
kubectl --namespace mlrun create secret docker-registry registry-credentials \
    --docker-username <registry-username> \
    --docker-password <login-password> \
    --docker-server <server URL, e.g. https://index.docker.io/v1/ > \
    --docker-email <user-email>
```{{copy}}

set the container registry URL (use your own details):

```
export REGISTRY=<registry URL e.g. index.docker.io/mlrun >
```{{copy}}

Alternatively you can use a local Docker registry (not recommended).

- Install a docker registry:

`docker run --detach --publish 30100:5000 registry:2.7.1`{{execute}}

- Export the registry URL as an environment variable:

`export REGISTRY=[[HOST_SUBDOMAIN]]-30100-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]`{{execute}}

- Once the registry is up and running, you would be able to inspect its contents using its HTTP API:

`curl $REGISTRY/v2/_catalog`{{execute}}
