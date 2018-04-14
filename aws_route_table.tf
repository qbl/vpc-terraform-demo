resource "aws_route_table" "web-route-table" {
  vpc_id = "${aws_vpc.web-vpc.id}"

  tags {
    Name = "web-pub"
  }
}

resource "aws_internet_gateway" "web-igw" {
  vpc_id = "${aws_vpc.web-vpc.id}"

  tags {
    Name = "web-igw"
  }
}

resource "aws_route" "web-pub-route" {
  route_table_id            = "${aws_route_table.web-route-table.id}"
  gateway_id            = "${aws_internet_gateway.web-igw.id}"
  destination_cidr_block    = "0.0.0.0/0"
}

resource "aws_route_table_association" "web-pub" {
  subnet_id = "${aws_subnet.web-pub.id}"
  route_table_id = "${aws_route_table.web-route-table.id}"
}
