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
    username                  = var.node_username
    ssh_key                   = tls_private_key.ssh.public_key_openssh
    email                     = var.letsencrypt_email
    domain                    = "${var.dns_a_record}.${var.Cloudflare_dns}"
    pterodactyl_panel_url     = var.pterodactyl_panel_url
    pterodactyl_panel_api_key = var.pterodactyl_panel_api_key
    node_id                   = restapi_object.pterodactyl_node.id
  })

  depends_on = [
    hcloud_ssh_key.default,
    restapi_object.pterodactyl_node,
  ]
}

data "cloudflare_zones" "domain_name_zone" {
  filter {
    name = var.Cloudflare_dns
  }
}

resource "cloudflare_record" "node_dns_a_record" {
  allow_overwrite = true
  zone_id         = data.cloudflare_zones.domain_name_zone.zones.0.id
  name            = var.dns_a_record
  value           = hcloud_server.node.ipv4_address
  type            = "A"
  ttl             = "60"
  proxied         = false

  depends_on = [hcloud_server.node]
}
