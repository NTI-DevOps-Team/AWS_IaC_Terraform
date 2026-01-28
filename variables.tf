variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string

}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

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
