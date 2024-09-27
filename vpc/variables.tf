variable "config" {
  type        = object({
    project = string
    mtu     = number
  })
  description = "Configuration of the VPC in GCP"
}
