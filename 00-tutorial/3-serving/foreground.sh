#!/usr/bin/env bash
pip install mlrun[api] --ignore-installed PyYAML
echo "MLRun Installed"
start-mlrundb.sh
export MLRUN_ENV_FILE=/root/editor/local.env
cd editor
