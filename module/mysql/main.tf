terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region                      = var.region
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true

  endpoints {
    ec2 = "http://localhost:4566"
    rds = "http://localhost:4566"
  }
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "mysql-rds-vpc"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "mysql-rds-private-1"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "${var.region}b"

  tags = {
    Name = "mysql-rds-private-2"
  }
}

resource "aws_security_group" "mysql" {
  name        = var.mysql_rds_security_group
  description = "Security group for MySQL RDS"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.mysql_rds_security_group
  }
}

resource "aws_db_subnet_group" "mysql" {
  name = var.subnet_group_name

  subnet_ids = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]

  tags = {
    Name = var.subnet_group_name
  }
}

resource "aws_db_parameter_group" "mysql" {
  name   = var.parameter_group_name
  family = "mysql8.0"

  parameter {
    name         = "max_connections"
    value        = "100"
    apply_method = "immediate"
  }

  tags = {
    Name = var.parameter_group_name
  }
}

resource "aws_db_instance" "mysql" {
  identifier = var.db_identifier

  engine         = "mysql"
  engine_version = "8.0"

  instance_class    = "db.t3.micro"
  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  port = 3306

  db_subnet_group_name   = aws_db_subnet_group.mysql.name
  vpc_security_group_ids = [aws_security_group.mysql.id]
  parameter_group_name   = aws_db_parameter_group.mysql.name

  publicly_accessible     = false
  backup_retention_period = 0
  skip_final_snapshot     = true

  tags = {
    Name = var.db_identifier
  }
}
