# IP address of the Hetzner Cloud server
output "ip_address" {
  value = module.wing-node.ip_address
}

# SSH key for the Hetzner Cloud server
output "ssh_private_key" {
  value     = module.wing-node.ssh_private_key
  sensitive = true
}

output "node_username" {
  value = module.wing-node.node_username  
}
