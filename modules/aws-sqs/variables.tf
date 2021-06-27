
variable "create_sqs" {
  description = "Whether to create the SQS"
  type        = bool
  default     = true
}

variable "name" {
  description = "Desired name for the SQS"
  type        = string
}

variable "fifo_queue" {
  description = "Whether to create the SQS as fifo"
  type        = bool
  default     = true
}

variable "content_based_deduplication" {
  description = "Whether to make  the SQS content_based_deduplication"
  type        = bool
  default     = true
}

variable "max_message_size" {
  description = "Desired max_message_size  for the SQS"
  type        = number
  default     = 262144
}

variable "message_retention_seconds" {
  description = "Desired message_retention_seconds  for the SQS"
  type        = number
  default     = 345600
}

variable "visibility_timeout_seconds" {
  description = "Desired visibility_timeout_seconds  for the SQS"
  type        = number
  default     = 30
}

variable "receive_wait_time_seconds" {
  description = "Desired receive_wait_time_seconds  for the SQS"
  type        = number
  default     = 0
}

variable "delay_seconds" {
  description = "Desired delay_seconds  for the SQS"
  type        = number
  default     = 0
}

variable "eventbus-name" {
  description = "Desired eventbus-name  for the SQS"
}