module "wing-node" {
  source = "./tf-modules/wing-node"

  pterodactyl_panel_url     = var.pterodactyl_panel_url
  pterodactyl_panel_api_key = var.pterodactyl_panel_api_key

  node_fqdn         = var.domain
  letsencrypt_email = var.letsencrypt_email
}
