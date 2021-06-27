variable "env_suffix" {
  description = "env suffix"
  type        = string
  default     = "poc"
}

variable "tg_suffix" {
  description = "tg suffix"
  type        = string
  default     = "POC"
}

variable "sg_suffix" {
  description = "sg suffix"
  type        = string
  default     = "POC"
}

variable "vpc_id" {
  description = "vpc id of manage ohio"
  type        = string
  default     = "vpc-0bccc9996e9552360"
}

variable "eks_intances_ids" {
  description = "All instaces of eks"
  type        = list
  default     = ["i-075adf83dfae92cd2","i-0778fc9b38135482e","i-0e1a118145e7aeacc"] 
}