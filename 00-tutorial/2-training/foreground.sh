#!/usr/bin/env bash
pip install mlrun[api] --ignore-installed PyYAML
pip install scikit-learn plotly~=5.4
echo "MLRun Installed"
start-mlrundb.sh
export MLRUN_ENV_FILE=/root/editor/local.env
cd editor
python3 --version
python3
import mlrun
from pprint import pprint
