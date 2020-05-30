provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami                    = "ami-0323c3dd2da7fb37d"
  instance_type          = "t2.micro"
  key_name               = "my_ec2_key"
  vpc_security_group_ids = [aws_security_group.terra_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  tags = {
    name = "terraform-example"
  }
}

resource "aws_security_group" "terra_sg" {
  name = "terraform_security_group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["202.83.17.16/32"]
  }

  tags = {
    name = "terra-sg"
  }

}
