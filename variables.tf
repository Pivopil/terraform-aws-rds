variable "vpc_id" {
  description = "VPC id like 'vpc-017f827c'"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet ids, if there is no subnet ids, it will use subnets with tag {Tier:target_subnet_tag} in target VPC or fail"
  type        = list(string)
  default     = []
}

variable "target_subnet_tag" {
  description = "Target subnet tag"
  type        = string
  default     = "Privat"
}

variable "name" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
  type        = string
}

variable "iam_database_authentication_enabled" {
  description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.IAMDBAuth.html"
  type        = bool
  default     = true
}

variable "copy_tags_to_snapshot" {
  description = "On delete, copy all Instance tags to the final snapshot (if final_snapshot_identifier is specified)"
  type        = bool
  default     = true
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  type        = number
  default     = 0
}

variable "backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
  type        = string
  default     = "03:00-06:00"
}

variable "maintenance_window" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  type        = string
  default     = "Mon:00:00-Mon:03:00"
}

variable "db_name" {
  description = "The DB name to create. If omitted, no database is created initially"
  type        = string
  default     = "master_db"
}

variable "username" {
  description = "Username for the master DB user"
  type        = string
  default     = "root"
}

variable "password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file"
  type        = string
  default     = null
}

variable "port" {
  description = "The port on which the DB accepts connections"
  type        = string
  default     = "3306"
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = string
  default     = "20"
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t2.micro"
}

variable "engine" {
  description = "The database engine to use"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
  default     = "5.7.28"
}

variable "major_engine_version" {
  description = "Specifies the major version of the engine that this option group should be associated with"
  type        = string
  default     = "5.7"
}

variable "family" {
  description = "The family of the DB parameter group"
  type        = string
  default     = "mysql5.7"
}
