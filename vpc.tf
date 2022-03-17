module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.12.0"
  name                 = var.vpc_name
  cidr                 = var.vpc_ipv4_address_range
  azs                  = var.aws_azs
  private_subnets      = var.private_subnets
  public_subnets       = var.public_subnets

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tag = {
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tag = {
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}
