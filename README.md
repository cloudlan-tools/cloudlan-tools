<p align="center" width="100%" style="margin-bottom: 3rem">
  <img src="https://github.com/cloudlan-tools/.github/blob/main/assets/logo/cloudlan%20logo.png" style="max-width: 40rem;" alt="CloudLAN Tools logo" />
</p>

# Terraform/OpenTofu for Pterodactyl wings

This repository contains a [Terraform](https://www.terraform.io/)/[OpenTofu](https://opentofu.org/) module for creating a [Pterodactyl](https://pterodactyl.io/) wings node on [Hetzner Cloud](https://www.hetzner.com/cloud) using [OpenTofu](https://opentofu.org/).

The system is built, to require modifictaion in a single file, to spin up as many nodes as you want.

To get started, see the [Requirements](#requirements) section for required software and accounts.  
Then see the [Start](#start) section for how to run the script.

## Requirements

* [Terraform](https://www.terraform.io/)/[OpenTofu](https://opentofu.org/) 1.6.0+ | [Guide](https://opentofu.org/docs/intro/install/)
* A [Hetzner Cloud](https://www.hetzner.com/cloud) account with an API token | [Guide](https://docs.hetzner.com/cloud/api/getting-started/generating-api-token/)
* A Domain name hosted at [Cloudflare](https://cloudflare.com) with an API token | [Guide](https://developers.cloudflare.com/fundamentals/api/get-started/create-token/)
  * Use the template for "DNS:Edit" when defining the privileges for the token.
* A [PteroDactyl panel](https://pterodactyl.io/) with an API key | [Guide](https://dashflo.net/docs/api/pterodactyl/v1/)
  * The API key needs to be an Application API key.

## Start

*Clone the repository and enter the directory.*

```bash
git clone https://github.com/cloudlan-tools/cloudlan-tools
cd cloudlan-tools
```

The Pterodactyl wings node project is located in `terraform/pterodactyl-wings-node`.  
This is the directory you should be in, when running the commands. To enter, run:

```bash
cd terraform/pterodactyl-wings-node
```

From here, you need to set up the `tfvars/data.tfvars` file, following the [configuration](#configuration).  
[See below](#run-the-script) for how to run the script.

### Run the script

To set up the `tfvars/data.tfvars` file, you can either copy the `tfvars/template.tfvars` file manually or run the following command:

```bash
cp tfvars/template.tfvars tfvars/data.tfvars
```

Then you can edit the `tfvars/data.tfvars` file, to fit your needs.  
There is a lot of documentation already present in the file, but you can also read more about the variables in the [Configuration](#configuration) section.

To run the script, you can use the following commands:

```bash
# Initialize the project
tofu init

# Optional, get the plan before applying
tofu plan -var-file tfvars/data.tfvars 

# Apply and deploy infrastructure
tofu apply -var-file tfvars/data.tfvars

# Destroy infrastructure
tofu destroy -var-file tfvars/data.tfvars
```

*To use Terraform instead of OpenTofu, replace `tofu` with `terraform` in the commands above.*

## Configuration

To run the application, a `tfvars/data.tfvars` file is required.  
A template for this file can be found in `tfvars/template.tfvars`, which includes all the variables that can be set, with reasonable defaults already set.

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

## Disclaimers

### Pterodactyl API key

The Pterodactyl API key, is sent of to the Hetzner node, through cloud-init.  
This is not an optimal secure way of doing it, but it is the only way I have found to do it. 

We therefore *recommend* that you re-create the API key after the use of this tofu script.

### Warrenty and Liability

As mentioned in the [LICENSE](LICENSE), this project is provided "as is", without warranty of any kind.  
We can under no circumstances be held liable for any damages or costs associated with the use of this project.  
This includes, but not limited too, costs of hosting and/or running the nodes this software creates.

**Use at your own risk!**  
**Be aware, that launching nodes with Hetzner does cost money!**

## Contributing

We are always open for help and contributions!

To ensure a smooth process, please please read out [CONTRIBUTING.md](https://github.com/cloudlan-tools/.github/blob/main/CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.  
*This project is a part of the [CloudLan Tools](https://github.com/cloudlan-tools) project.*

## Authors  

The CloudLan Tools is a project by [CloudLan](https://github.com/cloudlan-tools).  

The project is currently developed and maintained by the following people:

* **[Mikkel Albrechtsen](https://github.com/the0mikkel)** - *Original author*
* **[William Bergmann Børresen](https://github.com/ninkaninus)** - *Original author*

## License

This project is licensed under GNU AFFERO GENERAL PUBLIC LICENSE - see the [LICENSE](LICENSE) file for details.
