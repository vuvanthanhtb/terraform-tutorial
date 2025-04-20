# Public route table for internet access
resource "aws_route_table" "publicRouteTable" {
  vpc_id = aws_vpc.myVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myInternetGateway.id
  }

  tags = {
    Name = "publicRouteTable"
  }
}

# Associate public subnets with the public route table
resource "aws_route_table_association" "myAssociatePublicSubnet" {
  subnet_id      = aws_subnet.myPublicSubnet.id
  route_table_id = aws_route_table.publicRouteTable.id
}
