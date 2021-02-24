output "id" {
  value = aws_instance.web.id
}

output "ami" {
  value = aws_instance.web.ami
}

output "arn" {
  value = aws_instance.web.arn
}

output "zone" {
  value = aws_instance.web.availability_zone
}

output "instance_type" {
  value = aws_instance.web.instance_type
}

output "public_ip" {
  value = aws_instance.web.public_ip
}

output "public_dns" {
  value = aws_instance.web.public_dns
}

output "private_ip" {
  value = aws_instance.web.private_ip
}