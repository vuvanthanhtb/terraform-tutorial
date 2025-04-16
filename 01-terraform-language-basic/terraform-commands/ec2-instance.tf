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
  ami           = "ami-065a492fef70f84b1"
  instance_type = "t2.micro"
  key_name      = "test-ec2"
  tags = {
    Name = "myEC2Instance"
  }
}
