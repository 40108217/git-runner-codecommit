terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.22.0"
    }
  }
}

provider "aws" {
  #access_key = "${{ secrets.AWS_ACCESS_KEY_ID }}"
  #secret_key = ${{ secrets.AWS_SECRET_ACCESS_KEY }}
  #region = ${{ secrets.AWS_REGION }}
  # profile = "aclg"
  # access_key = "AWS_ACCESS_KEY_ID"
  access_key = "AKIA2UVCZJIHJ55CSUW2"
  # secret_key = "AWS_SECRET_ACCESS_KEY"
  secret_key = "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"
  region = "us-east-1"
}