# How to create the remote state in GCP:

Prerequisites: 
- `terraform`: v1.9.6
- `gcloud-sdk`:
```bash
Google Cloud SDK 494.0.0
alpha 2024.09.20
beta 2024.09.20
bq 2.1.8
bundled-python3-unix 3.11.9
core 2024.09.20
gcloud-crc32c 1.0.0
gsutil 5.30
```

---
### Authenticate with the command below in the CLI:
```bash
gcloud auth application-default login
```
### You need to make sure your storage API is enabled:

```bash
gcloud services enable storage.googleapis.com
```
### Create the following files:
```bash
.
├── backend.tf
├── gcs.tf
├── provider.tf
```
### In the `backend.tf` the content is:
(Keep in mind I am having this commented out, you need to uncomment and `terraform init` again after you have deployed it.)

```hcl
terraform {
  backend "gcs" {
    bucket = "mps-terraform-remote-states-nonprod"
    prefix = "remote-state-configuration/terraform.tfstate"
  }
}
```
### In the `gcs.tf` the content is:

```hcl
resource "google_storage_bucket" "this" {
  name     = "mps-terraform-remote-states-nonprod"
  location = "europe-north1"

  # Versioning prevent Loss
  versioning {
    enabled = true
  }
}
```
### In the `provider.tf` the content is:
```hcl
provider "google" {
  project = "mps-infra-shared-nonprod"
  region  = "europe-north1"
}
```
### After you create the files you need to do the following:
1. Init the configuration:
```bash
terraform init
```
2. Plan the configuration:
```bash
terraform plan
```
3. Apply the configuration:
```bash
terraform apply
```
4. Uncomment the `backend.tf` contents and init again, this will promt you to migrate the state. If it does not work you will have to manually push the state file.

**Either**
```bash
terraform init
```
or
```bash
terraform state push
```

---