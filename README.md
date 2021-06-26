
# Setup GCP environment including Service Account

## Prerequisites
1. Create GCP Trail Account
2. [Create GCP project.](https://cloud.google.com/resource-manager/docs/creating-managing-projects)
3. [Login with your account using gcloud](https://cloud.google.com/sdk/gcloud/reference/auth/login)

### Step-1
sh gcp-setup.sh enter-gcp-project-id
#### Above script will create the "mykey.json" and setup the "terraform.tfvars".

### Step-2
terraform init

### Step-3
terraform apply


# Store apache2 logs in MySQL

### [Github Url](https://github.com/ajitsingh25/embi-ebi)

### [docker-compose.yml](https://github.com/ajitsingh25/embi-ebi/blob/master/docker-compose.yml)
