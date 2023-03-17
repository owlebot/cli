#!/usr/bin/env bash

PACKAGE_LOCATION="@owlebot/cli"

DIR="$(dirname $BASH_SOURCE)"
DIR_ROOT="$(echo "$DIR" | awk -F"node_modules" '{print $1}')node_modules";

# $1 is the file to run
# $2 is --watch or --inspect
# -r load env var via the loadenv script
node $2 -r "${DIR_ROOT}/$PACKAGE_LOCATION/src/loadenv.js" $1
