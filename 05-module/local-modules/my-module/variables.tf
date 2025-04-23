variable "ami" {
  description = "The AMI to use for the EC2 instance"
  type        = string
}

variable "myS3BucketName" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "thanhvv-s3-bucket-20250423"
}

variable "myRegion" {
  description = "value of the region"
  type        = string
}
