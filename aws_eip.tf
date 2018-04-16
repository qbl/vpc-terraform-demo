resource "aws_eip" "name" {
  vpc = true
  network_interface = "${aws_network_interface.www1-eth0.id}"
  associate_with_private_ip = "10.1.254.10"
}
