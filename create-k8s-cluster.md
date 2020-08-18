# Creating a Kubernetes cluster

Below you can find examples of creating a small 3 nodes Kubernetes
cluster to try Vamp Cloud on multiple clouds.

## Google Kubernetes Engine

Using [gcloud](https://cloud.google.com/sdk/gcloud/) to create a 3 nodes Kubernetes cluster:

```sh
gcloud container clusters create vamp-cloud-cluster \
  --project $YOUR_GOOGLE_CLOUD_PROJECT \
  --region europe-west1 \
  --num-nodes 1 \
  --machine-type e2-standard-2
```

## Amazon Kubernetes Service

The [eksctl](https://github.com/weaveworks/eksctl) is a very helpful
tool to manage EKS clusters, you can find more docs on how to set it
up [here](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html).

```sh
# Create 3 nodes Kubernetes cluster
eksctl create cluster --name vamp-cloud-cluster \
  --nodes 3 \
  --node-type=t3.large \
  --region=eu-west-1

# Get the credentials for your cluster
eksctl utils write-kubeconfig --name $YOUR_EKS_NAME --region eu-west-1
```

## Digital Ocean

You can use [doctl](https://github.com/digitalocean/doctl) tool to create a cluster as follows:

```sh 
doctl kubernetes cluster create vamp-cloud-ams3 --count 3 --region ams3
```

## Azure Kubernetes Service
To do
