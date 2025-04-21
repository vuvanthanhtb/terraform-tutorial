# Create an Internet Gateway
resource "aws_internet_gateway" "myInternetGateway" {
  vpc_id = aws_vpc.myVPC.id

  tags = {
    Name = "myInternetGateway"
  }
}
