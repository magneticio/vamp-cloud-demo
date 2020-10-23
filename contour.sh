#!/bin/sh

# install contour ingress
kubectl apply -f contour/contour/ && \
  kubectl rollout status deployments/contour --timeout=300s --namespace=projectcontour


# configure prometheus
kubectl apply -f contour/prometheus/
