resource "aws_vpc" "myVPC" {
  cidr_block = local.vpc_cidr
  tags = {
    Name = local.vpc_name
  }
}

resource "aws_subnet" "mySubnetPublic" {
  vpc_id     = aws_vpc.myVPC.id
  cidr_block = local.public_subnet_cidrs
  tags = {
    Name = "${local.vpc_name}-public-subnet"
  }
}

resource "aws_subnet" "mySubnetPrivate" {
  vpc_id     = aws_vpc.myVPC.id
  cidr_block = local.private_subnet_cidrs
  tags = {
    Name = "${local.vpc_name}-private-subnet"
  }
}

resource "aws_instance" "web" {
  ami                         = "ami-0e449927258d45bc4"
  instance_type               = var.ec2_instance_type
  subnet_id                   = aws_subnet.mySubnetPublic.id
  security_groups             = ["default"]
  associate_public_ip_address = true
  tags = {
    Name = local.instance_name
  }
  user_data = file("apache_web.sh")
}
