#!/usr/bin/env bash
echo "start" > /root/state
docker run -p 8070:8070 -d -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp --name nuclio-dashboard quay.io/nuclio/dashboard:stable-amd64
MLRUN_NUCLIO_DASHBOARD_URL=http://localhost:8070 mlrun db &
echo "done" > /root/state
