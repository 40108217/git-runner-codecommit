terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.22.0"
    }
  }
}

provider "aws" {
  # profile = "aclg"
  aws_access_key_id = AKIA5QB34A5NRMCZSF6N
  aws_secret_access_key = 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
  region = "us-east-1"
}