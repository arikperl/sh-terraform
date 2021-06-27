output "this_efs_id" {
    description = "The efs ID"
    value       = concat(
                aws_efs_file_system.this.*.id,
                [""],
    )[0]
}
