# Vamp Cloud Demo
## Instructions for Bootstrapping an Application Cluster
These instructions populate a cluster using Prometheus Operator and the Envoy-based Project Contour Ingress
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

#### Create a *ServiceMonitor* for Contour
This creates the  Prometheus configuration to scrape metrics from Envoy and the required ClusterRole, ClusterRoleBinding, and Service Account.
```sh
kubectl apply -f https://raw.githubusercontent.com/magneticio/vamp-cloud-demo/master/contour-service-monitor.yaml
```
#### Run the Vamp Release Agent Installer
You can now install the Vamp Release Agent for you application using the command shown on the application details tab in the Vamp Cloud UI.
