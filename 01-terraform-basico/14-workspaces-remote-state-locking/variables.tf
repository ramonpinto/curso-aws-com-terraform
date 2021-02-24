variable "region" {
  default = "sa-east-1"
}

variable "ami" {
  type = map(string)

  default = {
    "dev"  = "ami-079b1541b6dc958ca"
    "prod" = "ami-079b1541b6dc958ca"
  }
}

variable "type" {
  type = map(string)

  default = {
    "dev"  = "t2.micro"
    "prod" = "t2.medium"
  }
}
