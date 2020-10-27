#!/bin/sh -e

PROJECT_ID=$1
GCLOUD_SA=$2

cat <<EOM | kubectl apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  annotations:
    iam.gke.io/gcp-service-account: $GCLOUD_SA
  name: external-dns
  namespace: default
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: external-dns
rules:
  - apiGroups: [""]
    resources: ["services", "endpoints", "pods"]
    verbs: ["get", "watch", "list"]
  - apiGroups: ["extensions", "networking.k8s.io"]
    resources: ["ingresses"]
    verbs: ["get", "watch", "list"]
  - apiGroups: [""]
    resources: ["nodes"]
    verbs: ["list"]
  # This section is only for HTTPProxy
  - apiGroups: ["projectcontour.io"]
    resources: ["httpproxies"]
    verbs: ["get","watch","list"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: external-dns-viewer
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: external-dns
subjects:
  - kind: ServiceAccount
    name: external-dns
    namespace: default
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: external-dns
  namespace: default
spec:
  strategy:
    type: Recreate
  selector:
    matchLabels:
      app: external-dns
  template:
    metadata:
      labels:
        app: external-dns
    spec:
      containers:
        - args:
            - --source=ingress
            - --source=service
            - --source=contour-httpproxy
            - --domain-filter=vamp-dev.cloud
            - --provider=google
            - --policy=upsert-only
            - --google-project=$PROJECT_ID
            - --registry=txt
            - --txt-owner-id=vamp-cloud-demo
            - --log-level=debug
          image: k8s.gcr.io/external-dns/external-dns:v0.7.4
          name: external-dns
      securityContext:
        fsGroup: 65534
        runAsUser: 65534
      serviceAccountName: external-dns
EOM
