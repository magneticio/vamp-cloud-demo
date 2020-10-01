#!/bin/sh

kubectl delete -f particles-v1.0.0.yaml
kubectl delete -f particles-v1.0.1.yaml
kubectl delete -f particles-v1.1.0.yaml
kubectl delete -f particles-v1.1.1.yaml