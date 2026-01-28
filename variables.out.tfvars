region   = "us-east-1"
vpc_name = "my-vpc"
vpc_cidr = "10.0.0.0/16"
subnets = {
  public_subnet_1 = {
    subnet_name     = "public-subnet-1"
    cidr            = "10.0.1.0/24"
    az_name         = "us-east-1a"
    public_ip       = true
    enable_eks_tags = true
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
    enable_eks_tags = false
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
    enable_eks_tags = false
  }
}
