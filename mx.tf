# This is a baseline Meraki MX configuration

locals {
  # Location definitions
  locations = {
    nyc = {
      octet = "50"
      name  = "NYC"
    }
    dal = {
      octet = "60"
      name  = "DAL"
    }
  }

  # VLAN definitions
  vlans = {
    av = {
      id    = "18"
      name  = "AV"
    }
    voice = {
      id    = "19"
      name  = "Voice"
    }
    printers = {
      id    = "20"
      name  = "Printers"
    }
  }

  network_location = var.network_location

    # Generate all VLAN configurations for all locations
      vlan_configs = {
    for vlan_key, vlan in local.vlans : 
    "${var.network_location}-${vlan_key}" => {
      location_octet = local.locations[var.network_location].octet
      vlan_octet    = vlan.id  # This will be used as the third octet
      name          = "${local.locations[var.network_location].name} - ${vlan.name}"
      network_id    = vlan.id  # Using VLAN ID as the network_id
    }
  }
}

resource "meraki_networks_appliance_settings" "mx_settings" {

  client_tracking_method = "MAC address"
  deployment_mode        = "routed"
  dynamic_dns = {

    enabled = false
  }
  network_id = var.network_id
}

resource "meraki_networks_appliance_vlans_settings" "mx_vlan_config" {

  network_id    = var.network_id
  vlans_enabled = true
}

resource "meraki_networks_appliance_vlans" "vlans" {
  for_each = local.vlan_configs

  network_id                = each.value.network_id  # Using the VLAN ID as network_id
  name                      = each.value.name
  appliance_ip             = "10.${each.value.location_octet}.${each.value.vlan_octet}.1"
  cidr                     = "10.${each.value.location_octet}.${each.value.vlan_octet}.0/24"
  subnet                   = "10.${each.value.location_octet}.${each.value.vlan_octet}.0/24"
  dhcp_handling            = "Run a DHCP server"
  dhcp_lease_time          = "1 day"
  dhcp_boot_options_enabled = false
  
  ipv6 = {
    enabled = false
  }
  
  mandatory_dhcp = {
    enabled = true
  }
  
  mask               = 28
  template_vlan_type = "same"
}

