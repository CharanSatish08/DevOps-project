provider "aws" {
  region = var.region
}

module "EC2-SG" {
  source        = "../modules/EC2-SG"
  region        = var.region
  project_name  = var.project_name
  ami_id        = var.ami_id
  instance_type = var.instance_type
  from_port     = var.from_port
  to_port       = var.to_port
}