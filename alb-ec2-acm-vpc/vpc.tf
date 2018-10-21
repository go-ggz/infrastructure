resource "aws_vpc" "ggz" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags {
    Name        = "ggz"
    Environment = "${var.environment}"
  }
}

resource "aws_subnet" "ggz_a" {
  vpc_id                  = "${aws_vpc.ggz.id}"
  cidr_block              = "172.31.16.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"

  tags {
    Name        = "ggz_subset_a"
    Environment = "${var.environment}"
  }
}

resource "aws_subnet" "ggz_c" {
  vpc_id                  = "${aws_vpc.ggz.id}"
  cidr_block              = "172.31.32.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}c"

  tags {
    Name        = "ggz_subset_c"
    Environment = "${var.environment}"
  }
}

resource "aws_internet_gateway" "ggz" {
  vpc_id = "${aws_vpc.ggz.id}"

  tags {
    Name        = "ggz_gw"
    Environment = "${var.environment}"
  }
}

resource "aws_route_table" "ggz" {
  vpc_id = "${aws_vpc.ggz.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ggz.id}"
  }

  tags {
    Name        = "aws_route_table"
    Environment = "${var.environment}"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.ggz_a.id}"
  route_table_id = "${aws_route_table.ggz.id}"
}

resource "aws_route_table_association" "c" {
  subnet_id      = "${aws_subnet.ggz_c.id}"
  route_table_id = "${aws_route_table.ggz.id}"
}
