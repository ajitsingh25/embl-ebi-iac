#!/bin/sh

PROJECT_ID=$1

# Set default project
gcloud config set project $PROJECT_ID

# create service account(SA)
gcloud iam service-accounts create terraform-adm \
    --description="Terrafoem account" \
    --display-name="terraform_adm"

# reate SA Key
gcloud iam service-accounts keys create mykey.json \
    --iam-account=terraform-adm@${PROJECT_ID}.iam.gserviceaccount.com

# Add roles to SA
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:terraform-adm@${PROJECT_ID}.iam.gserviceaccount.com" \
    --role="roles/viewer"

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:terraform-adm@${PROJECT_ID}.iam.gserviceaccount.com" \
    --role="roles/editor"

# Enabe service API
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable cloudbilling.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable compute.googleapis.com

# Update terraform variables
sed -e "s#PROJECT_ID#${PROJECT_ID}#g"  terraform.tfvars.tmp > terraform.tfvars
