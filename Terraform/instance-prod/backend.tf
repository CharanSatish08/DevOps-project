terraform {
  backend "s3" {
    bucket = "terraform-backend-1303"
    key    = "instance.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}