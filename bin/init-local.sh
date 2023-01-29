#!/usr/bin/env sh

CWD="$PWD"
DIR="$(dirname $BASH_SOURCE)"
DIR_ROOT="${DIR}/../"

# $1 is the file to run
# $2 is --watch or --inspect
# -r load env var via the loadenv script
node $2 -r "${DIR_ROOT}/src/loadenv.js" $1 $CWD "local"
