provider "aws" {
  region = "${var.region}"
  profile = "${var.profile}"
}

terraform {
  backend "s3" {
    profile = "lab"
    bucket = "curso-aws-terraform-remote-state-ramon-dev"
    key    = "ec2/ec2.tfstate"
    region = "sa-east-1"
  }
}

resource "aws_instance" "web" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"

  
}
