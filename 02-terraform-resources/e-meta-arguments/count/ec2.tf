resource "aws_instance" "myEC2" {
  ami             = "ami-05ab12222a9f39021"
  instance_type   = "t2.micro"
  key_name        = "terraform-study-key-pair"
  count           = 5
  security_groups = ["default"]
  tags = {
    Name = "myEC2-${count.index}"
  }
}
