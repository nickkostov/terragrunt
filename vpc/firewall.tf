resource "google_compute_firewall" "this" {
  for_each = var.firewall_rule
  name    = format("%s-firewall-rules", each.value.name)
  direction = each.value.direction
  network = google_compute_network.this.name
  priority = each.value.priority
  description = each.value.priority
  source_ranges = each.value.source_ranges
  source_service_accounts = each.value.source_service_accounts
  target_service_accounts = each.value.target_service_accounts
  target_tags = each.value.target_tags

  dynamic "allow" {
    for_each = each.value.allow
    content {
      protocol = allow.value["protocol"]
      ports =  allow.value["ports"]
    }
  }
  source_tags = each.value.source_tags

}
  #var.config.project)
#  