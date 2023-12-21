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

    # REST API Provider
    restapi = {
      source  = "Mastercard/restapi"
      version = ">=1.18.2"
    }
  }
}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}

# Configure the Cloudflare Provider
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "restapi" {
  uri                  = var.pterodactyl_panel_url
  write_returns_object = true
  debug                = false

  headers = {
    "Authorization" = "Bearer ${var.pterodactyl_panel_api_key}"
    "Content-Type"  = "application/json"
    "Accept"        = "application/json"
  }

  id_attribute   = "attributes/id"
  create_method  = "POST"
  update_method  = "PATCH"
  destroy_method = "DELETE"
}
