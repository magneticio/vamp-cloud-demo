#!/bin/sh

kubectl delete -f particles-v1.0.0.yaml
kubectl delete -f particles-v1.0.1.yaml
kubectl delete -f particles-v1.0.2.yaml

if [ "$1" != "--keep-agent" ]; then
    kubectl delete ns production
fi
