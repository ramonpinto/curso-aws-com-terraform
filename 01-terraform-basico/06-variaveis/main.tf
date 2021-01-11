provider "aws" {
  region = "${var.region}"
  profile = "${var.profile}"
}

resource "aws_instance" "web" {
  ami           = "${var.ami}"
  instance_type = "${var.instance-type}"

  # ipv6_addresses = "${var.ips}"

  tags = "${var.tags}"
}
