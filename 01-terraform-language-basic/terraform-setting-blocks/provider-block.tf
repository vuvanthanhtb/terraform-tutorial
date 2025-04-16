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
  alias  = "southeast"
  region = "ap-southeast-1"
}

provider "aws" {
  alias  = "east"
  region = "us-east-1"
}

resource "aws_instance" "myEC2" {
  provider = aws.southeast # selected region
}
