#!/bin/sh

kubectl apply -f demo-autoscaler-sa.yaml
kubectl apply -f particles-v1.0.0.yaml
kubectl apply -f apache-bench.yaml