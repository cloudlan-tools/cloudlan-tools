# Create a new Hetzner Cloud SSH key
resource "hcloud_ssh_key" "default" {
  name       = "wing-demo-ssh-key"
  public_key = tls_private_key.ssh.public_key_openssh
}

# Create a new Hetzner Cloud server
resource "hcloud_server" "web" {
  name        = "wing-demo"
  image       = "docker-ce"
  server_type = "ccx13"
  location    = "hel1"
  ssh_keys = [
    hcloud_ssh_key.default.id
  ]
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  keep_disk = true
  user_data = templatefile("${path.module}/configs/wing-cloud-init.yml", {
    username = "cloudlan"
    ssh_key  = tls_private_key.ssh.public_key_openssh
  })
}