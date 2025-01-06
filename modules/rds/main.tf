resource "aws_security_group" "rds_sg" {
  name        = "${var.tags.Project}-rds-sg"
  description = "Allow MySQL access from app subnets"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Allow MySQL from within VPC"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/16"]  # Adjust to your VPC range or SG references
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "${var.tags.Project}-rds-sg" })
}

resource "aws_db_subnet_group" "this" {
  name        = "${var.tags.Project}-rds-subnet-group"
  subnet_ids  = var.private_subnet_ids
  tags        = merge(var.tags, { Name = "${var.tags.Project}-rds-subnet-group" })
}

resource "aws_db_instance" "this" {
  identifier         = "${var.tags.Project}-db"
  engine             = "mysql"
  instance_class     = "db.t3.micro"
  allocated_storage  = 20
  username           = var.db_username
  password           = var.db_password
  db_subnet_group_name = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot = true

  # Optionally enable multi-AZ for high availability:
  # multi_az = true

  tags = merge(var.tags, { Name = "${var.tags.Project}-mysql-db" })
}
