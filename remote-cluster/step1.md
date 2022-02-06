

- Run Jupyter lab container with MLRun package and tutorials:

```shell
docker run -it -p 8080:8080 -p 8888:8888 --rm -d --name jupyter \
    -e MLRUN_ARTIFACT_PATH=v3io:///projects/{{run.project}}/artifacts \
    mlrun/jupyter:unstable
```{{execute}}

Once the container is up open the [Jupyter UI](https://[[HOST_SUBDOMAIN]]-8888-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]) tab
(you may need to click `Try again` to reconnect)

In the jupyter environment open the [**mlrun.env**](https://[[HOST_SUBDOMAIN]]-8888-[[KATACODA_HOST]].[[KATACODA_DOMAIN]]/doc/tree/mlrun.env) 
file and update the MLRun address and Iguazio credentials given to you, for example:

```yaml
V3IO_USERNAME=joe
V3IO_ACCESS_KEY=12345678-1234-1234-1234-1234567890
MLRUN_DBPATH=https://mlrun-api.default-tenant.app.xxx.iguazio-cd1.com
``` 

> you can add other environment variables like cloud storage credentials to the file

Save the file using the menu or `^ + s`

Now you can start the exercise !

