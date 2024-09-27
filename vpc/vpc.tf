resource "google_compute_network" "this" {
  project                 = var.config.project # Replace this with your project ID in quotes
  name                    = format("%s-vpc", var.config.project)
  auto_create_subnetworks = true
  mtu                     = var.config.mtu
}
