variable "create_r53" {
  description = "Whether to create the r53"
  type        = bool
  default     = true
}

variable "hosted_zone" {
  description = "hosted_zone id "
  type        = string 
}

variable "record" {
  description = "the alb record for cname"
  type        = string
}

variable "type" {
  description = "what type of record"
  type        = string
  default     = "CNAME"
}

variable "ttl" {
  description = "wanted ttl"
  type        = string
  default     = "300"
}

variable "name" {
  description = "wanted url"
  type        = string
}