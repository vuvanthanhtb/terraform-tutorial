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
  profile = "user01"
}

provider "aws" {
  profile = "user02"
  region  = "us-east-1"
}
