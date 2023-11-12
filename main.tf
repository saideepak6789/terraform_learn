terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.24.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "AKIATKJQXSZ3OUPLCD44"
  secret_key = "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"
}

variable "cidr_blocks"{
  description = "cidr block of subnet"
  type = list(object({
    cidr_block = string,
    name = string
  }))

  }

variable "environment" {
  description = "deployment"
}

resource "aws_vpc" "development_vpc" {
  cidr_block = var.cidr_blocks[0].cidr_block
  tags = {
    Name = var.cidr_blocks[0].name
  }
}

resource "aws_subnet" "dev_subnet-1"{
    vpc_id = aws_vpc.development_vpc.id
    cidr_block = var.cidr_blocks[1].cidr_block
    availability_zone = "us-east-1a"
    tags = {
        Name = var.cidr_blocks[1].name
    }
} 
resource "aws_subnet" "dev_subnet-2"{
    vpc_id = aws_vpc.development_vpc.id
    cidr_block = var.cidr_blocks[2].cidr_block
    availability_zone = "us-east-1a"
    tags = {
        Name = var.cidr_blocks[2].name
    }
} 
output "dev_vpc_id" {
  value = aws_vpc.development_vpc.id
}

output "cidr_block_subnet_1" {
  value = aws_subnet.dev_subnet-1.id
}

output "cidr_block_subnet_2" {
  value = aws_subnet.dev_subnet-2.id
}