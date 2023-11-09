# Terraform for Pterodactyl wings

## Requirements

* Terraform 1.6.2+
* A Hetzner Cloud account with an API token [Guide](https://docs.hetzner.com/cloud/api/getting-started/generating-api-token/)
* A Domain name hosted at cloud flare with an API token [Guide](https://developers.cloudflare.com/fundamentals/api/get-started/create-token/)
  * Use the template for DNS:Edit when defining the privileges for the token.

## Start

*Create a file named `tfvars/data.tfvars` which should be a filled out copy of `tfvars/template.tfvars`*

```bash
terraform init
terraform apply -var-file tfvars/data.tfvars
```
