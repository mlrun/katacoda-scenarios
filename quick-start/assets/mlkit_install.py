# Copyright 2018 Iguazio
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import argparse
import sys
import itertools
import time
import shlex
import subprocess


def main():
    args = _parse_args()
    cmd = _resolve_install_command(args)
    process = _popen(cmd)
    output = _spin_and_wait_for_process(process)
    print(
        f"==============================\n\n{output}\n\n=============================="
    )


def _resolve_install_command(args):
    return f"helm install mlrun-kit \
    --namespace {args.namespace} \
    --wait \
    --timeout {args.timeout} \
    --version {args.chart_version} \
    --set global.registry.url={args.registry_url} \
    v3io-stable/mlrun-kit"


def _parse_args():
    parser = argparse.ArgumentParser(description="Install MLRun Kit interactively")

    parser.add_argument("--chart-version", type=str, default="0.1.0")
    parser.add_argument("--registry-url", type=str, default="localhost:5000")
    parser.add_argument("--timeout", type=str, default="10m")
    parser.add_argument("--namespace", type=str, default="mlrun")

    return parser.parse_args()


def _spin_and_wait_for_process(process):
    spinner = _get_spinner()
    while process.poll() is None:
        _print_spinner(spinner)
    print("Execution finished")
    return process.communicate()[0]


def _print_spinner(spinner):
    sys.stdout.write(next(spinner))
    sys.stdout.flush()
    time.sleep(0.1)
    sys.stdout.write("\b")


def _get_spinner():
    return itertools.cycle(["-", "/", "|", "\\"])


def _popen(cmd):
    print(f"Running command: {cmd}")
    return subprocess.Popen(
        shlex.split(cmd),
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )


if __name__ == "__main__":
    main()
