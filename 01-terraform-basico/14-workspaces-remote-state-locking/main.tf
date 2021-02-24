provider "aws" {
  region  = var.region
  profile = "lab"
}

terraform {
  backend "s3" {
    profile        = "lab"
    region         = "sa-east-1"
    bucket         = "curso-aws-terraform-328178012196-sa-east-1-remote-state"
    key            = "terraform.tfstate"
    dynamodb_table = "curso-aws-terraform-328178012196-sa-east-1-remote-state"
  }
}

locals {
  env = terraform.workspace
}

resource "aws_instance" "web" {
  ami           = lookup(var.ami, local.env)
  instance_type = lookup(var.type, local.env)

  tags = {
    Name = "Minha máquina web ${local.env}"
    Env  = local.env
  }
}
