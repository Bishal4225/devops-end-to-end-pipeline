resource "aws_eks_node_group" "main" {

  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn   = aws_iam_role.eks_node_role.arn

  subnet_ids = module.vpc.private_subnets

  instance_types = [var.node_instance_type]

  capacity_type = "ON_DEMAND"

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_node_policy,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.ec2_pull_policy
  ]

  tags = {
    Name        = "${var.cluster_name}-node-group"
    Environment = var.environment
  }
}