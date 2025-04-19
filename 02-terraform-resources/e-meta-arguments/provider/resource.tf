resource "aws_s3_bucket" "myBucketSingapore" {
  bucket   = "thanhvv-bucket-singapore"
  provider = aws.singapore
}

resource "aws_s3_bucket" "myBucketVirginia" {
  bucket   = "thanhvv-bucket-virginia"
  provider = aws.virginia
}
