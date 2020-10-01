#!/bin/sh

CLUSTER_NAME=$1
PROJECT_ID=$2
REGION=${3:-europe-west4}

set -e

# create cluster on GKE
gcloud beta container clusters create "$CLUSTER_NAME" \
  --project "$PROJECT_ID" \
  --region "$REGION" \
  --cluster-version "1.17.9-gke.1504" \
  --release-channel "regular" \
  --machine-type "n2-custom-2-4096" \
  --image-type "COS" \
  --disk-type "pd-standard" \
  --disk-size "20" \
  --num-nodes "1" \
  --enable-autoscaling --min-nodes "1" --max-nodes "3" \
  --enable-shielded-nodes \
  --default-max-pods-per-node "110" \
  --max-pods-per-node "110" \
  --enable-stackdriver-kubernetes \
  --network "projects/$PROJECT_ID/global/networks/default" \
  --subnetwork "projects/$PROJECT_ID/regions/$REGION/subnetworks/default" \
  --enable-ip-alias \
  --no-enable-master-authorized-networks \
  --enable-autoupgrade --max-surge-upgrade 1 --max-unavailable-upgrade 0 \
  --enable-autorepair \
  --no-enable-basic-auth \
  --metadata disable-legacy-endpoints=true \
  --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" \
  --addons HorizontalPodAutoscaling,HttpLoadBalancing \
  --workload-pool="$PROJECT_ID.svc.id.goog"

# get kubectl config
gcloud container clusters get-credentials "$CLUSTER_NAME" \
  --project "$PROJECT_ID" \
	--region "$REGION"
