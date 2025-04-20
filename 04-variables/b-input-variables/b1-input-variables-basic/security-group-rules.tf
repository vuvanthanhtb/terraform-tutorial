resource "aws_security_group" "mySecurityGroupRules" {
  name        = "mySecurityGroupRules"
  description = "Allow protocols: HTTP, HTTPS, SSH and icmpIpv4"
  vpc_id      = aws_vpc.myVPC.id
  tags = {
    Name = "mySecurityGroupRules"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allowHTTP" {
  security_group_id = aws_security_group.mySecurityGroupRules.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  tags = {
    Name = "allowHTTP"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allowHTTPs" {
  security_group_id = aws_security_group.mySecurityGroupRules.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  tags = {
    Name = "allowHTTPs"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allowSSH" {
  security_group_id = aws_security_group.mySecurityGroupRules.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  tags = {
    Name = "allowSSH"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allowIcmpIPv4" {
  security_group_id = aws_security_group.mySecurityGroupRules.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = "-1"
  to_port           = "-1"
  ip_protocol       = "icmp"
  tags = {
    Name = "allowIcmpIPv4"
  }
}

resource "aws_vpc_security_group_egress_rule" "allowAllOutbound" {
  security_group_id = aws_security_group.mySecurityGroupRules.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  tags = {
    Name = "allowAllOutbound"
  }
}
