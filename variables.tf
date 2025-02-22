variable "api_key" {
  description = "The API key for the Meraki dashboard"
  type = string
}

variable "meraki_organizations" {
  description = "The organizations in the Meraki dashboard"
  type = object({
    org = string
  })
}

#variable "org_name" {
#  description = "The name of the organization"
#  type = string
#}

/* variable "meraki_base_url" {
  description = "The base URL for the Meraki dashboard"
  type = string
} */

/* variable "mx_serial" {
  description = "The serial number of the MX device"
  type = string
} */

/* variable "meraki_organization_id" {
  description = "The ID of the Meraki organization"
  type = string
} */
