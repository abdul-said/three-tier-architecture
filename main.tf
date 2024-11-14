module "vpc" {
  source = "../terraform-aws-vpc/terraform-aws-vpc"

  vpc_name                 = "dev-vpc"
  public_subnet_1_cidr     = "10.0.1.0/24"
  public_subnet_2_cidr     = "10.0.2.0/24"
  private_subnet_1_cidr    = "10.0.10.0/24"
  private_subnet_2_cidr    = "10.0.11.0/24"
  private_db_subnet_1_cidr = "10.0.5.0/24"
  private_db_subnet_2_cidr = "10.0.6.0/24"
  cidr_block_vpc           = "10.0.0.0/16"
  default_cidr             = "0.0.0.0/0"
  internet_gateway_name    = "MyIG"
}

