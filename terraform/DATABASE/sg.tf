# Allow access to mysql
resource "aws_security_group" "mysql_sg" {
  name        = "mysql-${env}-sg"
  description = "Allow inbound MySQL traffic ${env}"

  # TODO: allow only incoming requests from the ECS 
  ingress {
    from_port   = 3306
    to_port     = 3306
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

