terraform {
  #Required terraform version
  required_version = ">= 1.6.2"
  # Required providers
  required_providers {
  # Hetzner Cloud Provider
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = ">=1.44"
    }
    # cloudflare = {
    #   source  = "cloudflare/cloudflare"
    #   version = ">=4.18"
    # }
  }
}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  alias = "hcloud"
  token = var.hcloud_token
}

# # Configure the Cloudflare Provider
# provider "cloudflare" {
#   api_key = var.cloudflare_api_token
# }