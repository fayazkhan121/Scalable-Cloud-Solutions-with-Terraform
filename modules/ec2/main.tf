# Security Group for Web Server
resource "aws_security_group" "web_sg" {
  name        = "${var.tags.Project}-web-sg"
  description = "Allow HTTP, SSH"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
    description = "Allow SSH"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "${var.tags.Project}-web-sg" })
}

# Web Server EC2 Instance (launched in the first public subnet by default)
resource "aws_instance" "web_server" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_ids[0]
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd git
    systemctl enable httpd
    systemctl start httpd
    echo "<h1>Welcome to our e-commerce site!</h1>" > /var/www/html/index.html
  EOF

  tags = merge(var.tags, { Name = "${var.tags.Project}-web-server" })
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"] # Official Amazon AMIs
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
