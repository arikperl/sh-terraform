output "this_iam_role_name" {
    description = "role name"
    value       = concat(
                aws_iam_role.this.*.name,
                [""],
    )[0]
}

output "this_iam_role_arn" {
    description = "role arn"
    value       = concat(
                aws_iam_role.this.*.arn,
                [""],
    )[0]
}
