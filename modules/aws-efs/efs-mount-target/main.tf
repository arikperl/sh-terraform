resource "aws_efs_mount_target" "this" {
  count = var.create_mount_target ? 1 : 0

  file_system_id  = var.file_system_id
  subnet_id       = var.subnet_id
  security_groups = var.security_groups
}