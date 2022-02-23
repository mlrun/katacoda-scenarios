#!/usr/bin/env bash
pip install mlrun[api] --ignore-installed PyYAML
export MLRUN_ENV_FILE=/root/editor/local.env
echo "MLRun Installed - You can continue now"
cd editor

