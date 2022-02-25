#!/usr/bin/env bash
pip install mlrun[api] --ignore-installed PyYAML
pip install sklearn
echo "MLRun Installed"
start-mlrundb.sh
cd editor
