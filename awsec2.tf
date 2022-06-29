provider "aws" {
region = "us-east-1"
}
resource "aws_instance" "demo" {
  ami = "ami-0cff7528ff583bf9a"
   instance_type = "t2.micro"
   key_name = "keykey"
   security_groups = ["webSG"]
   tags = {
    Name = "ec2demo"
    Env = "dev"
}

}
resource "aws_security_group" "webSG" {
  name        = "webSG"
  description = "security groupe webSG"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]

  }

}
