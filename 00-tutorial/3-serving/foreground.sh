#!/usr/bin/env bash
pip install mlrun --ignore-installed PyYAML
echo "MLRun Installed - You can continue now"
cd editor
python3 --version
python3
import mlrun
from pprint import pprint
