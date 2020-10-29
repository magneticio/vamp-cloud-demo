# Optimiser Particles Demo

### Prerequisites
Prior to release any version, external DNS annotations need to be deployed as follows
```sh
./external-dns-shim-ingress.sh
```

### Start the Demo
The following script creates the Demo Autoscaler Service Account and deploys version 1.0.0
```sh
./start.sh
```
If the Application domain is NOT ```production.demo.vamp-dev.cloud```, the domain must be passed as parameter to the ```start.sh``` script

```sh
./start.sh <application_domain>

# Example: ./start.sh pre-prod.demo.vamp-dev.cloud
```

### Open Particles in Your Browser
Before continuing, open http://production.demo.vamp-dev.cloud/ in your favourite browser or the configured Application domain (for example, http://pre-prod.demo.vamp-dev.cloud)

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
