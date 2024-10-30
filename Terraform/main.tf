resource "tls_private_key" "generated_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "generated_key" {
  key_name        = var.key_name  
  public_key = tls_private_key.generated_ssh_key.public_key_openssh
}

resource "local_file" "private_key_pem" {
  content  = tls_private_key.generated_ssh_key.private_key_pem
  filename = "${path.module}/${var.key_name}.pem"
}

resource "aws_instance" "terraform_instance" {
  ami             = "ami-0aa2b7722dc1b5612" 
  instance_type   = var.instance_type
  subnet_id       = var.subnet
  key_name        = aws_key_pair.generated_key.key_name
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
  tags = {
    Name = "terraform-test"
  }
  depends_on = [
    aws_key_pair.generated_key,
    aws_security_group.instance_sg
  ]
}


# security group
resource "aws_security_group" "instance_sg" {
  name_prefix = "terraform-instance-sg"

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

  ingress {
    from_port   = 443
    to_port     = 443
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

