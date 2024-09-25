# Private Data Handling Terraform for GCP

## Attention:  
This is base code set to assist with automating Private Data Handling for Alteryx Analytics Cloud Platform in an GCP environment, there is absolutely **no support for this code** as it is being offered as a staring point only, considered as open source or freeware, modify or enhance for your environment at will. **Use at your own risk!**  

## THERE IS ABSOLUTLEY NO SUPPORT FOR THIS CODE BASE.

#### Recommendation:
Use this code base on an isolated environment, do not execute on and existing Production environment, it is specific to Private Data Handling for Alteryx Designer Cloud in GCP. 

### Features:
Base setup of GCP "Network Only" required for PDH

### How to use terraform:
https://developer.hashicorp.com/terraform/tutorials/automation/automate-terraform
#####
`terraform init`
#####
`terraform validate`
#####
`terraform plan`
#####
`terraform apply`
#####
`terraform destroy`
## Prerequisites:
1. **GCP Account:** You need an active Google Cloud Platform account and access to a project where you have the necessary permissions. 
2. **GCP Project:** A Google Cloud project where resources will be deployed. Ensure you have the Owner or Editor role in the project. 
3. **Google Cloud SDK:** Install the Google Cloud SDK (gcloud) to interact with GCP from your local machine.
4. **Terraform:** Install Terraform on your local machine.
5. **Service Account with IAM Permissions:** Create a Service Account in GCP with the following IAM roles for the Terraform service account:
	-	roles/viewer (to read the project resources)
	-	roles/storage.admin (for managing state files)
	-	roles/editor or specific permissions depending on the resources you plan to create (like roles/compute.admin for Compute Engine).
6. **Service Account Key:** Download a JSON key file for the Service Account. This key will be used to authenticate Terraform to GCP.
7. **Enable APIs:** Enable the necessary APIs in your GCP project. For example:
	-	Compute Engine API
	-	Cloud Storage API
	-	Any other API required by the resources you plan to create.
### Step by Step
**Authenticate gcloud and Set Project:**
#####
`gcloud auth login`
#####
**Set Up the Service Account for Terraform:**
#####
`gcloud config set project <your-gcp-project-id>`
#####
####
**Assign IAM Roles to the Service Account:**
#####
`gcloud iam service-accounts create terraform-sa \
  --description="Terraform Service Account" \
  --display-name="Terraform SA"1`
#####
**Create and download a JSON key file for the Service Account:**
#####
`gcloud projects add-iam-policy-binding <your-gcp-project-id> \
  --member="serviceAccount:terraform-sa@<your-gcp-project-id>.iam.gserviceaccount.com" \
  --role="roles/editor"`
#####
**Create and download a JSON key file for the Service Account:**
####
`gcloud iam service-accounts keys create ~/terraform-key.json \
  --iam-account=terraform-sa@<your-gcp-project-id>.iam.gserviceaccount.com`
#####
**Configure Terraform Provider:**
`provider "google" {
  credentials = file("<path-to-your-key-file>/terraform-key.json")
  project     = "<your-gcp-project-id>"
  region      = "us-central1"  # or any other region you prefer
  zone        = "us-central1-a"  # or any other zone you prefer
}`
#####
**Enable the API via Command Line:**
####
`gcloud services enable compute.googleapis.com --project=tf-pdh`
#####
**Verify the API is Enabled:**
####
`gcloud services list --enabled --project=tf-pdh`
## Modify the following files Azure deployment

provider.tf 
- credentials 
- project

backend.tf - This is where you would add a storage account to store your terraform state file




