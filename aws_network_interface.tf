resource "aws_network_interface" "www1-eth0" {
  subnet_id = "${aws_subnet.web-pub.id}"
  description = "www1-eth0"
  private_ips = ["10.1.254.10"]
  security_groups = ["${aws_security_group.web-pub-sg.id}"]

  tags {
    Name = "www1-eth0"
  }
}
