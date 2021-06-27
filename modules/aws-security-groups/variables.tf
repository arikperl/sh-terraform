
variable "create_sg" {
  description = "Whether to create the SG"
  type        = bool
  default     = true
}

variable "name" {
  description = "Desired name for the SG"
  type        = string
}

variable "description" {
  description = "Desired description for the SG"
  type        = string
}

variable "vpc_id" {
  description = "Desired vpc_id for the SG"
  type        = string
}


variable "ports_to_source" {
  description = "Desired open ports to specific source"
  type = map(string)
  default = {}
}

variable "ports_to_ip" {
  description = "Desired open ports to specific ip"
  type = map(string)
  default = {}
}

variable "protocol" {
  description = "Desired protocol"
  default = "tcp"
}

variable "self" {
  description = "Whether to add the sg itsef to the rules"
  type        = bool
  default     = false
}