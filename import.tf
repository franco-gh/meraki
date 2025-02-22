import {
  to = meraki_devices_appliance_uplinks_settings.example
  id = var.mx_serial
}

resource "meraki_devices_appliance_uplinks_settings" "example" {
  serial          = var.mx_serial
}