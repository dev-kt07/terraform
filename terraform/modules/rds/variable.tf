variable "identifier" {
  type = string
  default = "my-db-instance"
}

variable "allocated_storage" {
  type    = number
  default = 20
}

variable "engine" {
  type = string
  default = "mysql"
}

variable "engine_version" {
  type = string
  default = "8.0"
}

variable "instance_class" {
  type = string
  default = "db.t3.micro"
}

variable "db_name" {
  type = string
  default = "mydatabase"
}

variable "username" {
  type = string
  default = "admin"
}

variable "password" {
  type      = string
  sensitive = true
  default = "krishna123"
}

variable "parameter_group_name" {
  type    = string
  default = "default.mysql8.0"
}

variable "publicly_accessible" {
  type    = bool
  default = false
}

variable "vpc_security_group_ids" {
  type = list(string)
  default = [ "sg-08b0580069e046b0a" ]
}

variable "db_subnet_group_name" {
  type = string
  default = "my-db-subnet-group"
}

variable "multi_az" {
  type    = bool
  default = false
}

variable "storage_type" {
  type    = string
  default = "gp2"  # or "gp3" (recommended for better performance/cost)
}

