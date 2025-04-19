resource "aws_s3_bucket" "myS3Bucket" {
  bucket = "thanhvv-bucket-pd"
  lifecycle {
    prevent_destroy = true
  }
}
