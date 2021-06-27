
variable "create_tg" {
  description = "Whether to create the tg"
  type        = bool
  default     = true
}

variable "name" {
  description = "Desired name for the tg"
  type        = string
}


variable "port" {
  description = "port of the TG"
  type        = number
}


variable "listener_arn" {
  description = "listener_arn for the TG"
  type = string
  
}

variable "priority" {
  description = "Desired priority for the TG"
  type = number
}

variable "host_header" {
  description = "host_header for the tg"
  type = string
}

variable "vpc" {
  description = "vpc for alb rules tg"
  type = string
}

// variable "instance_id" {
//   description = "the instance id to attach the rule to"
//   type = string
// }

variable "instance_ids" {
  description = "Desired id to traget"
  type = list
  default = []
}

variable "count_ids" {
  description = "number of instances"
  type = number
}