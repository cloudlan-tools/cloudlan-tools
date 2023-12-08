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

variable "pterodactyl_locations" {
  type = map(
    /** Pterodactyl locations to be created */
    object({
      /** Short name of the location */
      short = string
      /** Long name of the location */
      long = string
      /** Datacenter of the location */
      datacenter = string
    })
  )
  nullable    = false
  description = "Map of Pterodactyl locations to be created. Key is the name of the location. Value is an object with the following keys: short, long."
}

variable "servers" {
  type = map(
    /** Type of node - Key is the name and dns subdomain of the node */
    object({
      // Required values
      /** Type of node */
      type = string
      /** pterodactyl_locations key for location */
      location = string
      /** Memory in MB for the node */
      memory = number
      /** Disk size in MB for the node */
      disk = number

      // Optional values
      /** DNS subdomain */
      dns_subdomain = optional(string)
      /** Username for the node */
      username = optional(string)
      /** Whether IPv4 is enabled for the node */
      ipv4_enabled = optional(bool)
      /** Whether IPv6 is enabled for the node */
      ipv6_enabled = optional(bool)
      /** Pterodactyl Wings upload size */
      pterodactyl_wings_upload_size = optional(number)
      /** Pterodactyl Wings daemon sftp port */
      pterodactyl_wings_daemon_sftp = optional(string)
      /** Pterodactyl Wings daemon listen port */
      pterodactyl_wings_daemon_listen = optional(string)
      /** Pterodactyl Wings location id - Would normally not be set */
      pterodactyl_wings_location_id = optional(number)
  }))
  nullable    = false
  description = "Map of servers to create. Key is the name and dns subdomain of the node. Value is an object with the following keys: type, location, memory, disk."
}
