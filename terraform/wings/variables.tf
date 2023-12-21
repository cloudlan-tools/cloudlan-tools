variable "hcloud_token" {
  sensitive = true # Requires terraform >= 0.14
  type      = string
}

variable "cloudflare_api_token" {
  sensitive = true # Requires terraform >= 0.14
  type      = string
}

variable "Cloudflare_dns" {
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

variable "nodes" {
  type = map(
    /** Type of node - Key is the name and dns subdomain of the node */
    object({
      /** pterodactyl_locations key for location */
      location = optional(string)
      /** Type of node */
      type = optional(string)
      /** Memory in MB for the node */
      memory = optional(number)
      /** Disk size in MB for the node */
      disk = optional(number)
      /** DNS subdomain */
      dns_subdomain = optional(string)
      /** Username for the node */
      username = optional(string)
      /** Whether IPv4 is enabled for the node */
      ipv4_enabled = optional(bool)
      /** Whether IPv6 is enabled for the node */
      ipv6_enabled = optional(bool)
      /** Pterodactyl ports allocation - Is set to default_pterodactyl_ports_allocation if not set */
      pterodactyl_ports_allocation = optional(list(string))
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
  description = "Map of nodes to create. Key is the name and dns subdomain of the node. Value is an object with the following keys: type, location, memory, disk."
}

variable "default_node_type" {
  type        = string
  description = "Default node type to use if not specified in nodes map"
  default     = "ccx13" # 2vCPU, 8GB RAM, 80GB SSD
}

variable "default_node_location" {
  type        = string
  description = "Default location to use if not specified in nodes map"
  default     = "default"
}

variable "default_node_memory" {
  type        = number
  description = "Default memory to use if not specified in nodes map"
  default     = 7000 # 7GB, allowing for 1GB for the OS
}

variable "default_node_disk" {
  type        = number
  description = "Default disk to use if not specified in nodes map"
  default     = 70000 # 70GB, allowing for 10GB for the OS
}

variable "default_pterodactyl_ports_allocation" {
  type        = list(string)
  description = "Default port allocation to use if not specified in nodes map"
  default = [
    "25565",
    "27015",
    "27030"
  ]
}


