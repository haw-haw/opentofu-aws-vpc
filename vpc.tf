resource "aws_vpc" "main" {
  cidr_block   = var.cider_block

  tags = {
    "Name" = var.vpc_name  
  }
}
