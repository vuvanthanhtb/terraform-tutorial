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

# resource "aws_vpc" "myVPC" {
#   cidr_block       = "10.0.0.0/16"
#   instance_tenancy = "default" # "dedicated"
#   tags = {
#     Name = "myVPC"
#   }
# }
