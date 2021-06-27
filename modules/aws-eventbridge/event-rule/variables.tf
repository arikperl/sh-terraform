variable "create_rule" {
  description = "Whether to create rule"
  type        = bool
  default     = true
}

variable "event_bus" {
  description = "wanter eventbus"
}

variable "event_pattern" {
  description = "wanter event_pattern"
}

variable "rule_name" {
  description = "wanter rule_name"
}

variable "event_target" {
  description = "wanter event_target"
}

