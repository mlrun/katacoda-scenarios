#!/usr/bin/env bash
pip install mlrun[api] --ignore-installed PyYAML
pip install scikit-learn plotly~=5.4
echo "MLRun Installed - You can continue now"
cd editor
