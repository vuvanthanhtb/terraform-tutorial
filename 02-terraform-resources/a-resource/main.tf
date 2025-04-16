terraform {
  required_providers {
    # terraform registry
    aws = {
      source  = "hashicorp/aws"
      version = "5.73.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "myEC2Instance" {
  ami             = "ami-01938df366ac2d954"
  instance_type   = "t2.micro"
  key_name        = "terraform-study-key-pair"
  security_groups = ["default"]
  tags = {
    Name = "myEC2Instance"
  }
}
