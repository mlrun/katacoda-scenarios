#!/usr/bin/env bash
sed -i "s/localhost:8080/[[HOST_IP]]:8080/" editor/local.env
echo "start" > /root/state
docker run -p 8070:8070 -d -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp -e NUCLIO_DASHBOARD_EXTERNAL_IP_ADDRESSES=[[HOST_IP]] --name nuclio-dashboard quay.io/nuclio/dashboard:stable-amd64
echo "done" > /root/state
MLRUN_VERSION=1.0.0-rc4
docker pull mlrun/mlrun:${MLRUN_VERSION}
