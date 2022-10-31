module "vpc" {
  source = "../Terraform_Project/VPC"
  vpc_cidr=var.vpc_cidr
}

module "subnet" {
  source ="../Terraform_Project/VPC/subnets"
  cidr_block = var.subnet_cidr
  tags = var.subnet_tags
}

module "security_group" {
  source = "../Terraform_Project/SG"
  
}