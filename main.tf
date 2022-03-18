module "terraform_state_backend" {
    source = "cloudposse/tfstate-backend/aws"
    # Cloud Posse recommends pinning every module to a specific version
    version = "0.38.0"
    namespace  = "k6sy"
    stage      = "test"
    name       = "terraform"
    attributes = ["state"]

    terraform_backend_config_file_path = "."
    terraform_backend_config_file_name = "backend.tf"
    force_destroy                      = false
}
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "18.6.0"

  cluster_name    = var.eks_cluster_name
  cluster_version = var.eks_cluster_version
  subnet_ids = module.vpc.private_subnets

  vpc_id = module.vpc.vpc_id

  iam_role_name = var.eks_cluster_iam_role_name
  create_iam_role = true

  cluster_security_group_name = var.eks_cluster_security_group_name
  create_cluster_security_group = true
  
  eks_managed_node_group_defaults = {
    ami_type               = var.eks_cluster_ami_type
    disk_size              = var.eks_cluster_disk_size
    instance_types         = var.eks_cluster_instances_type
  }

  eks_managed_node_groups = {
    blue = {
      min_size     = var.eks_cluster_node_blue_min_size
      max_size     = var.eks_cluster_node_blue_max_size
      desired_size = var.eks_cluster_node_blue_desired_size
      instance_types = var.eks_cluster_blue_instances_type
      capacity_type  = var.eks_cluster_blue_capacity_type
      labels = {
        Environment = "test"
      }
      tags = {
        ExtraTag = "blue"
      }
    }
    green = {
      min_size     = var.eks_cluster_node_green_min_size
      max_size     = var.eks_cluster_node_green_max_size
      desired_size = var.eks_cluster_node_green_desired_size
      instance_types = var.eks_cluster_green_instances_type
      capacity_type  = var.eks_cluster_green_capacity_type
      labels = {
        Environment = "prod"
      }
      tags = {
        ExtraTag = "green"
      }
    }
  }
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
