output "eks" {
  description = "EKS cluster information"
  value = {
    cluster_name                       = aws_eks_cluster.my_eks_cluster.name
    cluster_endpoint                   = aws_eks_cluster.my_eks_cluster.endpoint
    cluster_certificate_authority_data = aws_eks_cluster.my_eks_cluster.certificate_authority[0].data
    cluster_arn                        = aws_eks_cluster.my_eks_cluster.arn
  }

}

output "eks_nodes" {
  description = "EKS Node Group information"
  value = {
    node_group_name = aws_eks_node_group.my_node_group.node_group_name
    node_group_arn  = aws_eks_node_group.my_node_group.arn
    scaling_config  = aws_eks_node_group.my_node_group.scaling_config
  }

}
