variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-06b6e5225d1db5f46"
}

variable "instance_type" {
  description = "The type of instance to launch (e.g., t2.micro)"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "The Subnet ID to launch the instance in"
  type        = string
  default     = "subnet-075bb40922d89bb13"
}

variable "key_name" {
  description = "Name of the SSH key pair to use for the instance"
  type        = string
  default     = "sns-pipeline"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = "demo-ec2"
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs to assign to the instance"
  type        = list(string)
  default     = ["sg-0a8c0590157004d2c"  ]
}
