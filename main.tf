data "aws_availability_zones" "azs" {
  state = "available"
}

resource "aws_vpc" "this" {
  tags = {
    Name = var.name
  }
  cidr_block = var.cidr_block
}

resource "aws_subnet" "az1" {
  cidr_block = cidrsubnet(var.cidr_block, 2, 0)
  availability_zone = data.aws_availability_zones.azs[0].name
  tags = {
    Name = "${var.name}-private-az1"
  }
}

resource "aws_subnet" "az2" {
  cidr_block = cidrsubnet(var.cidr_block, 2, 1)
  availability_zone = data.aws_availability_zones.azs[1].name
  tags = {
    Name = "${var.name}-private-az2"
  }
}

