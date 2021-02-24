provider "aws" {
  region  = var.region
  profile = "lab"
}

resource "random_id" "bucket" {
  byte_length = 8
}
# provide para gerar strings inteiros randomicamente (random_id)
resource "random_id" "bucket_2" {
  byte_length = 8
}

module "bucket" {
  source = "./s3"
  # Gerando nome do bucket com caracteres hexadecimal
  name       = "my-bucket-ramon-${random_id.bucket.hex}"
  versioning = true

  tags = {
    "Name" = "Meu bucket de anotações"
  }

  create_object = true
  object_key    = "files/${random_id.bucket.dec}.txt"
  object_source = "file.txt"
}

module "bucket-2" {
  source = "./s3"
  name   = "my-bucket-ramon-${random_id.bucket_2.hex}"
}
