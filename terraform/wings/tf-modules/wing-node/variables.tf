# -----------
# Required variables
# -----------

# Top level domain name
variable "Cloudflare_dns" {
  type        = string
  nullable    = false
  description = "Top level domain name for the project."
}

# Let's Encrypt email address
variable "letsencrypt_email" {
  type        = string
  nullable    = false
  description = "Email address to be used for Let's Encrypt certificate."
}

# Pterodatactyl Panel url
variable "pterodactyl_panel_url" {
  type        = string
  nullable    = false
  description = "URL of the Pterodactyl Panel."
}

# Pterodatactyl Panel API key
variable "pterodactyl_panel_api_key" {
  type        = string
  sensitive   = true
  nullable    = false
  description = "API key of the Pterodactyl Panel. Must be the application API key."
}

# Pterodactyl Wings location id
variable "pterodactyl_wings_location_id" {
  type        = number
  description = "Location ID of the node in Pterodactyl Panel."
  nullable    = false
}

# -----------
# Optional variables
# -----------

# Sub domain name for the node
variable "dns_a_record" {
  type        = string
  nullable    = false
  default     = "node"
  description = "Sub domain name for the node. Should be unique for this node."
}

# Name of Hetzner Cloud node
variable "node_name" {
  type        = string
  default     = "wing-demo"
  description = "Name of the Hetzner Cloud node. This name will be used in Hetzner Cloud and Pterodactyl Panel."
  nullable    = false
}

# Memory in MB for the node
variable "node_memory" {
  type        = number
  default     = 6144
  description = "Memory in MB for the node. This should be the same as the memory of the node choosen in `node_server_type`."
  nullable    = false
}

# Disk size in MB for the node
variable "node_disk" {
  type        = number
  default     = 50000
  description = "Disk size in MB for the node. This should fit the memory of the node choosen in `node_server_type`."
  nullable    = false
}

# Username for the user to be created on the node
variable "node_username" {
  type        = string
  default     = "cloudlan"
  description = "Username for the user to be created on the node. This user will be the available user for SSH at later points."
  nullable    = false
}

# Node location in Hetzner Cloud
variable "node_location" {
  type        = string
  default     = "hel1"
  description = "Node location in Hetzner Cloud. We recommend the closest location to your users. Some of the locations are: `nbg1`, `fsn1`, `hel1`, `ash`, `hil`"
  nullable    = false
}

# Node type in Hetzner Cloud
variable "node_server_type" {
  type        = string
  default     = "ccx13"
  description = "Node type in Hetzner Cloud. We recommend CCX type."
  nullable    = false
}

# Enable IPv4 on the node
variable "node_ipv4_enabled" {
  type        = bool
  default     = true
  description = "IPv4 is required for the node."
  nullable    = false
}

# Enable IPv6 on the node
variable "node_ipv6_enabled" {
  type        = bool
  default     = false
  description = "IPv6 is not supported by Pterodactyl Panel yet."
  nullable    = false
}

# Docker image to be used for the node
variable "node_image" {
  type    = string
  default = "docker-ce"

  validation {
    condition     = can(regex("docker-ce", var.node_image))
    error_message = "Only docker-ce is supported"
  }

  description = "Docker image to be used for the node. Only docker-ce is supported."
  nullable    = false
}

# SSH key algorithm
variable "ssh_key_algorithm" {
  type    = string
  default = "ED25519"

  validation {
    condition     = can(regex("ED25519", var.ssh_key_algorithm))
    error_message = "Ed25519 is recommended and should not be change unless you know what you are doing."
  }

  description = "SSH key algorithm to be used for the node. Default is ED25519, and any other value is not recommended."
  nullable    = false
}

# Pterodactyl Wings upload size
variable "pterodactyl_wings_upload_size" {
  type        = number
  default     = 100
  description = "Maximum upload size in MB from web panel."
  nullable    = false
}

# Pterodactyl Wings daemon SFTP port
variable "pterodactyl_wings_daemon_sftp" {
  type        = number
  default     = 2022
  description = "Port on which the daemon will listen for SFTP connections."
  nullable    = false
}

# Pterodactyl Wings daemon listen port
variable "pterodactyl_wings_daemon_listen" {
  type        = number
  default     = 8080
  description = "Port on which the daemon will listen for requests."
  nullable    = false
}

# Allocations of the node
# Allocation being a port on the node, that is being reserved to be used for the system
# This is required if a game server is to use the specified port
variable "pterodactyl_ports_allocation" {
  type = list(string)
  default = [
    "25565",
    "27015",
    "27030"
  ]

  nullable    = false
  description = "Allocations of the node. Allocation being a port on the node, that is being reserved to be used for the system. This is required if a game server is to use the specified port. Formatted as a list of ports, either as individual numbers, or as ranges (e.g. [25565, 25566, 25567-25569])."
}
