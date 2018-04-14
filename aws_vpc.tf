resource "aws_vpc" "web-vpc" {
  cidr_block = "10.1.0.0/16"

  tags {
    Name = "web-vpc"
  }
}
