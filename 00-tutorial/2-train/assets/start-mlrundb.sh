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

