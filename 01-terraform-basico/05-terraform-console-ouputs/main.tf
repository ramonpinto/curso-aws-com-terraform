provider "aws" {
  region = "sa-east-1"
  profile = "lab"
}

resource "aws_s3_bucket" "b" {
  bucket = "curso-terraform2020"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket = "${aws_s3_bucket.b.id}"
  key    = "hello-world.txt"
  source = "arquivo.txt"
  etag   = "${md5(file("arquivo.txt"))}"
}

output "bucket" {
  value = "${aws_s3_bucket.b.id}"
}

output "etag" {
  value = "${aws_s3_bucket_object.object.etag}"
}
