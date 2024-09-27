resource "google_storage_bucket" "this" {
  name     = "mps-terraform-remote-states-nonprod"
  location = "europe-north1"

  # Versioning prevent Loss
  versioning {
    enabled = true
  }
}