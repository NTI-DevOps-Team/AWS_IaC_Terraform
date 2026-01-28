# Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
  }
}

# Create Subnets
resource "aws_subnet" "subnets" {
  for_each = var.subnets

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az_name
  map_public_ip_on_launch = each.value.public_ip

  tags = {
    Name = "${each.value.subnet_name}_${each.value.az_name}"
  }
}

#create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.vpc_name}_igw"
  }
}

# Create Regional NAT Gateway with auto mode
resource "aws_nat_gateway" "regional_nat_gw" {
  vpc_id            = aws_vpc.vpc.id
  connectivity_type = "public"
  availability_mode = "regional"

  tags = {
    Name = "${var.vpc_name}_regional_nat_gw_auto_mode"
  }

  depends_on = [aws_internet_gateway.igw]
}


# Create Route Tables
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.vpc_name}_public_route_table"
  }
}

resource "aws_route_table" "private_route_table" {
  for_each = {
    for k, v in var.subnets : k => v if !v.public_ip
  }

  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.regional_nat_gw.id
  }

  tags = {
    Name = "${var.vpc_name}_private_route_table_${each.value.az_name}"
  }
}


# Associate Subnets with Route Tables
resource "aws_route_table_association" "public_subnet_association" {
  for_each = {
    for k, v in var.subnets : k => v if v.public_ip
  }

  subnet_id      = aws_subnet.subnets[each.key].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_subnet_association" {
  for_each = {
    for k, v in var.subnets : k => v if !v.public_ip
  }

  subnet_id      = aws_subnet.subnets[each.key].id
  route_table_id = aws_route_table.private_route_table[each.key].id
}

