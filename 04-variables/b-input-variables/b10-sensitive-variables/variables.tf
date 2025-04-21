variable "db_username" {
  description = "Username for database connection"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Password for database connection"
  type        = string
  sensitive   = true
}
