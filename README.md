
## Set GCP Env and execute Terraform

## Prerequisites:
1. Create GCP Trail Account
2. [Create GCP project.](https://cloud.google.com/resource-manager/docs/creating-managing-projects)
3. [Login with your account using gcloud](https://cloud.google.com/sdk/gcloud/reference/auth/login)


### Step-1:  Execute script gcp-setup.sh. It will do following.
sh gcp-setup.sh enter-gcp-project-id

   1. Create Service Account (SA).
   2. Assign viewer and Editor role to SA.
   3. Create SA Key


### Step-2:
terraform init

### Step-3:
terraform apply


### Step-4 : Verify the solution
1. Wait for 2-5 mins to get the containers deployed.
2. Access apache server few times to generate records in MySQL.
3. Login to MySql : mysql -h host -u root -p pwd  (root pwd is mentioned in [docker-compose](https://github.com/ajitsingh25/embi-ebi/blob/master/docker-compose.yml)  below)
   1. use apachelogs;
   2. show tables;


### Step-5 :
terraform destroy

# Store apache2 logs in MySQL main project

#### [Github Url](https://github.com/ajitsingh25/embi-ebi)

#### [docker-compose.yml](https://github.com/ajitsingh25/embi-ebi/blob/master/docker-compose.yml)
