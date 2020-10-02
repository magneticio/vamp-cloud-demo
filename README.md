# Vamp Cloud Demo
## Instructions for Bootstrapping an Application Cluster
These instructions populate a cluster with Prometheus and the Envoy-based Project Contour Ingress.

If you need to create to a Kubernetes cluster, you can follow these instructions to setup a suitable cluster on Google Cloud
```sh
./create-cluster-gke.sh <cluster-name> <gcloud-project-id> <region>
```

Alternatively, you can use these instructions to setup a suitable cluster on [AWS](https://github.com/magneticio/vamp-cloud-demo/blob/master/create-k8s-cluster.md#amazon-kubernetes-service) or [Digital Ocean](https://github.com/magneticio/vamp-cloud-demo/blob/master/create-k8s-cluster.md#digital-ocean).

#### Install Prometheus and Project Contour 
This will install Prometheus and the latest version of Contour:
```sh
./contour.sh
```

You can find more details at [projectcontour.io](https://projectcontour.io/getting-started/).

#### Configure external-dns
These instructions assume that you have [Workload Identity](https://cloud.google.com/kubernetes-engine/docs/how-to/workload-identity) configured
```sh
./external-dns.sh <gcloud-project-id> <gcloud-service-account>
```

#### Run the Vamp Release Agent Installer
You can now install the Vamp Release Agent for you application using the command shown on the application details tab in the Vamp Cloud UI.
