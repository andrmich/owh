

data "aws_availability_zones" "this" {
}

locals {
  azs = slice(data.aws_availability_zones.this.names, 0, var.vpc_az_count)
  _public_networks = [for az in local.azs : {
    name     = "public-${az}"
    new_bits = 7
  }]
  _private_networks = [for az in local.azs : {
    name     = "private-${az}"
    new_bits = 5
  }]
  _networks = flatten([local._public_networks, local._private_networks, ])
}

module "subnet_addrs" {
  source = "hashicorp/subnets/cidr"

  base_cidr_block = var.vpc_cidr
  networks        = local._networks
}

locals {
  public_subnets = [for k, v in module.subnet_addrs.networks :
    v.cidr_block
    if substr(v.name, 0, 3) == "pub"
  ]
  private_subnets = [for k, v in module.subnet_addrs.networks :
    v.cidr_block
    if substr(v.name, 0, 3) == "pri"
  ]
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 2.77.0"

  name            = var.tags.Topic
  cidr            = var.vpc_cidr
  azs             = local.azs
  public_subnets  = local.public_subnets
  private_subnets = local.private_subnets

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  enable_vpn_gateway = false


  tags = var.tags
}
