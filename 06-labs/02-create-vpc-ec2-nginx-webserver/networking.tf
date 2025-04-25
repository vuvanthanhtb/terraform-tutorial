locals {
  common_tags = {
    Author = "thanhvv"
    Name   = "myVPC"
  }
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = merge(local.common_tags, {
    Name = "myVPC"
  })
}

resource "aws_subnet" "public_subnet_01" {
  vpc_id                                      = aws_vpc.main.id
  cidr_block                                  = "10.0.1.0/24"
  availability_zone                           = "us-east-1a"
  enable_resource_name_dns_a_record_on_launch = true
  map_public_ip_on_launch                     = true
  tags = merge(local.common_tags, {
    Name = "myPublicSubnet01"
  })
}

resource "aws_subnet" "private_subnet_01" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = merge(local.common_tags, {
    Name = "myPrivateSubnet01"
  })
}

resource "aws_subnet" "public_subnet_02" {
  vpc_id                                      = aws_vpc.main.id
  cidr_block                                  = "10.0.3.0/24"
  availability_zone                           = "us-east-1b"
  enable_resource_name_dns_a_record_on_launch = true
  map_public_ip_on_launch                     = true
  tags = merge(local.common_tags, {
    Name = "myPublicSubnet02"
  })
}

resource "aws_subnet" "private_subnet_02" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  tags = merge(local.common_tags, {
    Name = "myPrivateSubnet02"
  })
}

resource "aws_internet_gateway" "myInternetGateway" {
  vpc_id = aws_vpc.main.id
  tags = merge(local.common_tags, {
    Name = "myInternetGateway"
  })
}

resource "aws_eip" "myElasticIP" {
  tags = merge(local.common_tags, {
    Name = "myElasticIP"
  })
}

resource "aws_nat_gateway" "myNatGateway" {
  allocation_id = aws_eip.myElasticIP.id
  subnet_id     = aws_subnet.public_subnet_01.id
  tags = merge(local.common_tags, {
    Name = "myNatGateway"
  })
  depends_on = [aws_internet_gateway.myInternetGateway]
}

resource "aws_route_table" "myPublicRouteTable" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myInternetGateway.id
  }
  tags = merge(local.common_tags, {
    Name = "myPublicRouteTable"
  })
  depends_on = [aws_vpc.main]
}

resource "aws_route_table" "myPrivateRouteTable" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.myNatGateway.id
  }
  tags = merge(local.common_tags, {
    Name = "myPrivateRouteTable"
  })
  depends_on = [aws_vpc.main]
}

resource "aws_route_table_association" "myPublicRouteTableAssociation01" {
  subnet_id      = aws_subnet.public_subnet_01.id
  route_table_id = aws_route_table.myPublicRouteTable.id
}

resource "aws_route_table_association" "myPublicRouteTableAssociation02" {
  subnet_id      = aws_subnet.public_subnet_02.id
  route_table_id = aws_route_table.myPublicRouteTable.id
}

resource "aws_route_table_association" "myPrivateRouteTableAssociation01" {
  subnet_id      = aws_subnet.private_subnet_01.id
  route_table_id = aws_route_table.myPrivateRouteTable.id
}

resource "aws_route_table_association" "myPrivateRouteTableAssociation02" {
  subnet_id      = aws_subnet.private_subnet_02.id
  route_table_id = aws_route_table.myPrivateRouteTable.id
}
