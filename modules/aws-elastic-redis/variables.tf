variable "create_redis" {
  description = "Whether to create the redis cluster"
  type        = bool
  default     = true
}

variable "cluster_id" {
  description = "Desired id for the cluster"
  type        = string
}

variable "engine" {
  description = "Desired engine for the cluster"
  type        = string
}

variable "node_type" {
  description = "Desired node_type for the cluster"
  type        = string
}

variable "parameter_group_name" {
  description = "Desired parameter_group_name for the cluster"
  type        = string
}

variable "engine_version" {
  description = "Desired engine_version for the cluster"
  type        = string
}

variable "subnet_group_name" {
  description = "Desired subnet_group_name for the cluster"
  type        = string
}

variable "security_group_ids" {
  description = "Desired security_group_ids for the cluster"
  type        = string
}

variable "maintenance_window" {
  description = "Desired maintenance_window for the cluster"
  type        = string
}

variable "snapshot_window" {
  description = "Desired snapshot_window for the cluster"
  type        = string
}

variable "port" {
  description = "port of the redis"
  type        = number
}

variable "num_cache_nodes" {
  description = "num_cache_nodes of the redis"
  type        = number
}
