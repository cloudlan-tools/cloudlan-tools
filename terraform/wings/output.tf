# IP address of the Hetzner Cloud server
output "ip_address" {
  value = {
    for node in module.wing-node : node.name => node.ip_address
  }
}

output "dns_subdomain" {
  value = {
    for node in module.wing-node : node.name => "${node.dns_subdomain}.${var.Cloudflare_dns}"
  }
}

# SSH key for the Hetzner Cloud server
output "ssh_private_key" {
  value = {
    for node in module.wing-node : node.name => node.ssh_private_key
  }
  sensitive = true
}

output "node_username" {
  value = {
    for node in module.wing-node : node.name => node.node_username
  }
}
