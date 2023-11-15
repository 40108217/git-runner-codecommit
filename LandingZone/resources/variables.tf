variable "vpc_id" {
  type = string
  default = "vpc-03414076b9d87157f"
}

variable "subnet_ids" {
  type = string
  default = "subnet-081865f00963d196a"
}

variable "IamInstanceProfile" {
  type = string
  default = "aws-elasticbeanstalk-ec2-role-test"
}

variable "ServiceRole" {
  type = string
  default = "aws-elasticbeanstalk-service-role"
}

variable "solution_stack_name" {
  type = string
  default = "64bit Amazon Linux 2023 v4.0.5 running Python 3.11"
}

variable "servicerole" {
  type = string
  default = "aws-elasticbeanstalk-service-role"
}
