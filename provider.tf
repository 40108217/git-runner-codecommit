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
  # access_key = "AKIA5QB34A5NRMCZSF6N"
  # secret_key = "AWS_SECRET_ACCESS_KEY"
  # secret_key = "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"
  # region = "us-east-1"
}