#!/bin/bash
logfile="db.log"
export MLRUN_NUCLIO_DASHBOARD_URL=http://localhost:8070
export SECRET_STORES__KUBERNETES__AUTO_ADD_PROJECT_SECRETS=true
mlrun db 2>&1 > ${logfile} &
value="uvicorn running on"
delay='0.75'
spinstr='\|/-'
temp=""
echo "Starting MLRun DB (command: 'mlrun db 2>&1 > ${logfile} &')"
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

