#!/usr/bin/env sh

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

MLRUN_VERSION=0.9.3

# TODO: change to MLRUN_VERSION once 0.6.1 is out
docker pull quay.io/mlrun/jupyter:${MLRUN_VERSION}
docker pull mlrun/mlrun-api:${MLRUN_VERSION}
docker pull mlrun/mlrun-ui:${MLRUN_VERSION}
docker pull mlrun/ml-models:${MLRUN_VERSION}
