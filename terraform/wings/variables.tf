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

variable "servers" {
  type = map(
    /** Type of node - Key is the name and dns subdomain of the node */
    object({
      /** Type of node */
      type = string
      /** Location of node */
      location = string
      /** Memory in MB for the node */
      memory = number
      /** Disk size in MB for the node */
      disk = number
  }))
  nullable    = false
  description = "Map of servers to create. Key is the name and dns subdomain of the node. Value is an object with the following keys: type, location, memory, disk."
}
