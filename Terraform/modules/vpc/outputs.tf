output "region" {
  value = var.region
}

output "project_name" {
  value = var.project_name
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_az1_id" {
  value = aws_subnet.public_subnet-az1.id
}

output "public_subnet_az2_id" {
  value = aws_subnet.public_subnet-az2.id
}

output "aws_internet_gateway" {
  value = aws_internet_gateway.igw.id
}