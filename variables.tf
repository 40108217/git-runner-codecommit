variable "region" {
  description = "Region name in which the vpc need to be created"
  type = string
  default = "us-gov-west-1"
}
variable "aws_secretsmanager_secret_name" {
  type        = string
  description = "secret manager name."
  default     = "secret-Manager"
}

variable "aws_secretsmanager_secret_version_secret_string" {
  type        = string
  description = "aws_secretsmanager_secret_version_secret_string."
  default     = "secret_string"
}

variable "environment" {
  type        = string
  default     = "prod-"
}
variable "prefix" {
  type        = string
  default     = "aws-"
}

variable "postfix" {
  type        = string
  default     = "-usw-ccoe-"
}

