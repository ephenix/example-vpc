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
  vpc_id = aws_vpc.this.id
  cidr_block = cidrsubnet(var.cidr_block, 2, 0)
  availability_zone = data.aws_availability_zones.azs.names[0]
  tags = {
    Name = "${var.name}-private-az1"
  }
}

resource "aws_subnet" "az2" {
  vpc_id = aws_vpc.this.id
  cidr_block = cidrsubnet(var.cidr_block, 2, 1)
  availability_zone = data.aws_availability_zones.azs.names[1]
  tags = {
    Name = "${var.name}-private-az2"
  }
}

