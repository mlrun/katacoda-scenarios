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
#
#!/usr/bin/env bash
sed -i "s/localhost:8080/[[HOST_IP]]:8080/" editor/local.env
echo "start" > /root/state
docker run -p 8070:8070 -d -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/tmp -e NUCLIO_DASHBOARD_EXTERNAL_IP_ADDRESSES=[[HOST_IP]] --name nuclio-dashboard quay.io/nuclio/dashboard:stable-amd64
echo "done" > /root/state
MLRUN_VERSION=1.0.0-rc4
docker pull mlrun/mlrun:${MLRUN_VERSION}
