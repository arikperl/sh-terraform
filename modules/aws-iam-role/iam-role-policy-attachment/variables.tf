
variable "create_iam_role_attachment" {
  description = "Whether to create the iam role attachment"
  type        = bool
  default     = true
}

variable "role" {
  description = "Desired role to attach to"
  type        = string
}

variable "policy_arn" {
  description = "Desired policy to attach"
  type        = string
}
