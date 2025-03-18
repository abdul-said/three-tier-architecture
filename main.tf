module "vpc" {
  source = "../terraform-aws-vpc/terraform-aws-vpc"

  vpc_name                 = var.vpc_name
  public_subnet_1_cidr     = var.public_subnet_cidr_1
  public_subnet_2_cidr     = var.public_subnet_cidr_2
  private_subnet_1_cidr    = var.private_subnet_cidr_1
  private_subnet_2_cidr    = var.private_subnet_cidr_2
  private_db_subnet_1_cidr = var.private_db_subnet_cidr_1
  private_db_subnet_2_cidr = var.private_db_subnet_cidr_2
  cidr_block_vpc           = var.vpc_cidr_block
  default_cidr             = var.default_cidr_block
  internet_gateway_name    = var.internet_gateway_name
}

