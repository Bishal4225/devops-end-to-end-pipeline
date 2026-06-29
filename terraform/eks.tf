resource "aws_eks_cluster" "eks" {

  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn

  version = "1.35"

  vpc_config {

    subnet_ids = module.vpc.private_subnets

    endpoint_private_access = true

    endpoint_public_access = true

  }

  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]

  tags = {
    Name        = var.cluster_name
    Environment = var.environment
  }
}