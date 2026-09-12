provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-03bb6d83c60fc5f7c" # Amazon Linux 2 x86_64 AMI
  instance_type = "t3.micro"              # Free Tier eligible
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  key_name      = "saisadhgun-key" #musg match with the key pair name
}
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = "vpc-05eb57d8de8f55c7f" # replace with your default VPC ID

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

