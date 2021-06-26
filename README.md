
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


### Step-4 : Verify the solution
1. Wait for 2-5 mins to get the containers deployed.
2. Access apache server few times to generate records in MySQL.
3. Login to MySql : mysql -h host -u root -p pwd  (root pwd is mentioned in docker-compose below)
   1. use apachelogs;
   2. show tables;

# Store apache2 logs in MySQL

#### [Github Url](https://github.com/ajitsingh25/embi-ebi)

#### [docker-compose.yml](https://github.com/ajitsingh25/embi-ebi/blob/master/docker-compose.yml)
