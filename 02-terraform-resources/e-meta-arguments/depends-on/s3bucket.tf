resource "aws_s3_bucket" "myS3" {
  bucket     = "s3thanhvv-meta-arguments"
  depends_on = [aws_instance.myEC2]
}
