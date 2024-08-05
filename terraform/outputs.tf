# Outputs the ARN of the test OIDC IAM role
output "test_policy_arn" {
  value = aws_iam_role.test_oidc.arn
}

# Outputs the ARN of the EKS cluster autoscaler IAM role
output "eks_cluster_autoscaler_arn" {
  value = aws_iam_role.eks_cluster_autoscaler.arn
}

# Outputs the endpoint of the Aurora PostgreSQL database cluster
output "db_host" {
  value = aws_rds_cluster.aurora_cluster.endpoint
  description = "The endpoint of the Aurora PostgreSQL database cluster"
}