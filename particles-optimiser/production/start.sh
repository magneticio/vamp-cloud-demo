#!/bin/sh -e

HOST=${1:-production.demo.vamp-dev.cloud}

kubectl apply -f demo-autoscaler-sa.yaml
kubectl apply -f particles-v1.0.0.yaml

cat <<EOM | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: apache-bench
  namespace: production
  annotations:
    vamp.io/release: "false"
spec:
  selector:
    matchLabels:
      app: apache-bench
  replicas: 1
  template:
    metadata:
      labels:
        app: apache-bench
    spec:
      containers:
        - name: apache-bench
          image: jordi/ab
          args:
          - "-c"
          - "9"
          - "-n"
          - "1000000"
          - "-H"
          - "Host: $HOST"
          - "http://envoy.projectcontour/particles"
EOM