terraform {
  required_providers {
    meraki = {
      source  = "CiscoDevNet/meraki"
      version = "~> 2.0.0"
    }
  }
}

provider "meraki" {
  api_key = var.api_key
}