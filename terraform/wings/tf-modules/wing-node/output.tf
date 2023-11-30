# Ouput the name that has been given to the node
output "name" {
  value = hcloud_server.node.name
}

# Output the server's IP address
output "ip_address" {
  value = hcloud_server.node.ipv4_address
}

# Output the server's dns subdomain
output "dns_subdomain" {
  value = var.dns_a_record
}

# Output the server's ssh private key
output "ssh_private_key" {
  value     = tls_private_key.ssh.private_key_openssh
  sensitive = true
}

# Output the servers username
output "node_username" {
  value = var.node_username
}

# Output of pterodactyl node id
output "pterodactyl_node_id" {
  value = restapi_object.pterodactyl_node.id
}
