data "meraki_organizations" "org" {
}

locals {
  organizations = {
  for org in data.meraki_organizations.org.items : org.id => org
  }
}

data "meraki_organizations_inventory_devices" "inventory" {
  for_each = local.organizations
  organization_id = each.key
}

locals {
  inventory_devices = {
    for org_id, org_devices in data.meraki_organizations_inventory_devices.inventory : 
    org_id => org_devices.list # Use .list instead of direct access
  }
}
