variable "hcloud_token" {
  sensitive = true # Requires terraform >= 0.14
  type = string
}

variable "cloudflare_api_token" {
  sensitive = true # Requires terraform >= 0.14
  type = string
}

variable "dns_domain_name" {
  type = string  
}