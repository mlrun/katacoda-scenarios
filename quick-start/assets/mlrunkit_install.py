# Copyright 2021 Iguazio
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
    process = _spin_while_waiting_for_process(_popen(cmd))
    if process.returncode != 0:

        # write stdout and stderr and bail
        sys.stdout.write(process.communicate()[0].decode())
        sys.stderr.write(process.communicate()[1].decode())
        exit(process.returncode)

    output = process.communicate()[0].decode()
    print(
        f"==============================\n\n{output}\n\n=============================="
    )


def _parse_args():
    parser = argparse.ArgumentParser(description="Install MLRun Kit interactively")

    parser.add_argument("--chart-version", type=str, default="0.1.15")
    parser.add_argument("--registry-url", type=str, default="localhost:5000")
    parser.add_argument("--timeout", type=str, default="10m")
    parser.add_argument("--namespace", type=str, default="mlrun")
    parser.add_argument("--nuclio-ui-url", type=str, default="http://localhost:30050")
    parser.add_argument("--mlrun-ui-url", type=str, default="http://localhost:30060")
    parser.add_argument("--jupyter-image-tag", type=str, default="0.9.3")
    return parser.parse_args()


def _resolve_install_command(args):
    return f"helm install mlrun-kit \
    --namespace {args.namespace} \
    --wait \
    --timeout {args.timeout} \
    --version {args.chart_version} \
    --set nuclio.controller.image.tag=1.7.4-amd64 \
    --set nuclio.dashboard.image.tag=1.7.4-amd64 \
    --set mlrun.nuclio.uiURL={args.nuclio_ui_url} \
    --set jupyterNotebook.mlrunUIURL={args.mlrun_ui_url} \
    --set global.registry.url={args.registry_url} \
    --set jupyterNotebook.image.tag={args.jupyter_image_tag} \
    v3io-stable/mlrun-kit"


def _spin_while_waiting_for_process(process):
    spinner = _get_spinner()
    print("Executing...")
    while process.poll() is None:
        _print_spinner(spinner)
    return process


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
