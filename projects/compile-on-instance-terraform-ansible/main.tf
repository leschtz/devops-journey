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
  vpc_security_group_ids = ["sg-09d7885d3ebca300f"]
}
