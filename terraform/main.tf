provider "aws" {
  region = var.aws_region
  access_key = var.aws_id
  secret_key = var.aws_secret
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "ecs" {

  key_name   = var.key_name
  public_key = "${file(pathexpand("~/.ssh/id_rsa.pub"))}"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    # TLS (change to whatever ports you need)
    to_port   = 22
    from_port   = 0
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_instance" "test" {
  ami           = "${data.aws_ami.ubuntu.id}"
  #instance_type = "t2.micro"
  instance_type = var.instance_type
  key_name   = var.key_name
  security_groups = ["allow_ssh"]

  tags = {
    Name = "test-u18"
  }
}