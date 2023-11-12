

variable "cidr_blocks"{  }

variable "environment" {
}

resource "aws_vpc" "development_vpc" {
  cidr_block = 
    tags = {
    Name = 
  }
}

resource "aws_subnet" "dev_subnet-1"{
    vpc_id = aws_vpc.development_vpc.id
    cidr_block = 
    availability_zone = 
    tags = {
        Name = 
    }
} 
resource "aws_subnet" "dev_subnet-2"{
    vpc_id = aws_vpc.development_vpc.id
    cidr_block = 
    availability_zone = 
    tags = {
        Name = 
    }
} 
