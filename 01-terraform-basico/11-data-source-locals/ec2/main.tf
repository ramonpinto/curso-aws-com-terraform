provider "aws" {
  region  = var.region
  profile = "lab"
}

terraform {
  backend "s3" {
    profile = "lab"
    bucket  = "curso-aws-terraform-remote-state-ramon-dev"
    key     = "ec2/ec2.tfstate"
    region  = "sa-east-1"
  }
}

data "aws_ami" "ubuntu" {
  owners      = ["amazon"]
  most_recent = true
  name_regex  = "ubuntu"
}



resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = "Ubuntu-teste-ramon"
  }
}
