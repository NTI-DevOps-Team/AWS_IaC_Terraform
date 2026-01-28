# AWS VPC, Subnets and EKS configuration
#provider variables
region = "us-east-1"

#VPC variables
vpc_name = "my-vpc"
vpc_cidr = "10.0.0.0/16"

#Subnet variables
subnets = {
  public_subnet_1 = {
    subnet_name     = "public-subnet-1"
    cidr            = "10.0.1.0/24"
    az_name         = "us-east-1a"
    public_ip       = true
    enable_eks_tags = false
  }

  private_subnet_1 = {
    subnet_name     = "private-subnet-1"
    cidr            = "10.0.2.0/24"
    az_name         = "us-east-1a"
    public_ip       = false
    enable_eks_tags = true
  }

  public_subnet_2 = {
    subnet_name     = "public-subnet-2"
    cidr            = "10.0.3.0/24"
    az_name         = "us-east-1b"
    public_ip       = true
    enable_eks_tags = false
  }

  private_subnet_2 = {
    subnet_name     = "private-subnet-2"
    cidr            = "10.0.4.0/24"
    az_name         = "us-east-1b"
    public_ip       = false
    enable_eks_tags = true
  }

  public_subnet_3 = {
    subnet_name     = "public-subnet-3"
    cidr            = "10.0.5.0/24"
    az_name         = "us-east-1c"
    public_ip       = true
    enable_eks_tags = false
  }

  private_subnet_3 = {
    subnet_name     = "private-subnet-3"
    cidr            = "10.0.6.0/24"
    az_name         = "us-east-1c"
    public_ip       = false
    enable_eks_tags = true
  }
}

#EKS cluster variables
cluster_name = "my-eks-cluster"

#Node group variables

desired_capacity = 2
max_size         = 4
min_size         = 1
max_unavailable  = 1
instance_type    = "t3.micro"
ami_type         = "AL2_x86_64"
disk_size        = 20
capacity_type    = "ON_DEMAND"
ec2_ssh_key      = "my-eks-keypair"


