output "static_website_endpoint" {
  description = "The URL of the static website"
  value       = aws_s3_bucket_website_configuration.static_website.website_endpoint
}
