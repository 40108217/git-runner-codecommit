data "aws_ami" "amazon_linux2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  

  owners = ["amazon"]
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.amazon_linux2.id}"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}