variable "dbstorage" {
  description = "The amount of storage (in gigabytes) allocated for the RDS instance."
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "The type of storage for the RDS instance (e.g., 'standard', 'gp2', 'io1')."
  type        = string
  default     = "gp2" 
}

variable "db_version" {
  description = "The version of the database engine to use (e.g., '8.0')."
  type        = string
  default     = "8.0" 
}

variable "inst_class" {
  description = "The instance class of the RDS database instance (e.g., 'db.t3.micro')."
  type        = string
  default     = "db.t3.micro"  
}
variable "db_user" {
  description = "The master username for the RDS instance."
  type        = string
  default     = "admin"  
}

variable "db_passwd" {
  description = "The master password for the RDS instance."
  type        = string
  sensitive   = true 
}