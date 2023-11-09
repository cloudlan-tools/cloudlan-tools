terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = ">=1.44"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">=4.0"
    }
  }
}

# SSH key for the Hetzner Cloud server
resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

# Create a new Hetzner Cloud SSH key
resource "hcloud_ssh_key" "default" {
  name       = "${var.node_name}-ssh-key"
  public_key = tls_private_key.ssh.public_key_openssh
  depends_on = [tls_private_key.ssh]
}

# Create a new Hetzner Cloud server
resource "hcloud_server" "web" {
  name        = var.node_name
  image       = "docker-ce"
  server_type = var.node_server_type
  location    = var.node_location
  ssh_keys = [
    hcloud_ssh_key.default.id
  ]
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  keep_disk = true
  user_data = templatefile("${path.module}/../../cloud-init/wing.yml", {
    username = var.node_username
    ssh_key  = tls_private_key.ssh.public_key_openssh
  })
  depends_on = [hcloud_ssh_key.default]
}
