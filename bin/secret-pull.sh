#!/usr/bin/env sh

PACKAGE_ROOT=$PWD
PACKAGE_NAME=$(basename "$PACKAGE_ROOT")

echo "Executing [secret:pull] for \"$PACKAGE_NAME\". Path: $PACKAGE_ROOT"

set -x
infisical export --path="$PACKAGE_NAME" --env=dev > $PACKAGE_ROOT/.env
set +x
