terraform {
  required_providers {
    meraki = {
      source = "CiscoDevNet/meraki"
      version = ">= 0.1.6"
    }
  }
}

provider "meraki" {
  api_key = var.api_key
}