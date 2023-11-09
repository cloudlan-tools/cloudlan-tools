# Name of Hetzner Cloud node
variable "node_name" {
  type    = string
  default = "wing-demo"
}

# Username for the user to be created on the node
variable "node_username" {
  type    = string
  default = "cloudlan"
}

# Node location in Hetzner Cloud
variable "node_location" {
  type    = string
  default = "hel1"
}

# Node type in Hetzner Cloud
variable "node_server_type" {
  type    = string
  default = "ccx13"
}

variable "node_ipv4_enabled" {
  type    = bool
  default = true 
}

variable "node_ipv6_enabled" {
  type    = bool
  default = false 
}

variable "node_image" {
  type    = string
  default = "docker-ce"
  validation {
    condition = can(regex("docker-ce", var.node_image))
    error_message = "Only docker-ce is supported"
  }
}

variable "ssh_key_algorithm" {
    type    = string
    default = "RSA"
    validation {
        condition = can(regex("RSA", var.ssh_key_algorithm))
        error_message = "Only RSA is supported"
    }
}

variable "ssh_key_rsa_bits" {
    type    = number
    default = 4096
    validation {
        condition = can(regex("4096", var.ssh_key_rsa_bits))
        error_message = "4096 is recomended"
    }  
}