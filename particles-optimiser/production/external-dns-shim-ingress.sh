#!/bin/sh -e

# get envoy load balancer address
envoy_lb_addr=$(kubectl get service envoy --namespace=projectcontour -o=jsonpath='{.status.loadBalancer.ingress[0].ip}')

cat <<EOM | kubectl apply -f -
apiVersion: vamp.io/v1
kind: IngressAnnotations
metadata:
  name: external-dns-shim
  namespace: production
spec:
  annotations:
    external-dns.alpha.kubernetes.io/target: $envoy_lb_addr
EOM
