#cluster variables
variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

#node group variables
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
  description = "Maximum number of unavailable nodes during update"
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

