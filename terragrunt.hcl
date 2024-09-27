generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "google" {
  project = "mps-infra-shared-nonprod"
  region  = "europe-north1"
}
EOF
}
generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_providers {
  google = {
  source = "hashicorp/google"
  version = "6.4.0"
  }
  }
  backend "gcs" {
    prefix = "${path_relative_to_include()}-state/terraform.tfstate"
    bucket = "mps-terraform-remote-states-nonprod"
  }
}
EOF
}