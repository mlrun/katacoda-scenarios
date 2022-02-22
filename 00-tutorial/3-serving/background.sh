#!/usr/bin/env bash
echo "start" > /root/state
docker run -p 8070:8070 -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp --name nuclio-dashboard quay.io/nuclio/dashboard:stable-amd64
echo "done" > /root/state
