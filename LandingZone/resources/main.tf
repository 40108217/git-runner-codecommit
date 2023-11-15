##  WILL CREAT REQUIRED SERVICE AND EC2 PROFILE ROLE

resource "aws_iam_role" "elasticbeanstalk_service_role" {
  name = "elasticbeanstalk-service-role-tm"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "elasticbeanstalk.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role" "elasticbeanstalk_ec2-profile_role" {
  name = "elasticbeanstalk-ec2-profile-role-tm"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy-sv" {
  for_each = toset([
    "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth",
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkManagedUpdatesCustomerRolePolicy"])
  role       = aws_iam_role.elasticbeanstalk_service_role.name
  policy_arn = each.value
}

resource "aws_iam_role_policy_attachment" "attach_policy-ec2profile" {
  role       = aws_iam_role.elasticbeanstalk_ec2-profile_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}


# code for creating elastic beans stalk i.e. application and environment
resource "aws_elastic_beanstalk_application" "example" {
  name        = "example"
  description = "Example Elastic Beanstalk Application"
}

resource "aws_elastic_beanstalk_environment" "example" {
  name                = "example-env"
  application         = aws_elastic_beanstalk_application.example.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.0.5 running Python 3.11"
  depends_on = [aws_iam_role.elasticbeanstalk-ec2-profile-role-tm]

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    #value     = var.IamInstanceProfile # "aws-elasticbeanstalk-ec2-role-test" # Change to your IAM instance profile
    value = "elasticbeanstalk-ec2-profile-role-tm"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    #value     = var.servicerole # "aws-elasticbeanstalk-service-role" # Change to your IAM service role
    value = "elasticbeanstalk-service-role-tm"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.vpc_id  #"vpc-071bbe2392bd29998" # Change to your VPC ID
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    #value     = "subnet-01d67f563be1dc245,subnet-004256a865fea4288" # Change to your subnet IDs
    value     = var.subnet_ids  #"subnet-096bea842dc06379e"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "internal" # Change to "internal" for a private environment
  }

}

resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "Example security group for Elastic Beanstalk environment"

  vpc_id =var.vpc_id

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Adjust as needed for your security requirements
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}