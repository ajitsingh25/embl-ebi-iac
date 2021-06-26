
# Setup GCP environment including Service Account

##Prerequisites
1. Create GCP Account
2. Create GCP project.
3. Login with your account using gcloud <gcloud auth login>

##Step-1
sh gcp-setup.sh <gcp-project-id>

Above script will create the "mykey.json" and setup the "terraform.tfvars".

##Step-2
terraform init

##Step-3
terraform apply

