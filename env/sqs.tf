
module "sqs_shipstation" {
  source                        = "../modules/aws-sqs"
  name                          = "shipstation-${var.env_suffix}"
  fifo_queue                    = true
  content_based_deduplication   = true
  max_message_size              = 262144
  message_retention_seconds     = 345600
  visibility_timeout_seconds    = 30
  receive_wait_time_seconds     = 0
  delay_seconds                 = 0
  eventbus-name                 = "bond-${var.env_suffix}"
}

module "sqs_shopify" {
  source                        = "../modules/aws-sqs"
  name                          = "shopify-${var.env_suffix}"
  fifo_queue                    = true
  content_based_deduplication   = true
  max_message_size              = 262144
  message_retention_seconds     = 345600
  visibility_timeout_seconds    = 35
  receive_wait_time_seconds     = 0
  delay_seconds                 = 0
  eventbus-name                 = "bond-${var.env_suffix}"
}

module "sqs_onfleet" {
  source                        = "../modules/aws-sqs"
  name                          = "onfleet-${var.env_suffix}"
  fifo_queue                    = true
  content_based_deduplication   = true
  max_message_size              = 262144
  message_retention_seconds     = 345600
  visibility_timeout_seconds    = 30
  receive_wait_time_seconds     = 0
  delay_seconds                 = 0
  eventbus-name                 = "bond-${var.env_suffix}"
}

module "sqs_milkbar" {
  source                        = "../modules/aws-sqs"
  name                          = "milkbar-${var.env_suffix}"
  fifo_queue                    = true
  content_based_deduplication   = true
  max_message_size              = 262144
  message_retention_seconds     = 345600
  visibility_timeout_seconds    = 90
  receive_wait_time_seconds     = 0
  delay_seconds                 = 0
  eventbus-name                 = "bond-${var.env_suffix}"
}

module "sqs_milkbar_markasshipped" {
  source                        = "../modules/aws-sqs"
  name                          = "milkbar-markasshipped-${var.env_suffix}"
  fifo_queue                    = true
  content_based_deduplication   = true
  max_message_size              = 262144
  message_retention_seconds     = 345600
  visibility_timeout_seconds    = 60
  receive_wait_time_seconds     = 0
  delay_seconds                 = 0
  eventbus-name                 = "bond-${var.env_suffix}"
}

module "sqs_messges" {
  source                        = "../modules/aws-sqs"
  name                          = "bond-messages-${var.env_suffix}"
  fifo_queue                    = true
  content_based_deduplication   = true
  max_message_size              = 262144
  message_retention_seconds     = 345600
  visibility_timeout_seconds    = 30
  receive_wait_time_seconds     = 0
  delay_seconds                 = 0
  eventbus-name                 = "bond-${var.env_suffix}"
}

module "sqs_scheduling" {
  source                        = "../modules/aws-sqs"
  name                          = "bond-scheduling-${var.env_suffix}"
  fifo_queue                    = true
  content_based_deduplication   = true
  max_message_size              = 262144
  message_retention_seconds     = 345600
  visibility_timeout_seconds    = 30
  receive_wait_time_seconds     = 0
  delay_seconds                 = 0
  eventbus-name                 = "bond-${var.env_suffix}"
}

module "sqs_tracking_messages_publisher" {
  source                        = "../modules/aws-sqs"
  name                          = "tracking-messages-publisher-${var.env_suffix}"
  fifo_queue                    = true
  content_based_deduplication   = true
  max_message_size              = 262144
  message_retention_seconds     = 345600
  visibility_timeout_seconds    = 30
  receive_wait_time_seconds     = 0
  delay_seconds                 = 0
  eventbus-name                 = "bond-${var.env_suffix}"
}

module "sqs_shopify_webhooks" {
  source                        = "../modules/aws-sqs"
  name                          = "shopify-webhooks-${var.env_suffix}"
  fifo_queue                    = true
  content_based_deduplication   = true
  max_message_size              = 262144
  message_retention_seconds     = 345600
  visibility_timeout_seconds    = 35
  receive_wait_time_seconds     = 0
  delay_seconds                 = 0
  eventbus-name                 = "bond-${var.env_suffix}"
}

module "sqs_bond_api" {
  source                        = "../modules/aws-sqs"
  name                          = "bond-api-${var.env_suffix}"
  fifo_queue                    = true
  content_based_deduplication   = true
  max_message_size              = 262144
  message_retention_seconds     = 345600
  visibility_timeout_seconds    = 30
  receive_wait_time_seconds     = 0
  delay_seconds                 = 0
  eventbus-name                 = "bond-${var.env_suffix}"
}