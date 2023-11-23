variable "hcloud_token" {
  sensitive = true # Requires terraform >= 0.14
  type      = string
}

variable "cloudflare_api_token" {
  sensitive = true # Requires terraform >= 0.14
  type      = string
}

variable "dns_domain_name" {
  type = string
}

variable "pterodactyl_panel_url" {
  type     = string
  nullable = false
}

variable "pterodactyl_panel_api_key" {
  type     = string
  nullable = false
}

variable "letsencrypt_email" {
  type     = string
  nullable = false
}
