# Variable definitions for AWS VPC, Subnets and EKS configuration
#provider variables
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

#VPC variables
variable "vpc_name" {
  description = "The name of the VPC"
  type        = string

}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

#Subnet variables
variable "subnets" {
  description = "A map of subnets to create with their CIDR blocks and availability zones"
  type = map(object({
    subnet_name     = string
    cidr            = string
    az_name         = string
    public_ip       = bool
    enable_eks_tags = bool
  }))
}

#EKS cluster variables
variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}


#Node group variables
variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
}
variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
}
variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
}
variable "max_unavailable" {
  description = "Maximum number of nodes that can be unavailable during an update"
  type        = number
}
variable "instance_type" {
  description = "EC2 instance type for the worker nodes"
  type        = string
}
variable "ami_type" {
  description = "The AMI type for the EKS worker nodes"
  type        = string
}
variable "disk_size" {
  description = "The disk size (in GiB) for the worker nodes"
  type        = number
}
variable "capacity_type" {
  description = "The capacity type for the worker nodes (ON_DEMAND or SPOT)"
  type        = string
}
variable "ec2_ssh_key" {
  description = "The EC2 SSH key pair name for accessing the worker nodes"
  type        = string
}
