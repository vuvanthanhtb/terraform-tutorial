terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.74.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "myEC2" {
  ami             = "ami-01938df366ac2d954"
  instance_type   = "t2.micro"
  key_name        = "terraform-study-key-pair"
  security_groups = ["default"]
  tags = {
    # Name = "myEC2_1"
    Name = "updateName"
  }
}
