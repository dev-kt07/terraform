variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "jack-daniels-bucket-123"
}



variable "versioning" {
  description = "Enable versioning"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to the bucket"
  type        = map(string)
  default     = {
    Environment = "dev"
    Owner       = "alice"
    Project     = "terraform-s3"
  }
}
