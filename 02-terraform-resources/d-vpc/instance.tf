resource "aws_instance" "myEC2" {
  ami                         = "ami-05ab12222a9f39021"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.mySecurityGroup.id]
  associate_public_ip_address = true
  key_name                    = "terraform-study-key-pair"
  subnet_id                   = aws_subnet.myPublicSubnet.id
  user_data                   = file("apache_web.sh")
  root_block_device {
    delete_on_termination = true
    volume_size           = 20
    volume_type           = "gp3"
  }
  tags = merge(local.common_tags, { Name = "myEC2" })
}
