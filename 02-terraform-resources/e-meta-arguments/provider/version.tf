terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.75.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
  alias  = "singapore"
}

provider "aws" {
  region = "us-east-1"
  alias  = "virginia"
}
