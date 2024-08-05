# Creates a security group for the Aurora RDS cluster with ingress and egress rules
resource "aws_security_group" "db_sg" {
  name_prefix = "aurora-sg"

  vpc_id = aws_vpc.main.id

  # Ingress rule allowing TCP traffic on port 5432 from within the VPC
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # Разрешить доступ с VPC
  }

  # Egress rule allowing all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "aurora-security-group"
  }
}
