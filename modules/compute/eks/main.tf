# Create EKS Cluster with EKS auto mode
resource "aws_eks_cluster" "my_cluster" {
  name = var.cluster_name

  access_config {
    authentication_mode = "API"
  }

  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = "1.31"

  bootstrap_self_managed_addons = false

  compute_config {
    enabled       = true
    node_pools    = ["general-purpose"]
    node_role_arn = aws_iam_role.node.arn
  }

  kubernetes_network_config {
    elastic_load_balancing {
      enabled = true
    }
  }

  storage_config {
    block_storage {
      enabled = true
    }
  }

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = true

    subnet_ids = var.subnet_ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSServicePolicy,
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSComputePolicy,
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSBlockStoragePolicy,
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSLoadBalancingPolicy,
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSNetworkingPolicy
  ]

}


#create EKS Node Group
resource "aws_eks_node_group" "my_node_group" {
  cluster_name    = aws_eks_cluster.my_cluster.name
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_capacity
    max_size     = var.max_size
    min_size     = var.min_size
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

  depends_on = [
    aws_eks_cluster.my_cluster,
    aws_iam_role_policy_attachment.node_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.node_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.node_AmazonEC2ContainerRegistryReadOnly
  ]
}

