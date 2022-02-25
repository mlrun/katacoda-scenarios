#!/usr/bin/env bash
sed -i "s/localhost:8080/[[HOST_IP]]:8080/" editor/local.env
echo "start" > /root/state
docker run -p 8070:8070 -d -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp --name nuclio-dashboard quay.io/nuclio/dashboard:stable-amd64
echo "done" > /root/state
