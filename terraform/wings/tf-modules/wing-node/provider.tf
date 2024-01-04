terraform {
  required_providers {
    # Hetzner Cloud Provider
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = ">=1.44"
    }

    # TLS Provider
    tls = {
      source  = "hashicorp/tls"
      version = ">=4.0"
    }

    # Cloudflare Provider
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">=4.18"
    }

    # REST API Provider
    restapi = {
      source  = "Mastercard/restapi"
      version = ">=1.18.2"
    }
  }
}