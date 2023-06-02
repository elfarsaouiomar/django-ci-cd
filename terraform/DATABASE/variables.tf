variable "db_username" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name"
  type        = string
  sensitive   = true
}


variable "region" {
  description = "Aws Region"
  default     = "us-east-1"
  type        = string
}

variable "env" {
  description = "Aws Region"
  default     = "dev"
  type        = string
}

variable "storage_type" {
  description = "storage type"
  default     = "gp2"
  type        = string
}

variable "db_engine" {
  description = "Select a db engine (mysql, postgrsql, Aurora)"
  type        = string
}

variable "engine_version" {
  description = "Engine version"
  default     = "5.7"
  type        = string
}

variable "allocated_storage" {
  description = "Engine version"
  default     = 20
  type        = number
}

variable "instance_class" {
  description = "instance class"
  default     = "db.t2.micro"
  type        = string
}

variable "parameter_group_name" {
  description = "parameter group name"
  default     = "default.mysql5.7"
  type        = string
}

variable "identifier" {
  description = "db instance name"
  default     = "dev-instance"
  type        = string
}