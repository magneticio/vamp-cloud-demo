#!/bin/sh

# install contour ingress
kubectl apply -f https://projectcontour.io/quickstart/contour.yaml && \
  kubectl rollout status deployments/contour --timeout=300s --namespace=projectcontour


# configure prometheus
kubectl apply -f contour/prometheus/