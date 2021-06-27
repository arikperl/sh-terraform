variable "create_mount_target" {
  description = "Whether to create the ec2 instance"
  type        = bool
  default     = true
}

variable "file_system_id" {
  description = "efs file_system_id"
}

variable "subnet_id" {
  description = "wanted subnet_id"
}

variable "security_groups" {
  description = "wanted security_groups"
}