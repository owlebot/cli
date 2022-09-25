#!/usr/bin/env sh

CWD="$PWD"
DIR="$(dirname $BASH_SOURCE)"
DIR_ROOT="${DIR}/../"

echo "CWD: ${CWD}"
echo "DIR_ROOT: ${DIR_ROOT}"

node -r "${DIR_ROOT}/src/loadenv.js" $CWD $DIR_ROOT "docker"
