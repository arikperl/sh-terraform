
variable "create_iam_policy" {
  description = "Whether to create the iam role policy"
  type        = bool
  default     = true
}

variable "name" {
  description = "Desired name "
  type        = string
}

variable "description" {
  description = "Desired description"
  type        = string
}

variable "policy" {
  description = "Wanter policy for role"
}
