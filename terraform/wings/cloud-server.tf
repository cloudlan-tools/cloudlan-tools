# Create Node location in Pterodactyl Panel
resource "restapi_object" "pterodactyl_location" {
  for_each = var.pterodactyl_locations

  path = "/api/application/locations"
  data = jsonencode({
    "short" : each.value.short,
    "long" : each.value.long,
  })
}

# Create cloud server node
module "wing-node" {
  source = "./tf-modules/wing-node"

  // Values unique to each node
  for_each         = var.servers
  dns_a_record     = coalesce(each.value.dns_subdomain, each.key)
  node_name        = each.key
  node_server_type = each.value.type
  node_location    = var.pterodactyl_locations[each.value.location].datacenter
  node_memory      = each.value.memory
  node_disk        = each.value.disk

  // Optional values
  node_username                   = each.value.username
  node_ipv4_enabled               = each.value.ipv4_enabled
  node_ipv6_enabled               = each.value.ipv6_enabled
  pterodactyl_wings_upload_size   = each.value.pterodactyl_wings_upload_size
  pterodactyl_wings_daemon_sftp   = each.value.pterodactyl_wings_daemon_sftp
  pterodactyl_wings_daemon_listen = each.value.pterodactyl_wings_daemon_listen

  // General values
  dns_domain_name = var.dns_domain_name

  pterodactyl_panel_url     = var.pterodactyl_panel_url
  pterodactyl_panel_api_key = var.pterodactyl_panel_api_key

  letsencrypt_email = var.letsencrypt_email

  pterodactyl_wings_location_id = coalesce(each.value.pterodactyl_wings_location_id, restapi_object.pterodactyl_location["${each.value.location}"].id)

  depends_on = [
    restapi_object.pterodactyl_location
  ]
}
