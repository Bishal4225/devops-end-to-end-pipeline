output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.vpc.public_subnets
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = module.vpc.private_subnets
}


output "ecr_repository_url" {
  description = "The URL of the ECR repository"
  value       = aws_ecr_repository.ecr_repo.repository_url
}

output "eks_cluster_role_arn" {
  description = "The name of the EKS cluster"
  value       = aws_iam_role.eks_cluster_role.arn
}

output "eks_node_role_arn" {
  description = "The ARN of the EKS node role"
  value       = aws_iam_role.eks_node_role.arn
}

output "cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "node_group_name" {
  value = aws_eks_node_group.main.node_group_name
}