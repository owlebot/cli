#!/usr/bin/env sh

PACKAGE_ROOT=$PWD
PACKAGE_NAME=$(basename "$PACKAGE_ROOT")

echo "Executing [docker:build] for \"$PACKAGE_NAME\". Path: $PACKAGE_ROOT"

set -x

docker build -t registry.gitlab.com/owlebot/docker-registry/$PACKAGE_NAME $PACKAGE_ROOT

set +x
