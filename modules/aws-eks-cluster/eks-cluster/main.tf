

resource "aws_eks_cluster" "this" {
  count = var.create_cluster ? 1 : 0

  name     = var.name
  role_arn = var.role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
    endpoint_private_access = var.endpoint_private_access
    security_group_ids      = var.security_group_ids
  }
  enabled_cluster_log_types = var.enabled_cluster_log_types
}