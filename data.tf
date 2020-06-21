data "aws_vpc" "default" {
  id = var.vpc_id
}

data "aws_subnet_ids" "private" {
  vpc_id = var.vpc_id
    filter {
      name   = "tag:Tier"
      values = [var.target_subnet_tag]
    }
}

data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.default.id
  name   = "default"
}

data "aws_caller_identity" "current" {}
