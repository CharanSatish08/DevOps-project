resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  security_groups = [demo-sg]

  tags = {
    Name = "${var.project_name}-instance"
  }
}

resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  #vpc_id      = module.VPC.vpc_id

  tags = {
    Name = "${var.project_name}-demo-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.demo-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.from_port
  ip_protocol       = "tcp"
  to_port           = var.to_port
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.demo-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}