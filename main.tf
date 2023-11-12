

variable "vpc_cidr_block" {  

}
variable "subnet_cidr_block"{  

}
variable "availability_zone"{

}

variable "env_prefix" {}

resource "aws_vpc" "development_vpc" {
  cidr_block = 
    tags = {
    Name = 
  }
}

resource "aws_subnet" "dev_subnet-1"{
    vpc_id = aws_vpc.development_vpc.id
    cidr_block = var.vpc_cidr_block
    availability_zone = var.availability_zone
    tags = {
        Name = "${var.env_prefix}-vpc"
    }
} 
resource "aws_subnet" "dev_subnet-2"{
    vpc_id = aws_vpc.development_vpc.id
    cidr_block = var.subnet_cidr_block
    availability_zone = var.availability_zone
    tags = {
        Name = "${var.env_prefix}-subnet-1"
    }
} 
