
provider "aws" {
region = var.aws_region
}

# Create a VPC
resource "aws_vpc" "main" {
cidr_block = var.vpc_cidr_block
tags = {
Name = "main-vpc"
}
}

# Create a Subnet inside the VPC
resource "aws_subnet" "main" {
vpc_id = aws_vpc.main.id
cidr_block = var.subnet_cidr_block
tags = {
Name = "main-subnet"
}
}

# Create an EC2 Instance inside the Subnet
resource "aws_instance" "example" {
ami = var.ami_id
instance_type = var.instance_type
subnet_id = aws_subnet.main.id
tags = {
Name = "example-instance"
}
}
