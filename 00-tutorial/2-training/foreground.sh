#!/usr/bin/env bash
pip install mlrun[api] --ignore-installed PyYAML
pip install scikit-learn
pip install plotly~=5.4
echo "MLRun Installed"
start-mlrundb.sh
cd editor
