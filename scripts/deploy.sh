#!/bin/bash

# Ensure kustomize and kubectl are available
if ! command -v kustomize &> /dev/null; then
    echo "kustomize could not be found"
    exit 1
fi

if ! command -v kubectl &> /dev/null; then
    echo "kubectl could not be found"
    exit 1
fi

# Base directory containing microservice folders
BASE_DIR="../micro-services"

# Loop through each folder in the base directory
for dir in "$BASE_DIR"/*; do
    if [ -d "$dir" ]; then
        echo "Deploying $dir/dev"
        if ! kustomize build "$dir/dev" --enable-helm --load-restrictor=LoadRestrictionsNone | kubectl apply -f -; then
            echo "Failed to deploy $dir/dev"
            exit 1
        fi
    fi
done