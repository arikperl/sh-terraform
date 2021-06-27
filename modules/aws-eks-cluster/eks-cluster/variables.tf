
variable "create_cluster" {
  description = "Whether to create the cluster"
  type        = bool
  default     = true
}

variable "name" {
  description = "Desired name"
  type        = string
}

variable "role_arn" {
  description = "Desired role_arn"
  type        = string
}

variable "subnet_ids" {
  description = "Wanter policy for role"
}

variable "enabled_cluster_log_types" {
  description = "Wanter enabled_cluster_log_types"
}

variable "endpoint_private_access" {
  description = "endpoint_private_access"
  type        = bool
  default     = false
}

variable "security_group_ids" {
  description = "Wanter security_group_ids"
}

variable "vpc_id" {
  description = "Wanter vpc_id"
}
