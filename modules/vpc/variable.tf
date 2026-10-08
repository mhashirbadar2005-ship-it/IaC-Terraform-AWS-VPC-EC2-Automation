variable "environment" {
    description = "Environment name. It is used as a prefix for each resource"
    type = string

    validation {
        condition = contains(["Dev", "Test", "QA", "SIT", "STAGE", "UAT", "PPRD", "PROD", "DR"], var.environment)
        error_message = "Environment name must be one of the following: Dev, Test, QA, SIT, STAGE, UAT, PPRD, PROD, DR"
    }
}

variable "vpc_cidr" {
    description = "IPv4 CIDR block for the VPC.For Eg: 10.x.x.x/16"
    type = string

    validation {
        condition = can(cidrhost(var.vpc_cidr,0))
        error_message = "Invalid CIDR block. Please provide a valid IPv4 CIDR block."
    }
}

variable "public_subnets" {
    description = "Name and CIDR block of the public subnet."
    type = map(object({
        cidr_block = string
        az         = string
    }))
}

variable "private_subnets" {
    description = "Name and CIDR block of the private subnet."
    type = map(object({
        cidr_block = string
        az         = string
    }))
}

variable "enable_dns_hostname" {
    description = "Enable DNS hostname in the VPC. If true, instances with public IPs will have corresponding public DNS hostnames." 
    type        = bool
    default     = true
}

variable "enable_dns_support" {
    description = "Enable Amazon provided DNS support in the VPC." 
    type        = bool
    default     = true
}

variable "auto_assign_public_ip" {
    description = "Enable automatic assignment of public IP addresses to instances in the public subnets." 
    type        = bool
    default     = true
}