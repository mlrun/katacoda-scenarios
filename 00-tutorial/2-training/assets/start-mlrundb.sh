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
#!/bin/bash
logfile="db.log"
export MLRUN_SECRET_STORES__KUBERNETES__AUTO_ADD_PROJECT_SECRETS=false
mlrun db > ${logfile} 2>&1 &
value="uvicorn running on"
delay='0.75'
spinstr='\|/-'
temp=""
echo "Starting MLRun DB (command: 'mlrun db > ${logfile} 2>&1 &')"
echo -n "Waiting for it to be ready.."
while true; do 
    grep -i "${value}" ${logfile} &> /dev/null
    if [[ "$?" -ne 0 ]]; then     
      temp="${spinstr#?}"
      printf " [%c]  " "${spinstr}"
      spinstr=${temp}${spinstr%"${temp}"}
      sleep "${delay}"
      printf "\b\b\b\b\b\b"
    else
      break
    fi
done
printf "    \b\b\b\b"
echo ""
echo "MLRun DB is ready"
sleep 1

