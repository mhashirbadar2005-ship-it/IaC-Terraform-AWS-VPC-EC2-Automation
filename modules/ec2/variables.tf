variable "aws_region"{
    type = string
    description = "AWS region to deploy"
    default = "us-east-1"
}

variable "Ubuntu_singapore_ami"{
    type = string
    description = "Ubuntu 26.04 AMI for  Singapore region"
    default = "ami-0532913178263be11"
}

variable "instance_type"{
    type = string
    description = "EC2 instance type"
    default = "t3.micro"
}

variable "key_name"{
    type = string
    description = "Key pair name for EC2 instance"
    default = "DEV-PEM-KP"
}

variable "env"{
    type = string
    description = "Environment name"
}

variable "sg_name"{
    type = string
    description = "Security group"
    default = "SG"
}