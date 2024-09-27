include "root" {
  path = find_in_parent_folders()
}

inputs = {
  config = {
    project = "mps-infra-shared-nonprod"
    mtu     = "1500"
  }
  firewall_rule = {
    "icmp" = {
        name = "icmp"
        priority = 1000
        description = "Simple ICMP Rule"
        direction = "INGRESS"
        allow = [
            {
              protocol = "icmp"
            }
        ]
        source_tags = ["icmp"]
    }
    "http" = {
      name        = "http"
      priority    = 1000
      description = "Allow HTTP traffic."
      direction = "INGRESS"
      allow = [
        {
          protocol = "tcp"
          ports    = [80, 8080]
        }
      ]
    source_tags = ["http"]
    }
  }
}