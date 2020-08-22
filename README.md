# Vamp Cloud Demo
## Instructions for Bootstrapping an Application Cluster
These instructions populate a cluster using Prometheus Operator and the Envoy-based Project Contour Ingress.

If you need to create to a Kubernetes cluster, you can follow these instructions to setup a suitable cluster on [Google Cloud](https://github.com/magneticio/vamp-cloud-demo/blob/master/create-k8s-cluster.md#google-kubernetes-engine), [AWS](https://github.com/magneticio/vamp-cloud-demo/blob/master/create-k8s-cluster.md#amazon-kubernetes-service) or [Digital Ocean](https://github.com/magneticio/vamp-cloud-demo/blob/master/create-k8s-cluster.md#digital-ocean).
#### Install Prometheus Operator
This is a minimum install of the latest version (v0.41.1 at the time of writing):
```sh
kubectl apply -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.41.1/bundle.yaml
```

You can find more details in the [GitHub project](https://github.com/prometheus-operator/prometheus-operator#quickstart).

#### Install Project Contour
This will install the latest version (v1.7.0 at the time of writing):
```sh
kubectl apply -f https://projectcontour.io/quickstart/contour.yaml
```

You can find more details at [projectcontour.io](https://projectcontour.io/getting-started/).

#### Create a *PodMonitor* for Contour
This creates the Prometheus configuration to scrape metrics from Envoy and the required ClusterRole, ClusterRoleBinding, and Service Account.
```sh
kubectl apply -f https://raw.githubusercontent.com/magneticio/vamp-cloud-demo/master/contour-pod-monitor.yaml
```
#### Run the Vamp Release Agent Installer
You can now install the Vamp Release Agent for you application using the command shown on the application details tab in the Vamp Cloud UI.
