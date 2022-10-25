terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.36"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-0caef02b518350c8b"
  instance_type          = "t2.micro"
  key_name               = "testKeyPair"
  count                  = 2
  vpc_security_group_ids = ["sg-09d7885d3ebca300f"]
}


output "instance_id" {
  description = "ID of the EC2 Instance"
  value       = aws_instance.app_server.*.id
}

output "instance_public_ip" {
  description = "Public IP of the EC2 Instance"
  value       = aws_instance.app_server.*.public_ip
}

output "instance_public_dns" {
  description = "Public DNS of the EC2 Instance"
  value       = aws_instance.app_server.*.public_dns
}
