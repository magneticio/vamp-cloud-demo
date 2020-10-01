# Particles Demo

### Create the Demo Autoscaler Service Account
```sh
kubectl apply -f demo-autoscaler-sa.yaml
```

### Deploy Version 1.0.0
```sh
kubectl apply -f particles-v1.0.0.yaml
```
Before continuing:
1. Open http://particles.acc.vamp-dev.cloud/ in Chrome
1. Open http://particles.acc.vamp-dev.cloud/ in a different browser, for example Firefox

### Deploy Version 1.0.1
```sh
kubectl apply -f particles-v1.0.1.yaml
```

### Deploy Version 1.1.0
```sh
kubectl apply -f particles-v1.1.0.yaml
```

### Deploy Version 1.1.1
```sh
kubectl apply -f particles-v1.1.1.yaml
```
