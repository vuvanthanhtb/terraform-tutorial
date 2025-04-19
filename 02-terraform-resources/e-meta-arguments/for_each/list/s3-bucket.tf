resource "aws_s3_bucket" "myS3Bucket" {
  for_each = toset(["thanhvv-bucket-01", "thanhvv-bucket-02", "thanhvv-bucket-03"])
  bucket   = each.value
}
