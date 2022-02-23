#!/usr/bin/env bash
pip install mlrun[api] --ignore-installed PyYAML
export MLRUN_ENV_FILE=/root/editor/local.env
echo "MLRun Installed - You can continue now"
cd editor
MLRUN_NUCLIO_DASHBOARD_URL=http://localhost:8070 mlrun db &
python3 --version
python3
import mlrun
from pprint import pprint
