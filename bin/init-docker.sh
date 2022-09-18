#!/usr/bin/env sh

CWD="$PWD"
DIR="$(dirname $BASH_SOURCE)"
DIR_ROOT="${DIR}/../"

node -r "${DIR_ROOT}/src/loadenv.js" $1  $CWD $DIR_ROOT "docker"
