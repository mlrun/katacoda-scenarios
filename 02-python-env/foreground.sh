#!/usr/bin/env bash
pip install git+https://github.com/yaronha/mlrun.git@fix-run-func-local --ignore-installed PyYAML
pip install uvicorn~=0.12.0 apscheduler~=3.6 sqlite3-to-mysql~=1.4
pip install sklearn plotly~=5.4
echo "MLRun Installed"
cd editor
