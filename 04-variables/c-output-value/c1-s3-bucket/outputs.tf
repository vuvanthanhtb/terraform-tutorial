output "s3_output" {
  description = "value of the S3 bucket"
  value       = aws_s3_bucket.my_s3_bucket.bucket
}
