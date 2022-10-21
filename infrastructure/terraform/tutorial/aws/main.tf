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
  region = "eu-central-1" # Frankfurt Region
}

resource "aws_instance" "app_server" {
  ami = "ami-0caef02b518350c8b"
  #ami           = "ami-06148e0e81e5187c8"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
