variable "config" {
  type        = object({
    project = string
    mtu     = number
  })
  description = "Configuration of the VPC in GCP"
}

variable "firewall_rule" {
  description = "A map of firewall rules to create."
  type = map(object({
    name        = optional(string)
    priority    = optional(number)
    description = optional(string)
    direction   = optional(string)
# Finish the variable Declaration
    allow = optional(list(object({
      protocol = optional(string)
      ports    = optional(list(number))
    })))
    source_tags = optional(list(string))
  }))
}