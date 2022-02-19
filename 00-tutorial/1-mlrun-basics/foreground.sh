#!/usr/bin/env bash
pip install mlrun[api] --ignore-installed PyYAML
pip install sklearn plotly~=5.4
echo "MLRun Installed"
cd editor
