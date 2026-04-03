resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  security_groups = ["demo-sg"]
  for_each = toset([ "Jenkins-master", "Jenkins-slave" ])
  tags = {
    Name = "${each.key}-instance"
  }
}

