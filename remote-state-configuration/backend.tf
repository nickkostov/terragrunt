terraform {
  backend "gcs" {
    bucket = "mps-terraform-remote-states-nonprod"
    prefix = "remote-state-configuration/terraform.tfstate"
  }
}