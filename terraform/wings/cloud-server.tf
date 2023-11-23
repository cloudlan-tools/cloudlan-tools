module "wing-node" {
  source = "./tf-modules/wing-node"

  dns_domain_name = var.dns_domain_name
}