module "network" {
  source   = "./modules/network"
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  subnets  = var.subnets
  sg       = var.sg
}

# Create SSH Key Pair
resource "aws_key_pair" "ssh_key" {
  key_name   = var.ec2_ssh_key
  public_key = file("~/.ssh/id_rsa.pub")
}

module "compute_eks" {
  source                   = "./modules/compute/eks"
  cluster_name             = var.cluster_name
  subnet_ids               = module.network.private_subnet_ids
  eks_cluster_depends_on   = var.eks_cluster_depends_on
  desired_capacity         = var.desired_capacity
  max_size                 = var.max_size
  min_size                 = var.min_size
  max_unavailable          = var.max_unavailable
  instance_type            = var.instance_type
  ami_type                 = var.ami_type
  disk_size                = var.disk_size
  capacity_type            = var.capacity_type
  ec2_ssh_key              = aws_key_pair.ssh_key.key_name
  eks_nodegroup_depends_on = var.eks_nodegroup_depends_on

}

