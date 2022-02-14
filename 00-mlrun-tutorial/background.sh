#!/usr/bin/env bash

MLRUN_VERSION=0.10.0
sed -i "s/name: katacoda/name: coda-[[HOST_SUBDOMAIN]]/" editor/project.yaml