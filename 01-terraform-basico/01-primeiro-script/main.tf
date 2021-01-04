provider "aws" {
  region = "sa-east-1"
  profile = "lab"
}

resource "aws_s3_bucket" "cursoterraform" {
  bucket = "curso-terraform2020"
  acl    = "private"

  tags = {
    Name        = "cursoterraform"
    Environment = "HML"
  }
}
