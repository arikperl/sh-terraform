output "this_instance_id" {
    description = "The instance ID"
    value       = concat(
                aws_instance.this.*.id,
                [""],
    )[0]
}
