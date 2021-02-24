provider "aws" {
  region  = var.region
  profile = "lab"
}

terraform { # Salvando confirações do state no bucket s3
  backend "s3" {
    profile = "lab"
    bucket  = "curso-aws-terraform-remote-state-ramon-dev"
    key     = "ec2/ec2.tfstate"
    region  = "sa-east-1"
  }
}

locals {
  conn_type    = "ssh"
  conn_user    = "ubuntu"
  conn_timeout = "10m"
  conn_key     = file("~/Documentos/Chaves_aws/ramon-araujo.pem")
}

resource "aws_instance" "web" { # Criando ec2
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = "ramon-araujo"

  tags = {
    "Name" = "Ubuntu-ramon-teste"
  }

  provisioner "file" {
    source      = "2019-01-26.log"
    destination = "/tmp/file.log"

    connection {
      host        = self.public_ip
      type        = local.conn_type
      user        = local.conn_user
      timeout     = local.conn_timeout
      private_key = local.conn_key
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 25",
      "echo \"[UPDATING THE SYSTEM]\"",
      "sudo yum update -y",
      "echo \"[INSTALLING HTTPD]\"",
      "sudo yum install -y httpd",
      "echo \"[STARTING HTTPD]\"",
      "sudo service httpd start",
      "sudo chkconfig httpd on",
      "echo \"[FINISHING]\"",
      "sleep 25",
    ]

    connection {
      host        = self.public_ip
      type        = local.conn_type
      user        = local.conn_user
      timeout     = local.conn_timeout
      private_key = local.conn_key
    }
  }
}

resource "null_resource" "null" {
  provisioner "local-exec" {
    command = "echo ${aws_instance.web.id}:${aws_instance.web.public_ip} >> public_ips.txt"
  }
}

resource "tls_private_key" "pkey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "keypair" {
  key_name   = "ramon-araujo-${var.env}"
  public_key = tls_private_key.pkey.public_key_openssh
}
