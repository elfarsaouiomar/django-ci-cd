# Initialize the Terraform configuration
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region = var.region
}


# # Creating a AWS Secret for mysql username for the django app
# resource "aws_secretsmanager_secret" "mysql_username" {
#   name        = "mysql_username"
#   description = "mysql username for the django app"
#   recovery_window_in_days = 0
#   tags = {
#     Name        = "mysql_username"
#   }
# }

# resource "aws_secretsmanager_secret_version" "mysql_username_version" {
#   secret_id     = aws_secretsmanager_secret.mysql_username.id
#   secret_string = var.db_username
# }

# # Creating a AWS Secret for Password username for the django app
# resource "aws_secretsmanager_secret" "mysql_password" {
#   name        = "mysql_password"
#   description = "mysql Password for the django app"
#   recovery_window_in_days = 0
#   tags = {
#     Name        = "mysql_password"
#   }
# }
# resource "aws_secretsmanager_secret_version" "mysql_password_version" {
#   secret_id     = aws_secretsmanager_secret.mysql_password.id
#   secret_string = var.db_password
# }


# ## reating a AWS Secret for Password mysql_url for the django app
# resource "aws_secretsmanager_secret" "mysql_url" {
#   name        = "mysql_url"
#   description = "mysql Password for the django app"
#   recovery_window_in_days = 0
#   tags = {
#     Name        = "mysql_url"
#   }
# }
# resource "aws_secretsmanager_secret_version" "mysql_url_version" {
#   secret_id     = aws_secretsmanager_secret.mysql_url.id
#   secret_string = var.db_url
# }


# ## Creating a AWS Secret for DB name for the django app
# resource "aws_secretsmanager_secret" "db_host" {
#   name        = "db_host"
#   description = "mysql host for the django app"
#   recovery_window_in_days = 0
#   tags = {
#     Name        = "db_host"
#   }
# }
# resource "aws_secretsmanager_secret_version" "db_host_version" {
#   secret_id     = aws_secretsmanager_secret.db_host.id
#   secret_string = var.db_name
# }

# read service user secret
data "aws_secretsmanager_secret" "service_user" {
  name = "mysql_url"
}
data "aws_secretsmanager_secret_version" "service_user" {
  secret_id = data.aws_secretsmanager_secret.service_user.id
}

output "arn" {
  value = "${data.aws_secretsmanager_secret_version.service_user.secret_string}"
  sensitive = true
}


resource "local_file" "private_key" {
    content  = "${data.aws_secretsmanager_secret_version.service_user.secret_string}"
    filename = "private_key.pem"
}
