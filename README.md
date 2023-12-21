# Terraform for Pterodactyl wings

## Requirements

* Terraform 1.6.2+
* A Hetzner Cloud account with an API token [Guide](https://docs.hetzner.com/cloud/api/getting-started/generating-api-token/)
* A Domain name hosted at cloudflare with an API token [Guide](https://developers.cloudflare.com/fundamentals/api/get-started/create-token/)
  * Use the template for "DNS:Edit" when defining the privileges for the token.

## Start

*Create a file named `tfvars/data.tfvars` which should be a filled out copy of `tfvars/template.tfvars`.*  
*Read more about the variables in the [Configuration](#configuration) section.*

```bash
terraform init
terraform plan -var-file tfvars/data.tfvars
terraform apply -var-file tfvars/data.tfvars
terraform destroy -var-file tfvars/data.tfvars
```

## Configuration

To run the application, a `tfvars/data.tfvars` file is required.  
A template for this file can be found in `tfvars/template.tfvars`, which include all the variables that can be set, with reasonable defaults already set.

### Variables

| Variable                    | Description                 | Notes                                                                                                                                               |
| --------------------------- | --------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `hcloud_token`              | The Hetzner Cloud API token | This is obtained from the Hetzner Cloud console, on a per-project basis.                                                                            |
| `cloudflare_api_token`      | The Cloudflare API token    | Use the template for "DNS:Edit" when defining the privileges for the token.                                                                         |
| `Cloudflare_dns`            | The Cloudflare DNS zone     | The domain name that is hosted on Cloudflare.                                                                                                       |
| `pterodactyl_panel_url`     | The Pterodactyl panel URL   | The URL to the Pterodactyl panel.                                                                                                                   |
| `pterodactyl_panel_api_key` | The Pterodactyl API key     | The API key for the Pterodactyl panel. Needs to be an Application API key.                                                                          |
| `letsencrypt_email`         | The LetsEncrypt email       | The email used for SSL certificates on each node.                                                                                                   |
| `pterodactyl_locations`     | The Pterodactyl locations   | The locations to create nodes in. This is a map of locations, with their key being used in the creation of nodes. See template for more information |
| `nodes`                     | The nodes to create         | The nodes to create. This is a map of nodes, with their key being used in the creation of nodes. See template for more information                  |

<!-- The following information is outdated because the node is now created in arrays instead of a single node. 
## Extra information
-->

<!-- ### Log in

```bash
terraform output -raw ssh_private_key > node.key && sudo chmod 700 node.key
ssh -i node.key $(terraform output -raw node_username)@$(terraform output -raw ip_address)
```

To remove a known host do:

```bash
ssh-keygen -R "<IP address>"
``` -->

## Disclaimers

### Pterodactyl API key

The Pterodactyl API key, is sent of to the Hetzner node, through cloud-init.  
This is not an optimal secure way of doing it, but it is the only way I have found to do it. 

We therefore *recommend* that you re-create the API key after the use of this terraform script.
