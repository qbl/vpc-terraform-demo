# Web app public subnet
resource "aws_subnet" "web-pub" {
  vpc_id = "${aws_vpc.web-vpc.id}"
  cidr_block = "10.1.254.0/24"
  availability_zone = "ap-southeast-1a"

  tags {
    Name = "web-pub"
  }
}

# Database private subnet
resource "aws_subnet" "shared-subnet" {
  vpc_id = "${aws_vpc.shared-vpc.id}"
  cidr_block = "10.2.2.0/24"
  availability_zone = "ap-southeast-1a"

  tags {
    Name = "shared-subnet"
  }
}
