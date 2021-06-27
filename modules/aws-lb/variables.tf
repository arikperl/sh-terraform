
variable "create_lb" {
  description = "Whether to create the LB"
  type        = bool
  default     = true
}

variable "env_suffix" {
  description = "env suffix"
  type        = string
}

variable "tg_suffix" {
  description = "env suffix"
  type        = string
}

variable "name" {
  description = "Desired name for the LB"
  type        = string
}

variable "internal" {
  description = "internal AL"
  type        = bool
  default     = false
}

variable "load_balancer_type" {
  description = "Type of the LB"
  type        = string
  default     = "application"
}


variable "security_groups" {
  description = "Desired SG for the LB"
  type = string
  
}

variable "subnets" {
  description = "Desired SUBNETS for the LB"
  type = string
}

variable "vpc" {
  description = "vpc for alb rules tg"
  type = string
}

variable "enable_deletion_protection" {
  description = "deletion production"
  type        = bool
  default     = false
}

variable "certificate_arn" {
  description = "certificate_arn for alb "
  type = string
}