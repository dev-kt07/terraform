resource "aws_db_subnet_group" "this" {
  name       = var.name
  description = var.description
  subnet_ids = ["subnet-04ad28a69f0c1e0a0", "subnet-0cf36861e446930a3"]

  tags = var.tags
}
