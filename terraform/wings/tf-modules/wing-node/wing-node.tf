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
  }
}

# SSH key for the Hetzner Cloud server
resource "tls_private_key" "ssh" {
  algorithm = var.ssh_key_algorithm
}

# Create a new Hetzner Cloud SSH key
resource "hcloud_ssh_key" "default" {
  name       = "${var.node_name}-ssh-key"
  public_key = tls_private_key.ssh.public_key_openssh
  depends_on = [tls_private_key.ssh]
}

# Create a new Hetzner Cloud server
resource "hcloud_server" "node" {
  name        = var.node_name
  image       = "docker-ce"
  server_type = var.node_server_type
  location    = var.node_location
  ssh_keys = [
    hcloud_ssh_key.default.id
  ]
  public_net {
    ipv4_enabled = var.node_ipv4_enabled
    ipv6_enabled = var.node_ipv6_enabled
  }
  keep_disk = true
  user_data = templatefile("${path.module}/../../cloud-init/wing.yml", {
    username = var.node_username
    ssh_key  = tls_private_key.ssh.public_key_openssh
  })
  depends_on = [hcloud_ssh_key.default]
}

data "cloudflare_zones" "example" {
  filter {
    name = var.dns_domain_name
  }
}

resource "cloudflare_record" "node_dns_a_record" {
  allow_overwrite = true
  zone_id = data.cloudflare_zones.example.zones.0.id
  name    = "${var.dns_a_record}.${var.dns_domain_name}"
  value   = hcloud_server.node.ipv4_address
  type    = "A"
  ttl     = 30
  proxied = false
}