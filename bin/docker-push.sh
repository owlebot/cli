#!/usr/bin/env sh

PACKAGE_ROOT=$PWD
PACKAGE_NAME=$(basename "$PACKAGE_ROOT")

echo "Executing [docker:push] for \"$PACKAGE_NAME\". Path: $PACKAGE_ROOT"

set -x

docker push registry.gitlab.com/owlebot/docker-registry/$PACKAGE_NAME

set +x
