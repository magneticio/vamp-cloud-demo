#!/bin/sh

# install contour ingress
kubectl apply -f https://projectcontour.io/quickstart/contour.yaml

# configure prometheus
kubectl apply -f contour/prometheus/
