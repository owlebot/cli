#!/usr/bin/env sh

PACKAGE_ROOT=$PWD
PACKAGE_NAME=$(basename "$PACKAGE_ROOT")

ENV="dev"
PREFIX=""

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

case $(uname | tr '[:upper:]' '[:lower:]') in
#   linux*)
#     PREFIX=linux
#     ;;
#   darwin*)
#     PREFIX=osx
#     ;;
  msys*)
    PREFIX=//
    ;;
  *)
    PREFIX=/
    ;;
esac

set -x
infisical export --path="$PREFIX$PACKAGE_NAME" --env=$ENV
set +x
