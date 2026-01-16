# Infrastructure Layer - Foundation resources for the application
# This layer creates: Subnet, Security Group

# Local values for consistent naming
locals {
  name_prefix = "lab5-${var.project}-${var.environment}"
}

# Get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Security Group for web servers
resource "aws_security_group" "web_sg" {
  name        = "${local.name_prefix}-web-sg"
  description = "Security group for web servers"
  vpc_id      = data.aws_vpc.default.id

  tags = {
    Name = "${local.name_prefix}-web-sg"
    LastUpdated = "Step16-Demo"
  
  }
}

# Security group rule - HTTP ingress (standalone resource - best practice)
resource "aws_vpc_security_group_ingress_rule" "web_http" {
  security_group_id = aws_security_group.web_sg.id
  description       = "HTTP from anywhere"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"

  tags = {
    Name = "${local.name_prefix}-web-http"
  }
}

# Security group rule - egress (standalone resource - best practice)
resource "aws_vpc_security_group_egress_rule" "web_all" {
  security_group_id = aws_security_group.web_sg.id
  description       = "Allow all outbound"
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"

  tags = {
    Name = "${local.name_prefix}-web-egress"
  }
}

resource "aws_security_group" "db_sg" {
  name        = "${local.name_prefix}-extra-db-sg"
  description = "Security group for db servers"
  vpc_id      = data.aws_vpc.default.id

  tags = {
    Name        = "${local.name_prefix}-db-sg"
    LastUpdated = "Step16-Demo"
  }
}