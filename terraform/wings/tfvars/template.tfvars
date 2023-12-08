# ----------------------
# Hetzner variables
# ----------------------
hcloud_token = "<token>" # Hetzner Cloud API Token for provisioning the Wings servers

# ----------------------
# Cloudflare variables
# ----------------------
cloudflare_api_token = "<token>"  # Cloudflare API Token for updating the DNS records
Cloudflare_dns       = "<domain>" # The domain name to use for the DNS records

# ----------------------
# Pterodactyl API variables
# ----------------------
pterodactyl_panel_url     = "<pterodactyl domain>" # The URL of the Pterodactyl Panel
pterodactyl_panel_api_key = "<pterodactyl token>"  # The API Key of the Pterodactyl Panel

# ----------------------
# Let's Encrypt variables
# ----------------------
letsencrypt_email = "<email>" # The email address used for Let's Encrypt

# ----------------------
# Server specifications
# ----------------------

# Pterodactyl Locations
# A map of locations to create servers in.
# The key is used in the servers map to specify the location of the server.
pterodactyl_locations = {
  # Default location. If you want just one location, you can just change the needed values here. This includes what datacenter to use.
  "default" = {                           # Key provides the name of the location
    short      = "CloudLAN",              # The short name of the location
    long       = "Auto-deployed servers", # The long name of the location
    datacenter = "hel1",                  # The Hetzner Cloud datacenter to create the server in
  },
  # Additional locations. If you want to add more locations, for example, one for each datacenter. Included is a number of Hetzner Cloud datacenters.
  # Europe
  # "hel1" = {                           # Key provides the name of the location
  #   short      = "Helsinki",           # The short name of the location
  #   long       = "CloudLAN - Finland", # The long name of the location
  #   datacenter = "hel1",               # The Hetzner Cloud datacenter to create the server in
  # },
  # "fsn1" = {                           # Key provides the name of the location
  #   short      = "Falkenstein ",       # The short name of the location
  #   long       = "CloudLAN - Germany", # The long name of the location
  #   datacenter = "fsn1",               # The Hetzner Cloud datacenter to create the server in
  # },
  # "nbg1" = {                           # Key provides the name of the location
  #   short      = "Nuremberg",          # The short name of the location
  #   long       = "CloudLAN - Germany", # The long name of the location
  #   datacenter = "nbg1",               # The Hetzner Cloud datacenter to create the server in
  # },
  # US - East
  # "ash" = {                            # Key provides the name of the location
  #   short      = "Ashburn",            # The short name of the location
  #   long       = "CloudLAN - US East", # The long name of the location
  #   datacenter = "ash",                # The Hetzner Cloud datacenter to create the server in
  # },
  # US - West
  # "hil" = {                            # Key provides the name of the location
  #   short      = "Hillsboro",          # The short name of the location
  #   long       = "CloudLAN - US West", # The long name of the location
  #   datacenter = "hil",                # The Hetzner Cloud datacenter to create the server in
  # },
}

# Nodes
# A map of nodes to create and be registered as Pterodactyl nodes.
# If the server specification is left empty, please ensure to have a "default" location in the pterodactyl_locations map or have another default location key set in `default_server_location`
servers = {
  # Minimum configuration
  "server-1" = {}, # Standard server, with the key of the server being used as the subdomain

  # Minimal configuration for changing server type
  # "server-2" = {          # Key provides the name and subdomain of the server
  #   location = "default", # The location to create the server in - Should be a key of pterodactyl_locations
  #   type     = "ccx23",   # The server type to use
  #   memory   = 15000,     # The amount of memory to allocate to the pterodactyl system in MB
  #   disk     = 35000,     # The amount of disk space to allocate to the pterodactyl system in MB
  # }

  # Full configuration
  # "server-3" = {                                 # Key provides the name and subdomain of the server
  #   location                        = "default", # The location to create the server in - Should be a key of pterodactyl_locations
  #   type                            = "ccx23",   # The server type to use
  #   memory                          = 15000,     # The amount of memory to allocate to the pterodactyl system in MB
  #   disk                            = 35000,     # The amount of disk space to allocate to the pterodactyl system in MB
  #   dns_subdomain                   = "custom",  # The subdomain to use for the server - If not provided, the key of the server will be used
  #   username                        = "admin",   # The username to use for the server
  #   ipv4_enabled                    = true,      # Enable IPv4 for the server
  #   ipv6_enabled                    = false,     # Enable IPv6 for the server
  #   pterodactyl_wings_upload_size   = 100,       # The maximum upload size in MB
  #   pterodactyl_wings_daemon_sftp   = 2022,      # The port to listen on for the SFTP server
  #   pterodactyl_wings_daemon_listen = 8080,      # The port to listen on for the Wings server
  #   # pterodactyl_wings_location_id = 1,         # The location ID of the Wings server - Can be used, if you want to use a pre-defined location in Pterodactyl
  # }
}

# Default server specifications
# default_server_location = "default" # The location to create servers in that do not have a location specified
# default_server_type     = "ccx13"   # The server type to use for servers that do not have a type specified
# default_server_memory   = 7000      # The amount of memory to allocate to the pterodactyl system in MB for servers that do not have a memory specified
# default_server_disk     = 70000     # The amount of disk space to allocate to the pterodactyl system in MB for servers that do not have a disk specified
