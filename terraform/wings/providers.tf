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

    # Cloudflare Provider
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">=4.18"
    }

    # TLS Provider
    tls = {
      source  = "hashicorp/tls"
      version = ">=4.0"
    }
  }
}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}

# Configure the Cloudflare Provider
provider "cloudflare" {
  api_key = var.cloudflare_api_token
}