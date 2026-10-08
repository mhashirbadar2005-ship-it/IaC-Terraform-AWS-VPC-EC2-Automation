# VPC

resource "aws_vpc" "this"{
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = var.enable_dns_hostname
    enable_dns_support = var.enable_dns_support

    tags = {
        Name = "${local.name_prefix}-VPC"
    }

}

# Internet Gateway

resource "aws_internet_gateway" "this" {
    vpc_id = aws_vpc.this.id

    tags = {
        Name = "${local.name_prefix}-IGW"
    }
}

# Subnets

resource "aws_subnet" "public" {
    for_each = var.public_subnets

    vpc_id = aws_vpc.this.id
    cidr_block = each.value.cidr_block
    availability_zone = each.value.az

    tags = {
        Name = "${local.name_prefix}-PUB-${each.key}"
    }


}

resource "aws_subnet" "private" {
    for_each = var.private_subnets

    vpc_id = aws_vpc.this.id
    cidr_block = each.value.cidr_block
    availability_zone = each.value.az

    tags = {
        Name = "${local.name_prefix}-PVT-${each.key}"
    }


}

# Public Route Table

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.this.id


    tags = {
        Name = "${local.name_prefix}-PUB-RT"
    }
}

resource "aws_route" "Public_Internet" {
    route_table_id = aws_route_table.public.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "public" {
    for_each = aws_subnet.public

    subnet_id = each.value.id
    route_table_id = aws_route_table.public.id
}

# Private Route Table


resource "aws_route_table" "private" {
    vpc_id = aws_vpc.this.id


    tags = {
        Name = "${local.name_prefix}-PVT-RT"
    }
}


resource "aws_route_table_association" "private" {
    for_each = aws_subnet.private

    subnet_id = each.value.id
    route_table_id = aws_route_table.private.id
}