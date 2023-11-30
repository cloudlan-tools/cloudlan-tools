hcloud_token         = "<token>"  # Hetzner Cloud API Token for provisioning the Wings servers
cloudflare_api_token = "<token>"  # Cloudflare API Token for updating the DNS records
Cloudflare_dns_zone  = "<domain>" # The domain name of the DNS zone

dns_domain_name = "cloudlan.tools" # The domain name to use for the DNS records

# The following variables are used to configure the Wings servers with the help of the Pterodactyl Panel API
pterodactyl_panel_url     = "<pterodactyl domain>" # The URL of the Pterodactyl Panel
pterodactyl_panel_api_key = "<pterodactyl token>"  # The API Key of the Pterodactyl Panel

letencrypt_email = "<email>" # The email address used for Let's Encrypt

servers = {             # Map of servers to create
  "server-1" = {        # Key provides the name and subdomain of the server
    type     = "ccx13", # The server type to use
    location = "hel1",  # The location to create the server in
    memory   = 7048,    # The amount of memory to allocate to the server in MB
    disk     = 70000,   # The amount of disk space to allocate to the server in MB
  },
  "server-2" = {        # Key provides the name and subdomain of the server
    type     = "ccx23", # The server type to use
    location = "hel1",  # The location to create the server in
    memory   = 15048,   # The amount of memory to allocate to the server in MB
    disk     = 35000,   # The amount of disk space to allocate to the server in MB
  }
}
