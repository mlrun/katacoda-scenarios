#!/usr/bin/env bash
echo "start" > /root/state
MLRUN_VERSION=0.10.0
sed -i "s/name: katacoda/name: coda-[[HOST_SUBDOMAIN]]/" editor/project.yaml
docker pull quay.io/mlrun/mlrun-ui:${MLRUN_VERSION}
echo "pulled" > /root/state
docker run -it -p 80:80 --rm -d --name mlrun-ui -v /root/editor:/root/editor -e MLRUN_API_PROXY_URL=http://[[HOST_IP]]:8080 quay.io/mlrun/mlrun-ui:${MLRUN_VERSION}
echo "done" > /root/state
