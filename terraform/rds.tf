resource "aws_rds_cluster" "aurora_cluster" {
  engine         = "aurora-postgresql"
  engine_version = "13.7" # Убедитесь, что эта версия доступна в вашем регионе
  cluster_identifier = "aurora-cluster-demo"
  master_username    = local.db_credentials.username
  master_password    = local.db_credentials.password

  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"

  skip_final_snapshot = true
}

resource "aws_rds_cluster_instance" "aurora_instances" {
  count              = 2
  identifier         = "aurora-instance-${count.index}"
  cluster_identifier = aws_rds_cluster.aurora_cluster.id
  instance_class     = "db.r5.large"
  engine             = "aurora-postgresql"
}

resource "aws_db_subnet_group" "default" {
  name       = "aurora-subnet-group"
  subnet_ids = [
    aws_subnet.private-us-east-1a.id,
    aws_subnet.private-us-east-1b.id
  ]

  tags = {
    Name = "aurora-subnet-group"
  }
}

data "aws_secretsmanager_secret" "aurora_db_credentials" {
  name = "aurora-db-credentials2"
}

data "aws_secretsmanager_secret_version" "aurora_db_credentials" {
  secret_id = data.aws_secretsmanager_secret.aurora_db_credentials.id
}

locals {
  db_credentials = jsondecode(data.aws_secretsmanager_secret_version.aurora_db_credentials.secret_string)
}
