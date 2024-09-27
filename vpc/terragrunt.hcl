include "root" {
  path = find_in_parent_folders()
}

inputs = {
  config = {
    project = "mps-infra-shared-nonprod"
    mtu     = "1500"
  }
}