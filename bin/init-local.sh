#!/usr/bin/env sh

PACKAGE_LOCATION="@owlebot/cli"

SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")

# Check if the path contains "node_modules"
if [[ "$DIR" =~ "node_modules" ]]; then
  echo "CASE: package installed"
  DIR_ROOT="${path%%node_modules*}"
  DIR_ROOT="${DIR_ROOT}/node_modules/${PACKAGE_LOCATION}"
else
  echo "CASE: package linked"
  DIR_ROOT=$(dirname "$DIR")
fi

# $1 is the file to run
# $2 is --watch or --inspect
# -r load env var via the loadenv script
node $2 -r "${DIR_ROOT}/src/loadenv.js" $1
