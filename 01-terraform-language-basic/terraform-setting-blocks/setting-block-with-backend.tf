terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.73.0"
    }
  }

  backend "s3" {
    bucket = "thanhvv-terraform"
    key    = "state/terraform.tfstate"
    region = "ap-southeast-1"
  }
}
