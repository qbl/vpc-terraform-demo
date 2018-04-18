# Public security group
resource "aws_security_group" "web-pub-sg" {
  vpc_id = "${aws_vpc.web-vpc.id}"

  name = "web-pub-sg"
  description = "web-pub subnet sg"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    description = "the internet"
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["117.102.111.115/32"]
    description = "me"
  }

  # Important note:
  # By default, AWS create an "allow all" outbound rule whenever we create a VPC security group.
  # However, when we create our own security group with Terraform,
  # this default egress rule is removed, hence we need to add this rule again manually
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "web-pub-sg"
  }
}

# Private security group
resource "aws_security_group" "database-sg" {
  vpc_id = "${aws_vpc.shared-vpc.id}"

  name = "database-sg-sg"
  description = "database subnet sg"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["192.168.0.0/16", "10.2.0.0/16"]
    description = "internal ssh"
  }

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "TCP"
    cidr_blocks = ["10.1.254.0/24"]
    description = "web-pub subnet"
  }

  ingress {
    from_port = 8
    to_port = 0
    protocol = "ICMP"
    cidr_block = ["10.0.1.0/24"]
  }

  tags {
    Name = "database-sg"
  }
}
