#Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

#Create a Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

#List all the AZs in the region
data "aws_availability_zones" "available_zones" {}

#create a public subnet in az1
resource "aws_subnet" "public_subnet-az1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_az1_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-subnet-az1"
  }
}

#create a public subnet in az2
resource "aws_subnet" "public_subnet-az2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_az2_cidr
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-subnet-az2"
  }
}

#Create a route table to route the traffic to IGW.
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.project_name}-public-route-table"
  }
}

#Associate the public subnets to the public route table.
resource "aws_route_table_association" "public_subnet_az1_association" {
  subnet_id      = aws_subnet.public_subnet-az1.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "public_subnet_az2_association" {
  subnet_id      = aws_subnet.public_subnet-az2.id
  route_table_id = aws_route_table.route_table.id
}

