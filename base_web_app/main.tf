# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# find more information from 
# https://github.com/hashicorp/learn-terraform-modules-use

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway

  tags = var.vpc_tags
}


module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"
  count   = 3


  name = format("my-ec2-cluster-%s-%d", element(random_string.instance_name, count.index % 3), count.index)

  ami                    = var.instance_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "random_string" "instance_name" {
  count   = 3
  length  = 6
  upper   = false
  special = false
}