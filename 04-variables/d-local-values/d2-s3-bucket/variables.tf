variable "aws_region" {
  description = "value of the AWS region"
  type        = string
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "name of the S3 bucket"
  type        = string
  default     = "thanhvv-s3-bucket"
}

variable "environment" {
  description = "environment of the S3 bucket"
  type        = string
  default     = "dev"
}
