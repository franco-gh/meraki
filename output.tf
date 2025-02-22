output "organizations" {
  description = "List of all Meraki organizations"
  value = local.organizations
}

output "meraki_organization_inventory_devices" {
  description = "Inventory devices for each organization"
  value = {
    for org_id, devices in data.meraki_organization_inventory_devices.inventory_devices : org_id => devices.items
  }
}

/* output "meraki_organizations_org" {
  value = var.meraki_organizations.org
}

output "meraki_organization_inventory_devices" {
  value = data.meraki_organization_inventory_devices.inventory_devices.items
}

output "org_id" {
  value = local.org_id
}
*/