#!/usr/bin/env bash
mkdir /root/editor
mkdir /root/editor/data

MLRUN_VERSION=0.10.0-rc6
docker pull mlrun/mlrun-api:${MLRUN_VERSION}
docker pull mlrun/mlrun-ui:${MLRUN_VERSION}
echo "done" > /root/background
