# Provider
 provider "aws" {
   access_key = ""
   secret_key = ""
   region = "us-east-2"
 }

resource "aws_sqs_queue" "fifo_queue" {
  count = var.create_sqs ? 1 : 0

  name                        = "${var.name}.fifo"
  fifo_queue                  = var.fifo_queue
  content_based_deduplication = var.content_based_deduplication
  max_message_size            = var.max_message_size
  message_retention_seconds   = var.message_retention_seconds
  visibility_timeout_seconds  = var.visibility_timeout_seconds
  receive_wait_time_seconds   = var.receive_wait_time_seconds
  delay_seconds               = var.delay_seconds

}

resource "aws_sqs_queue_policy" "fifo_queue_policy" {
  count = var.create_sqs ? 1 : 0

  queue_url = "${aws_sqs_queue.fifo_queue[0].id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy-${aws_sqs_queue.fifo_queue[0].id}/SQSDefaultPolicy",
  "Statement": [
    {
      "Sid": "Allow-EventBridge-By-Terraform",
      "Effect": "Allow",
      "Principal": {
        "Service": "events.amazonaws.com"
      },
      "Action": "sqs:SendMessage",
      "Resource": "${aws_sqs_queue.fifo_queue[0].arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "arn:aws:events:us-east-2:101715011694:rule/${var.eventbus-name}/*"
        }
      }
    }
  ]
}
POLICY

  lifecycle {
    ignore_changes = [
      policy,
    ]
  }
}