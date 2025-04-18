locals {
  common_tags = {
    Author = "thanhvv"
  }
}

resource "aws_vpc" "myVPC" {
  cidr_block = "10.0.0.0/16"
  tags       = merge(local.common_tags, { Name = "myVPC" })
}

resource "aws_subnet" "myPublicSubnet" {
  vpc_id     = aws_vpc.myVPC.id
  cidr_block = "10.0.1.0/24"
  # tags = {
  #   Author = "thanhvv"
  #   Name   = "myPublicSubnet"
  # }
  tags = merge(local.common_tags, { Name = "myPublicSubnet" })
}

resource "aws_internet_gateway" "myIGW" {
  vpc_id = aws_vpc.myVPC.id
  tags   = merge(local.common_tags, { Name = "myIGW" })
}

resource "aws_route_table" "myPublicRT" {
  vpc_id = aws_vpc.myVPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myIGW.id
  }
  tags = merge(local.common_tags, { Name = "myPublicRT" })
}

resource "aws_route_table_association" "myPublicRTAssociation" {
  subnet_id      = aws_subnet.myPublicSubnet.id
  route_table_id = aws_route_table.myPublicRT.id
}

resource "aws_security_group" "mySecurityGroup" {
  description = "Allow port 80, 443, 22, ICMP protocol"
  name        = "mySecurityGroup"
  vpc_id      = aws_vpc.myVPC.id
  tags        = merge(local.common_tags, { Name = "mySecurityGroup" })
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.mySecurityGroup.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.mySecurityGroup.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.mySecurityGroup.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "icmpIPv4" {
  security_group_id = aws_security_group.mySecurityGroup.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = -1
  to_port           = -1
  ip_protocol       = "icmp"
}

resource "aws_vpc_security_group_egress_rule" "outboundRules" {
  security_group_id = aws_security_group.mySecurityGroup.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
