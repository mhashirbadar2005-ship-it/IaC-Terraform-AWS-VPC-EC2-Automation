data "aws_subnet" "dev-ec2-pub-01"{
    filter {
        name = "tag:Name"
        values = ["DEV-EC2-Pub-Subnet01"]
         }
}
data "aws_security_group" "dev_ip_sg"{
    filter {
        name = "tag:Name"
        values = ["DEV-Home-SG"]
         }
}

data "aws_vpc" "dev-vpc"{
    id = data.aws_subnet.dev-ec2-pub-01.vpc_id
}

locals{
    name_prefix = "${var.env}"
}