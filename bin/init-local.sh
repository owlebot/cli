#!/usr/bin/env sh

PACKAGE_LOCATION="@owlebot/cli"
NODE_MODULES="node_modules"

SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")

# Check if the path contains "node_modules"
case "$DIR" in
  *"$NODE_MODULES"*)
    echo "CASE: package installed"
    DIR_ROOT="${DIR%%$NODE_MODULES*}"
    DIR_ROOT="${DIR_ROOT}/${NODE_MODULES}/${PACKAGE_LOCATION}"
    ;;
  *)
    echo "CASE: package linked"
    DIR_ROOT=$(dirname "$DIR")
    ;;
esac

# $1 is the file to run
# $2 is --watch or --inspect
# -r load env var via the loadenv script
node $2 -r "${DIR_ROOT}/src/loadenv.js" $1
