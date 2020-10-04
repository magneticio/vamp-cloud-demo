# Particles Demo

### Start the Demo
The following script creates the Demo Autoscaler Service Account and deploys version 1.0.0
```sh
./start.sh
```

### Open Two Browser Windows, One in Chrome
Before continuing:
1. Open http://particles.demo.vamp-dev.cloud/ in Chrome
1. Open http://particles.demo.vamp-dev.cloud/ in a different browser, for example Firefox

### Deploy Version 1.0.1
The release of this version should use be successful
```sh
kubectl apply -f particles-v1.0.1.yaml
```

### Deploy Version 1.1.0
The release of this version should fail in the second step
```sh
kubectl apply -f particles-v1.1.0.yaml
```

### Deploy Version 1.1.1
The release of this version should be successful
```sh
kubectl apply -f particles-v1.1.1.yaml
```

### Clean up
The following script removes all the versions and then deletes the namespace
```sh
./cleanup.sh
```
