provider "aws" {
  region = var.region
}

// Ubuntu ec2 Web-server
resource "aws_instance" "Web_server" {
  ami                         = var.ami_ubuntu //ami id of Ubuntu
  subnet_id                   = var.subnet_id //subnet id
  instance_type               = var.instance_type //type of ec2 t2.micro
  security_groups             = [aws_security_group.Web_security_group.id] //security group
  key_name                    = var.key_name //ssh-key for ansible

  tags = {
    Name = "Course ubuntu instance"
    Owner = "Danylo Oksentiuk"
    Project = "Course Work"
  }
}

//Security group
resource "aws_security_group" "Web_security_group" {
  name        = "Web security group"
  description = "Ingress trafic on ports 80/443/8080"
  vpc_id      = var.vpc_id

  //http
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  //https - secure
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  //all ports all protocols
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Course security group"
    Owner = "Danylo Oksentiuk"
    Project = "Course Work"
  }
}

//elastic ip for reapplied
resource "aws_eip" "Web_eip" {
    instance = aws_instance.Web_server.id
    vpc      = true
}
