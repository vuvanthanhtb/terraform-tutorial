resource "aws_instance" "myEC2" {
  ami             = "ami-0e449927258d45bc4"
  instance_type   = "t2.micro"
  security_groups = ["default"]
  tags = {
    Name = "myEC2"
  }

  lifecycle {
    ignore_changes = [tags]
  }
} 
