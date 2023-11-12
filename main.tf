
resource "aws_vpc" "development_vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
        Name = "${var.env_prefix}-vpc"
    }
}

resource "aws_subnet" "dev_subnet-1"{
    vpc_id = aws_vpc.development_vpc.id
    cidr_block = var.subnet_cidr_block
    availability_zone = var.avail_zone
    tags = {
        Name = "${var.env_prefix}-subnet-1"
    }
}


resource "aws_internet_gateway" "myapp-igw"{
  vpc_id = aws_vpc.development_vpc.id 
  tags = {
    Name = "${var.env_prefix}-igw"
  }
}
resource "aws_route_table" "myapp-route-table" {
  vpc_id = aws_vpc.development_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myapp-igw.id
  }

  tags = {
      Name = "${var.env_prefix}-public-Route-table"
  }
}


#by using default route table 
/*
resource "aws_default_route_table" "main-rt" {
  default_route_table_id = aws_vpc.development_vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myapp-igw.id
  }
  tags = {
      Name = "${var.env_prefix}-main-Route-table"
  }
}
*/
resource "aws_route_table_association" "associate-to-RT" {
  subnet_id      = aws_subnet.dev_subnet-1.id
  route_table_id = aws_route_table.myapp-route-table.id
}
