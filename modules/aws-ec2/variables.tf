variable "create_instance" {
  description = "Whether to create the ec2 instance"
  type        = bool
  default     = true
}

variable "ami" {
  description = "wanter ami image for deploy "
  type        = string 
}

variable "instance_type" {
  description = "set instance type"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "set SG for the instance"
  type        = string
}

variable "subnet_id" {
  description = "Subent ID to attach"
  type        = string
  default     = "300"
}

variable "iam_instance_profile" {
  description = "IAM ROLE"
  type        = string
}

variable "name" {
  description = "Instance name"
  type        = string
}