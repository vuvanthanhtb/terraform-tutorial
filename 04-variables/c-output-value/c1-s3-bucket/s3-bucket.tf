resource "random_id" "random_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "thanhvv-s3-bucket-${random_id.random_suffix.hex}"
}
