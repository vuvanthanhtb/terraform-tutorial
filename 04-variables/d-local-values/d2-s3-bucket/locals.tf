resource "random_id" "random_suffix" {
  byte_length = 4
}

locals {
  bucket_name = "${var.s3_bucket_name}-${var.environment}-${random_id.random_suffix.hex}"
}
