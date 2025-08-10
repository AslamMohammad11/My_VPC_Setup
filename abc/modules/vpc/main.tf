resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "ExampleVPC"
  }
} 

resource "aws_subnet" "mysubnet_public_1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.subnet_public
  availability_zone = "ap-south-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "ExampleSubnet"
  }
}
resource "aws_internet_gateway" "mygateway" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "ExampleInternetGateway"
  }
}

resource "aws_route_table" "myroute" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mygateway.id
  }
  tags = {
    Name = "ExampleRouteTable"
  } 
}



resource "aws_route_table_association" "myassociation" {
  subnet_id      = aws_subnet.mysubnet_public_1.id
  route_table_id = aws_route_table.myroute.id
}

resource "aws_security_group" "mysecuritygroup" {
  vpc_id = aws_vpc.myvpc.id
  name   = "ExampleSecurityGroup"
  description = "Allow SSH and HTTP access"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ExampleSecurityGroup"
  }
} 