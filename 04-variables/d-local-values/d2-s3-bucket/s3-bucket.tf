resource "aws_s3_bucket" "myS3Bucket" {
  bucket = local.bucket_name
  tags = {
    Name        = local.bucket_name
    Environment = var.environment
  }
}
