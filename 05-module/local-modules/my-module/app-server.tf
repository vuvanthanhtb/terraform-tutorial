resource "aws_instance" "myEC2" {
  ami           = var.ami
  instance_type = "t2.micro"
  depends_on    = [aws_dynamodb_table.myDynamoDB, aws_s3_bucket.myS3Bucket]
}
