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
  profile = "default"
  # access_key = "AWS_ACCESS_KEY_ID"
  #access_key = "AKIAZUA7TSGRCRXZBIGJ"
  # secret_key = "AWS_SECRET_ACCESS_KEY"
  #secret_key = "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"
  region = "us-east-1"
}