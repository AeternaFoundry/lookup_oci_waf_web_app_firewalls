variable "waf_web_app_firewalls_lookup" {
  description = <<EOT
Map of waf_web_app_firewalls_lookup, attributes below
Required:
    - compartment_id
Optional:
    - display_name
    - state
    - web_app_firewall_policy_id
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    compartment_id             = string
    display_name               = optional(string)
    state                      = optional(list(string))
    web_app_firewall_policy_id = optional(string)
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
}

