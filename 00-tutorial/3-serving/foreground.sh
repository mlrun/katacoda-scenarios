#!/usr/bin/env bash
pip install mlrun[api] --ignore-installed PyYAML
echo "MLRun Installed"
export MLRUN_NUCLIO_DASHBOARD_URL=http://localhost:8070
start-mlrundb.sh
export MLRUN_ENV_FILE=/root/editor/local.env
cd editor
python3 --version
python3
import mlrun
from pprint import pprint
