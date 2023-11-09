# Create a new Hetzner Cloud server
resource "hcloud_server" "web" {
    name        = "wing-demo"
    image       = "docker-ce"
    server_type = "ccx13"
    location    = "hel1"
    public_net {
        ipv4_enabled = true
        ipv6_enabled = true
    }
    keep_disk = true
}