# Public VPC
resource "aws_vpc" "web-vpc" {
  cidr_block = "10.1.0.0/16"

  tags {
    Name = "web-vpc"
  }
}

# Private VPC
resource "aws_vpc" "shared_vpc" {
  cidr_block = "10.2.0.0/16"

  tags {
    Name = "shared-vpc"
  }
}
