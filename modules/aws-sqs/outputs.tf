output "this_sqs_arn" {
    description = "The instance ID"
    value       = concat(
                aws_sqs_queue.fifo_queue.*.arn,
                [""],
    )[0]
}
