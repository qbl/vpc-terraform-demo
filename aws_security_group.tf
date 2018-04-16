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
