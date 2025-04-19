resource "aws_instance" "myEC2" {
  ami               = "ami-0e449927258d45bc4"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1c" # => us-east-1a
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "myEC2"
  }
}

