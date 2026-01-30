# Create EKS Cluster with EKS auto mode
resource "aws_eks_cluster" "my_eks_cluster" {
  name = var.cluster_name

  access_config {
    authentication_mode = "API"
  }

  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = "1.31"

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = false
    subnet_ids              = var.subnet_ids
  }

  tags = {
    Name = var.cluster_name
  }

  depends_on = var.eks_cluster_depends_on

}


#create EKS Node Group
resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_eks_cluster.name
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn   = aws_iam_role.node_role.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_capacity
    max_size     = var.max_size
    min_size     = var.min_size
  }

  update_config {
    max_unavailable = var.max_unavailable
  }

  instance_types = [var.instance_type]
  ami_type       = var.ami_type
  disk_size      = var.disk_size
  capacity_type  = var.capacity_type

  remote_access {
    ec2_ssh_key = var.ec2_ssh_key
  }

  tags = {
    Name = "${var.cluster_name}-eks-node"
  }

  depends_on = var.eks_nodegroup_depends_on
}



