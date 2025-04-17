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
  # ami             = "ami-01938df366ac2d954"
  ami           = "ami-065a492fef70f84b1"
  instance_type = "t2.micro"
  key_name      = "terraform-study-key-pair"
  subnet_id     = "subnet-0f40b534ab32974b9"
  tags = {
    Name = "destroyRecreateResource"
  }
}
