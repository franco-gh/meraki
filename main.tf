data "meraki_organizations" "org" {
}

locals {
  organizations = {
  for org in data.meraki_organizations.org.items : org.id => org
  }
}

data "meraki_organization_inventory_devices" "inventory_devices" {
  for_each = local.organizations
  organization_id = each.key
}