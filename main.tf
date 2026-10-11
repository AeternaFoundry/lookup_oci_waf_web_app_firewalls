data "oci_waf_web_app_firewalls" "waf_web_app_firewalls_lookup" {
  for_each = var.waf_web_app_firewalls_lookup

  compartment_id             = each.value.compartment_id
  display_name               = each.value.display_name
  state                      = each.value.state
  web_app_firewall_policy_id = each.value.web_app_firewall_policy_id

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

