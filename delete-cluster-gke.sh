#!/bin/sh

CLUSTER_NAME=$1
PROJECT_ID=$2
REGION=${3:-europe-west4}

# Remove Cluster
gcloud container clusters delete "$CLUSTER_NAME" \
  --project "$PROJECT_ID" \
  --region "$REGION"
  