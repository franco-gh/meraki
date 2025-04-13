terraform {
  required_providers {
    meraki = {
      source = "cisco-open/meraki"
      version = "1.0.2-beta"
    }
  }
}

provider "meraki" {
  meraki_dashboard_api_key = var.api_key
}