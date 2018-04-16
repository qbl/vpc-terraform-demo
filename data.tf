data "aws_ami" "ami-11c9be72" {
  most_recent = true

  filter {
    name   = "name"
    values = ["aws-elasticbeanstalk-amzn-2017.03.1.x86_64-ecs-hvm-201709200226"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["102837901569"] # Amazon
}
