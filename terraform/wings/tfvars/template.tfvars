# ----------------------
# Hetzner variables
# ----------------------
hcloud_token = "<token>" # Hetzner Cloud API Token for provisioning the Wings nodes

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
# Node specifications
# ----------------------

# Pterodactyl Locations
# A map of locations to create nodes in.
# The key is used in the nodes map to specify the location of the node.
pterodactyl_locations = {
  # Default location. If you want just one location, you can just change the needed values here. This includes what datacenter to use.
  "default" = {                         # Key provides the name of the location
    short      = "CloudLAN",            # The short name of the location
    long       = "Auto-deployed nodes", # The long name of the location
    datacenter = "hel1",                # The Hetzner Cloud datacenter to create the node in
  },
  # Additional locations. If you want to add more locations, for example, one for each datacenter. Included is a number of Hetzner Cloud datacenters.
  # Europe
  # "hel1" = {                           # Key provides the name of the location
  #   short      = "Helsinki",           # The short name of the location
  #   long       = "CloudLAN - Finland", # The long name of the location
  #   datacenter = "hel1",               # The Hetzner Cloud datacenter to create the node in
  # },
  # "fsn1" = {                           # Key provides the name of the location
  #   short      = "Falkenstein ",       # The short name of the location
  #   long       = "CloudLAN - Germany", # The long name of the location
  #   datacenter = "fsn1",               # The Hetzner Cloud datacenter to create the node in
  # },
  # "nbg1" = {                           # Key provides the name of the location
  #   short      = "Nuremberg",          # The short name of the location
  #   long       = "CloudLAN - Germany", # The long name of the location
  #   datacenter = "nbg1",               # The Hetzner Cloud datacenter to create the node in
  # },
  # US - East
  # "ash" = {                            # Key provides the name of the location
  #   short      = "Ashburn",            # The short name of the location
  #   long       = "CloudLAN - US East", # The long name of the location
  #   datacenter = "ash",                # The Hetzner Cloud datacenter to create the node in
  # },
  # US - West
  # "hil" = {                            # Key provides the name of the location
  #   short      = "Hillsboro",          # The short name of the location
  #   long       = "CloudLAN - US West", # The long name of the location
  #   datacenter = "hil",                # The Hetzner Cloud datacenter to create the node in
  # },
}

# Nodes
# A map of nodes to create and be registered as Pterodactyl nodes.
# If the node specification is left empty, please ensure to have a "default" location in the pterodactyl_locations map or have another default location key set in `default_node_location`
nodes = {
  # Minimum configuration
  "node-1" = {}, # Standard node, with the key of the node being used as the subdomain

  # Minimal configuration for changing node type
  # "node-2" = {            # Key provides the name and subdomain of the node
  #   location = "default", # The location to create the node in - Should be a key of pterodactyl_locations
  #   type     = "ccx23",   # The node type to use
  #   memory   = 15000,     # The amount of memory to allocate to the pterodactyl system in MB
  #   disk     = 35000,     # The amount of disk space to allocate to the pterodactyl system in MB
  # }

  # Full configuration
  # "node-3" = {                                                  # Key provides the name and subdomain of the node
  #   location                        = "default",                # The location to create the node in - Should be a key of pterodactyl_locations
  #   type                            = "ccx23",                  # The node type to use
  #   memory                          = 15000,                    # The amount of memory to allocate to the pterodactyl system in MB
  #   disk                            = 35000,                    # The amount of disk space to allocate to the pterodactyl system in MB
  #   dns_subdomain                   = "custom",                 # The subdomain to use for the node - If not provided, the key of the node will be used
  #   username                        = "admin",                  # The username to use for the node
  #   ipv4_enabled                    = true,                     # Enable IPv4 for the node
  #   ipv6_enabled                    = false,                    # Enable IPv6 for the node
  #   pterodactyl_ports_allocation    = ["25565", "25570-25580"], # The ports to allocate to the pterodactyl system
  #   pterodactyl_wings_upload_size   = 100,                      # The maximum upload size in MB
  #   pterodactyl_wings_daemon_sftp   = 2022,                     # The port to listen on for the SFTP node
  #   pterodactyl_wings_daemon_listen = 8080,                     # The port to listen on for the Wings node
  #   # pterodactyl_wings_location_id   = 1,                      # The location ID of the Wings node - Can be used, if you want to use a pre-defined location in Pterodactyl
  # }
}

# Default node specifications
# default_node_location                = "default"                   # The location to create nodes in that do not have a location specified
# default_node_type                    = "ccx13"                     # The node type to use for nodes that do not have a type specified
# default_node_memory                  = 7000                        # The amount of memory to allocate to the pterodactyl system in MB for nodes that do not have a memory specified
# default_node_disk                    = 70000                       # The amount of disk space to allocate to the pterodactyl system in MB for nodes that do not have a disk specified
# default_pterodactyl_ports_allocation = ["25565", "27015", "27030"] # The default ports to allocate to the pterodactyl system for nodes that do not have a ports allocation specified
