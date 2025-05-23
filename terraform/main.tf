provider "aws" {
  region = "ap-south-1"
}

module "ec2_instance" {
  source        = "./modules/ec2"
  ami_id        = "ami-06b6e5225d1db5f46"
  instance_type = "t2.micro"
  subnet_id     = "subnet-075bb40922d89bb13"
  key_name      = "sns-pipeline"
  instance_name = "demo-ec2"
  vpc_security_group_ids = ["sg-0a8c0590157004d2c"  ]
}





module "my_s3_bucket" {
  source      = "./modules/s3"
  bucket_name = "my-bucket-123"
  
  versioning  = true
  tags = {
    Environment = "dev"
    Owner       = "krishna"
    Project     = "terraform_s3"
  }
}



module "vpc" {
  source = "./modules/vpc"

  vpc_name           = "my-vpc"
  cidr_block         = "10.0.0.0/16"
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.101.0/24", "10.0.102.0/24"]
  azs                = ["ap-south-12", "ap-south-1b"]
  enable_nat_gateway = true
}


# Create a DB Subnet Group using subnets in your VPC
module "db_subnet_group" {
  source      = "./modules/db_subnet_group"
  name        = "my-db-subnet-group"
  description = "Subnet group for RDS"

  subnet_ids = [
    "subnet-059617464cd5d9584", # Replace with actual private subnet ID
    "subnet-0167d6771909791f3"  # Replace with another private subnet in a different AZ
  ]

  tags = {
     Name        = "my-db-subnet-group"
     Environment = "production"
     Team        = "devops"
     Project     = "rds-mysql"
  }
}

# Create an RDS instance using the DB Subnet Group created above
module "rds" {
  source = "./modules/rds"

  db_subnet_group_name = module.db_subnet_group.db_subnet_group_name

  identifier             = "mydb-instance"
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_name                = "mydatabase"
  username               = "admin"
  password               = "krishna123" # sensitive input
  parameter_group_name   = "default.mysql8.0"
  publicly_accessible    = false
  vpc_security_group_ids = ["sg-08b0580069e046b0a"]
  multi_az               = false
  storage_type           = "gp2"

  
}

module "web_sg" {
  source      = "./modules/security_group"
  name        = "my-sg"
  description = "Allow HTTP and SSH"
  vpc_id      = aws_vpc.main.id

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = {
     Environment = "dev"
    Owner       = "alice"
    
  }
}



