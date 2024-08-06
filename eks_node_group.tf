resource "aws_eks_node_group" "prod_nodes" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "prod-nodes"
  node_role_arn   = aws_iam_role.eks_node_role_prod.arn
  subnet_ids      = aws_subnet.eks_subnet[*].id

  scaling_config {
    desired_size = var.prod_desired_size
    min_size     = var.prod_min_size
    max_size     = var.prod_max_size
  }

  instance_types = [var.prod_instance_type]
  

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cni_policy_prod,
    aws_iam_role_policy_attachment.ec2_container_registry_readonly_prod,
    aws_iam_role_policy_attachment.eks_worker_node_policy_prod,
  ]
  
}

resource "aws_eks_node_group" "dev_nodes" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "dev-nodes"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = aws_subnet.eks_subnet[*].id

  scaling_config {
    desired_size = var.dev_desired_size
    min_size     = var.dev_min_size
    max_size     = var.dev_max_size
  }

  instance_types = [var.dev_instance_type]

  

  capacity_type = "SPOT"

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.ec2_container_registry_readonly,
    aws_iam_role_policy_attachment.eks_worker_node_policy,
  ]
  
}
