provider "random" {
  version = "~> 2.2.1"
}

provider "aws" {
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "2.15.0"

  identifier = var.name

  family               = var.family
  major_engine_version = var.major_engine_version
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  allocated_storage    = var.allocated_storage

  name     = var.db_name
  username = var.username
  password = coalesce(var.password, random_password.password.result)
  port     = var.port

  iam_database_authentication_enabled = var.iam_database_authentication_enabled

  vpc_security_group_ids = [data.aws_security_group.default.id]
  subnet_ids             = length(var.subnet_ids) > 0 ? var.subnet_ids : tolist(data.aws_subnet_ids.private.ids)

  maintenance_window      = var.maintenance_window
  backup_window           = var.backup_window
  backup_retention_period = var.backup_retention_period
  copy_tags_to_snapshot   = var.copy_tags_to_snapshot

  tags = {
    Project : var.name
    Owner : local.username
    username : local.username
  }
}
