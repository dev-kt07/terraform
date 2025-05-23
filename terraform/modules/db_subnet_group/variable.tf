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
  default = ["subnet-0167d6771909791f3", "subnet-059617464cd5d9584"]
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

