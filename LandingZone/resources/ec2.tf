data "aws_ami" "amazon_linux2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["2023.2.20231026.0 x86_64 HVM kernel-6.1"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux2.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}