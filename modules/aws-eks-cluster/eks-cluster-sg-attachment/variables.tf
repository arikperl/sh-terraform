
variable "create_sg_rule_attachment" {
  description = "Whether to create the sg rule cluster"
  type        = bool
  default     = true
}

variable "from_port" {
  description = "Desired from_port"
}

variable "to_port" {
  description = "Desired to_port"
}

variable "source_security_group_id" {
  description = "Desired source_security_group_id"
}

variable "security_group_id" {
  description = "Desired security_group_id"
}

