resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  security_groups = ["demo-sg"]

  tags = {
    Name = "${var.project_name}-instance"
  }
}

