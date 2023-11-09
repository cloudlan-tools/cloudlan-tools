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
