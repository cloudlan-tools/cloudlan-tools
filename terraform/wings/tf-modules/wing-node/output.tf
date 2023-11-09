# Output the server's IP address
output "ip_address" {
  value = hcloud_server.web.ipv4_address
}

# Output the server's ssh private key
output "ssh_private_key" {
  value     = tls_private_key.ssh.private_key_openssh
  sensitive = true
}