output "this_iam_policy_name" {
    description = "role name"
    value       = concat(
                aws_iam_policy.this.*.name,
                [""],
    )[0]
}

output "this_iam_policy_arn" {
    description = "role arn"
    value       = concat(
                aws_iam_policy.this.*.arn,
                [""],
    )[0]
}
