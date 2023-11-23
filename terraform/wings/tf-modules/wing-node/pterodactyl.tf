# Create Node in Pterodactyl Panel
resource "restapi_object" "pterodactyl_node" {
  path = "/api/application/nodes"
  data = jsonencode({
    "name" : "${var.node_name}",
    "location_id" : "${var.pterodactyl_wings_location_id}",
    "fqdn" : "${var.node_fqdn}",
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
