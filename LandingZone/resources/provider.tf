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
  access_key = "AKIA6H5VPVMJQNW7PO5Z"
  # secret_key = "AWS_SECRET_ACCESS_KEY"
  secret_key = "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"
  region = "us-east-1"
}