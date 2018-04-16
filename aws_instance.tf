resource "aws_instance" "www1" {
  ami = "${data.aws_ami.ami-11c9be72.id}"
  key_name = "${var.aws_key_name}"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = "${aws_network_interface.www1-eth0.id}"
    device_index = 0
  }

  root_block_device {
    delete_on_termination = true
    volume_size = "8"
    volume_type = "gp2"
  }

  tags {
    Name = "www1"
  }

  lifecycle {
    ignore_changes = ["ami"]
  }
}
