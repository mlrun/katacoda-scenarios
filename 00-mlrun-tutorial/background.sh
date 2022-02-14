#!/usr/bin/env bash

MLRUN_VERSION=0.10.0
sed -i "s/name: katacoda/name: coda-$HOSTNAME/" editor/project.yaml