resource "aws_instance" "myEC2" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = "t2.micro"
  key_name                    = "terraform-study-key-pair"
  vpc_security_group_ids      = [aws_security_group.mySecurityGroupRules.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.myPublicSubnet.id
  user_data                   = file("apache_web.sh")
  count                       = 2
  root_block_device {
    volume_size           = 30
    volume_type           = "gp3"
    delete_on_termination = true
  }
  tags = {
    Name = "myEC2-instance0${count.index + 1}"
  }
}
