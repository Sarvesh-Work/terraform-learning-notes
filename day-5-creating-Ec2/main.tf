
# EC2 Key Pair
# Generates an AWS key pair using an already
# created SSH public key (ec2-key.pub).
# The private key stays on the local machine.
resource "aws_key_pair" "terra_ec2_key" {
  key_name   = "terraform_ec2_key"
  public_key = file("ec2-key.pub")
}


# Default VPC
resource "aws_default_vpc" "default_vpc" {}


# Security Group
# Creates a security group that allows SSH access
# on port 22 and allows all outbound traffic.
resource "aws_security_group" "terraform_ec2_sg" {
  name        = "sg_terraform"
  description = "Allow SSH access"
  vpc_id      = aws_default_vpc.default_vpc.id

  # inbound rule: Allow SSH from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound rule: allow all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-sg"
  }
}


# EC2 Instance
# creates an EC2 instance using:
# generated key pair
# custom security group
# default VPC
resource "aws_instance" "automated_instance" {
  ami           = "ami-0b6c6ebed2801a5cb"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.terra_ec2_key.key_name

  # attach security group
  security_groups = [
    aws_security_group.terraform_ec2_sg.name
  ]

  # Root volume configuration
  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "terraform_automated_ec2"
  }
}
