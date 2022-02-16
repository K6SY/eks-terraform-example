#
# Global AWS Infrastructure
#

region = "us-east-1"
aws_azs = ["us-east-1a","us-east-1b","us-east-1c"]

#
# Virtual Private Cloud
#
vpc_name = "eks-vpc"
vpc_ipv4_address_range = "10.0.0.0/16"
private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]

#
# EKS CLUSTER
#
eks_cluster_name = "k6sy-eks-cluster"
eks_cluster_version = "1.21"
eks_cluster_iam_role_name = "k6sy-eks-role"
eks_cluster_security_group_name = "k6sy-eks-sg"
eks_cluster_ami_type = "AL2_x86_64"
eks_cluster_disk_size = 50
eks_cluster_instances_type = ["t2.micro"]

#
# GREEN Deployment
#

eks_cluster_node_green_min_size = 1
eks_cluster_node_green_max_size = 4
eks_cluster_node_green_desired_size = 2
eks_cluster_green_instances_type = ["t2.micro"]
eks_cluster_green_capacity_type = "ON_DEMAND"


#
# Blue Deployment
#

eks_cluster_node_blue_min_size = 1
eks_cluster_node_blue_max_size = 4
eks_cluster_node_blue_desired_size = 2
eks_cluster_blue_instances_type = ["t2.micro"]
eks_cluster_blue_capacity_type = "ON_DEMAND"



