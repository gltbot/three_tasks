module "vpc" {
  name   = "simple-vpc"
  source = "terraform-aws-modules/vpc/aws"

  cidr = var.vpc_cidr

  azs = [
    "${data.aws_availability_zones.available.names[0]}",
    "${data.aws_availability_zones.available.names[1]}",
  ]

  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  tags            = var.tags
}

