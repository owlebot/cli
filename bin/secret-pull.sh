#!/usr/bin/env sh

PACKAGE_ROOT=$PWD
PACKAGE_NAME=$(basename "$PACKAGE_ROOT")

ENV="dev"

while [ $# -gt 0 ]; do
    case "$1" in
        --env)
            ENV="$2"
            shift 2
            ;;
        *)
            shift
            ;;
    esac
done

echo "Executing [secret:pull] for \"$PACKAGE_NAME\". Path: $PACKAGE_ROOT. Env: $ENV"

echo $1

set -x
infisical export --path="$PACKAGE_NAME" --env=$ENV > $PACKAGE_ROOT/.env
set +x
