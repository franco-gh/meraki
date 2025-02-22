variable "api_key" {
  description = "The Meraki API key"
  type        = string
  sensitive   = true
}

variable "mx_serial" {
  description = "The serial number of the MX device"
  type        = string
  sensitive = true  
}

/* variable "ms_serial" {
  description = "The serial number of the MS device"
  type        = string
  sensitive = true  
}

variable "org_id" {
  description = "The organization ID"
  type        = string
  sensitive = true  
}
*/