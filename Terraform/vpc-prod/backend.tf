terraform {
  backend "s3" {
    bucket = "terraform-backend-1303"
    key    = "terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}
