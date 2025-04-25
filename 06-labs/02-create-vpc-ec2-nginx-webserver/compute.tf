resource "aws_instance" "myWebServer" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet_01.id
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  key_name                    = "terraform-study-key-pair"
  user_data                   = file("install_nginx.sh")
  root_block_device {
    volume_type           = "gp3"
    volume_size           = 30
    delete_on_termination = true
  }
  tags = {
    Name = "myWebServer"
  }
}
