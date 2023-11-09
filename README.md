# Terraform for Pterodactyl wings

## Requirements

* Terraform 1.6.2+
* A Hetzner Cloud account with an API token [Guide](https://docs.hetzner.com/cloud/api/getting-started/generating-api-token/)
* A Domain name hosted at cloudflare with an API token [Guide](https://developers.cloudflare.com/fundamentals/api/get-started/create-token/)
  * Use the template for "DNS:Edit" when defining the privileges for the token.

## Start

*Create a file named `tfvars/data.tfvars` which should be a filled out copy of `tfvars/template.tfvars`*

```bash
terraform init
terraform plan -var-file tfvars/data.tfvars
terraform apply -var-file tfvars/data.tfvars
terraform destroy -var-file tfvars/data.tfvars
```

## Log in

```bash
terraform output -raw ssh_private_key > server.key && sudo chmod 700 server.key
export IP=$(terraform output -raw ip_address)
ssh -i server.key cloudlan@$IP
```
```bash	
ssh -i server.key <username>@<IP address>
```
*Username is by default `cloudlan`*

To remove a known host do:

```bash
ssh-keygen -R "<IP address>"
```
