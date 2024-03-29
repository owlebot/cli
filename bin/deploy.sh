#!/usr/bin/env sh

PACKAGE_ROOT=$PWD
PACKAGE_NAME=$(basename "$PACKAGE_ROOT")

echo "Executing [deploy] for \"$PACKAGE_NAME\". Path: $PACKAGE_ROOT"

platforms=""
env="production"
version="latest"

while [ $# -gt 0 ]; do
    case "$1" in
        --env)
            env="$2"
            shift 2
            ;;
        --version)
            version="$2"
            shift 2
            ;;
        --platforms)
            platforms="$2"
            shift 2
            ;;
        *)
            shift
            ;;
    esac
done

set -x

helm repo add owlebot https://owlebot.github.io/helm-repo/
helm repo update

helm upgrade --install infisical-$PACKAGE_NAME owlebot/Infisical -f $PACKAGE_ROOT/k8s/helm.yaml

set +x

if [ -n "$platforms" ]; then
  echo "Deploying app for $platforms"

  IFS=','
  # POSIX compliant substituion that works in /bin/sh
  for platform in $(printf "%s" "$platforms"); do
    set -x

    helm upgrade --install $PACKAGE_NAME-$platform owlebot/App --set app.nodeEnv=$env --set app.version=$version --set app.platform=$platform -f $PACKAGE_ROOT/k8s/helm.yaml
    
    set +x
  done

else
  echo "Deploying app"

  set -x

  helm upgrade --install $PACKAGE_NAME owlebot/App --set app.nodeEnv=$env --set app.version=$version -f $PACKAGE_ROOT/k8s/helm.yaml
  
  set +x
fi
