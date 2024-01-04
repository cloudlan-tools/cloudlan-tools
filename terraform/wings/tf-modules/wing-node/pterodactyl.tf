# Create Node in Pterodactyl Panel
resource "restapi_object" "pterodactyl_node" {
  path = "/api/application/nodes"
  data = jsonencode({
    "name" : "${var.node_name}",
    "location_id" : "${var.pterodactyl_wings_location_id}",
    "fqdn" : "${var.dns_a_record}.${var.Cloudflare_dns}",
    "scheme" : "https",
    "memory" : "${var.node_memory}",
    "memory_overallocate" : -1,
    "disk" : "${var.node_disk}",
    "disk_overallocate" : -1,
    "upload_size" : "${var.pterodactyl_wings_upload_size}",
    "daemon_sftp" : "${var.pterodactyl_wings_daemon_sftp}",
    "daemon_listen" : "${var.pterodactyl_wings_daemon_listen}",
  })
}

# Create Node allocation in Pterodactyl Panel
# This is only done once, and should never be redone, as it does not return an object to keep track of
locals {
  pterodactyl_node_allocation_data = jsonencode({
    ip    = hcloud_server.node.ipv4_address
    alias = "${var.dns_a_record}.${var.Cloudflare_dns}"
    ports = var.pterodactyl_ports_allocation
  })
}

resource "null_resource" "pterodactyl_node_allocation" {

  # We use local-exec here, as the Pterodactyl API does not return an object to keep track of
  provisioner "local-exec" {
    command = "curl -X POST -H \"Authorization: Bearer ${var.pterodactyl_panel_api_key}\" -H \"Content-Type: application/json\" -d '${local.pterodactyl_node_allocation_data}' ${var.pterodactyl_panel_url}/api/application/nodes/${restapi_object.pterodactyl_node.id}/allocations"
  }

  depends_on = [
    restapi_object.pterodactyl_node,
    hcloud_server.node
  ]
}
