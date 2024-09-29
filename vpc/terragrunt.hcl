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
      name        = "icmp"
      priority    = 1000
      description = "Simple ICMP Rule"
      direction   = "INGRESS"
      allow = [
        {
          protocol = "icmp"
        }
      ]
      source_tags = ["icmp"]
      source_ranges = ["0.0.0.0/0"]
    }
    "http" = {
      name        = "http"
      priority    = 1000
      description = "Allow HTTP traffic."
      direction   = "INGRESS"
      allow = [
        {
          protocol = "tcp"
          ports    = [80, 8080]
        }
      ]
      source_tags = ["http"]
      source_ranges = ["0.0.0.0/0"]
    }
    "ssh" = {
      name        = "ssh"
      priority    = 1000
      description = "Allow SSH traffic."
      direction   = "INGRESS"
      allow = [
        {
          protocol = "tcp"
          ports    = [22]
        }
      ]
      source_tags = ["ssh"]
      source_ranges = ["0.0.0.0/0"]
    }
    "rdp" = {
      name        = "rdp"
      priority    = 1000
      description = "Allow RDP traffic."
      direction   = "INGRESS"
      allow = [
        {
          protocol = "tcp"
          ports    = [3389]
        }
      ]
      source_tags = ["rdp"]
      source_ranges = ["0.0.0.0/0"]
    }
    "default-internal" = {
      name        = "default-internal"
      priority    = 1000
      description = "Allow Default Internal"
      direction   = "INGRESS"
      allow = [
        {
          protocol = "tcp"
          ports    = ["0-65535"]
        },
        {
          protocol = "udp",
          ports    = ["0-65535"]
        },
        {
            protocol = "icmp"
        }
      ]
      source_tags = ["internal"]
      source_ranges = ["10.128.0.0/9"]
    }
  }
}