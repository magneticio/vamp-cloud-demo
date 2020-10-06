# Optimiser Particles Demo

### Start the Demo
The following script creates the Demo Autoscaler Service Account and deploys version 1.0.0
```sh
./start.sh
```

### Open Particles in Your Browser
Before continuing, open http://production.demo.vamp-dev.cloud/ in your favourite browser

### Deploy Version 1.0.1
The release of this version should fail in the second step
```sh
kubectl apply -f particles-v1.0.1.yaml
```

### Deploy Version 1.0.2
The release of this version should be successful
```sh
kubectl apply -f particles-v1.0.2.yaml
```

### Clean up
The following script removes all the versions and then deletes the namespace
```sh
./cleanup.sh
```