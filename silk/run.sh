#!/bin/bash 

# Reference: https://docs.docker.com/engine/userguide/containers/dockerimages/

echo "Usage: "
echo "  ${0} <repo-name/repo-tag>"
echo

imageTag=${1:-openkbs/silk-workbench}

#instanceName=some-${2:-${imageTag%/*}}_$RANDOM
instanceName=some-${2:-${imageTag##*/}}

#################################
#### ---- Port Mapping setup ----
#################################
portSetup="-p 9000:9000"

#################################
#### ---- Data Volumne setup ----
#################################
dataDir=$PWD/data
mkdir -p ${dataDir}
dataSetup="-v ${dataDir}:/data"

echo "--- Clean up old instance ---"
docker rm -f ${instanceName}

#################################
#### ---- Starting up setup ----
#################################
echo ""
echo "--- Starting a new instance ---"
echo "(Daemon-mode)"
echo "docker run -d ${portSetup} -v ${dataDir}:/data --name ${instanceName} ${imageTag}"
echo "docker run -d ${portSetup} ${dataSetup} --name ${instanceName} ${imageTag}"
echo ""
echo "(Interactive-mode)"
echo "docker run -i -t ${portSetup} -v ${dataDir}:/data --name ${instanceName} ${imageTag} /bin/bash"
echo "docker run -i -t ${portSetup} ${dataSetup} --name ${instanceName} ${imageTag}"
echo ""
#docker run -d --name ${instanceName} ${portSetup} -v ${dataDir}:/data -t ${imageTag}
docker run -d ${portSetup} ${dataSetup} --name ${instanceName} ${imageTag}

echo ""
echo "--- Docker Status"
docker ps -a |grep "$(basename $imageTag)"
echo ""
echo "-----------------------------------------------"
echo "--->>> Docker Shell into Container `docker ps -lq`"
docker exec -it ${instanceName} /bin/bash

