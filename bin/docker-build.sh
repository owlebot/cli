#!/usr/bin/env sh

PACKAGE_ROOT=$PWD
PACKAGE_NAME=$(basename "$PACKAGE_ROOT")

echo "Executing [docker:build] for \"$PACKAGE_NAME\". Path: $PACKAGE_ROOT"

set -x

docker build --no-cache -t registry.gitlab.com/owlebot/docker-registry/$PACKAGE_NAME:latest $PACKAGE_ROOT

set +x
