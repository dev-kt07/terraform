provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      =  var.key_name   
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids 
}

