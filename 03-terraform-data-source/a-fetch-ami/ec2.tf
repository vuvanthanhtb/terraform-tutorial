resource "aws_instance" "myEC2" {
  ami             = data.aws_ami.amazon_linux_2.id
  instance_type   = "t2.micro"
  key_name        = "terraform-study-key-pair"
  security_groups = ["default"]
  tags = {
    Name = "myEC2"
  }
}
