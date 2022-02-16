#variables are used as parameters to input values at run time to customize our deployments.

variable "region" {
  default     = "us-east-1"
  description = "AWS region"
}

variable "aws_azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}   

variable "vpc_ipv4_address_range" {
  default     = "10.0.0.0/16"
  description = "VPC IPV4 adrdess range"
}

variable "vpc_name" {
  default     = "eks-vpc"
  description = "Name for VPC"
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
}

variable "eks_cluster_name" {
  type    = string
  default = "K6SY-EKS-Cluster"
}

variable "eks_cluster_version" {
  type    = string
  default = "1.21"
}

variable "eks_cluster_iam_role_name" {
  type    = string
  default = "k6sy-eks-role"
}

variable "eks_cluster_security_group_name" {
  type    = string
  default = "k6sy-eks-sg"
}

variable "eks_cluster_ami_type" {
  type    = string
  default = "AL2_x86_64"
}

variable "eks_cluster_disk_size" {
  type    = number
  default = 50
}

variable "eks_cluster_instances_type" {
  type    = list(string)
  default = ["t2.micro"]
}


variable "eks_cluster_node_green_min_size" {
  type    = number
  default = 1
}
variable "eks_cluster_node_green_max_size" {
  type    = number
  default = 1
}
variable "eks_cluster_node_green_desired_size" {
  type    = number
  default = 1
}


variable "eks_cluster_node_blue_min_size" {
  type    = number
  default = 1
}
variable "eks_cluster_node_blue_max_size" {
  type    = number
  default = 1
}
variable "eks_cluster_node_blue_desired_size" {
  type    = number
  default = 1
}

variable "eks_cluster_blue_instances_type" {
  type    = list(string)
  default = ["t2.micro"]
}

variable "eks_cluster_green_instances_type" {
  type    = list(string)
  default = ["t2.micro"]
}

variable "eks_cluster_blue_capacity_type" {
  type    = string
  default = "ON_DEMAND"
}

variable "eks_cluster_green_capacity_type" {
  type    = string
  default = "ON_DEMAND"
}



