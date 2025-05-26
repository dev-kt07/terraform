variable "name" {
  type    = string
  default = "my-db-subnet-group"
}

variable "description" {
  type    = string
  default = "subnetgroup of rdss"
}

variable "subnet_ids" {
  type    = list(string)
  default = ["subnet-04ad28a69f0c1e0a0", "subnet-0cf36861e446930a3"]
}

variable "tags" {
  type    = map(string)
  default = {
    Name        = "my-db-subnet-group"
     Environment = "production"
     Team        = "devops"
     Project     = "rds-mysql"
  }
}

