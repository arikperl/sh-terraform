
variable "create_cluster_node_group" {
  description = "Whether to create the cluster"
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "the cluster_name"
  type        = string
}

variable "node_role_arn" {
  description = "Desired node_role_arn"
  type        = string
}

variable "node_group_name" {
  description = "Wanter policy for role"
}

variable "subnet_ids" {
  description = "Wanter enabled_cluster_log_types"
}

variable "desired_size" {
  description = "Wanted desired_size"
}

variable "max_size" {
  description = "Wanter max_size"
}

variable "min_size" {
  description = "Wanter min_size"
}

variable "instance_types" {
  description = "Wanter instance_types"
}

variable "ec2_ssh_key" {
  description = "Wanter ec2_ssh_key"
}

variable "source_security_group_ids" {
  description = "Wanter source_security_group_ids"
}
