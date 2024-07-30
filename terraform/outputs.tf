output "test_policy_arn" {
  value = aws_iam_role.test_oidc.arn
}

output "eks_cluster_autoscaler_arn" {
  value = aws_iam_role.eks_cluster_autoscaler.arn
}

output "db_host" {
  value       = aws_rds_cluster.aurora_cluster.endpoint
  description = "The endpoint of the Aurora PostgreSQL database cluster"
}
