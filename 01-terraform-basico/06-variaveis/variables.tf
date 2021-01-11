variable "region" {
  default     = "sa-east-1"
  description = "Main region"
}

variable "acces_key" {
  default = ""
}

variable "secret_key" {
  default = ""
}

variable "ami" {
  default = "ami-022082b7f1da62478"
}

variable "instance-type" {
  
}

variable "ips" {
  type    = "list"
  default = ["3ffe:1900:4545:3:200:f8ff:fe21:67cf", "3ffe:1900:4545:3:200:f8ff:fe21:67cd"]
}

variable "tags" {
  type = "map"
  default = {
    "Name" = "Nodejs"
    "Env"  = "Dev"
  }
}

variable "profile" {
  default = "lab"
  
}