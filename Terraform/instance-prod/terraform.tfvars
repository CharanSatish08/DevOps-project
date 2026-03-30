region = "us-east-1"
project_name = "instanx-prod-v1"
vpc_id = data.aws_vpc.vpc_id.id
ami_id = "ami-0ec10929233384c7f"
instance_type = "t2.micro"
from_port = 443
to_port = 443