# Provider
 provider "aws" {
   access_key = ""
   secret_key = ""
   region = "us-east-2"
 }


# Create Rule and rule attachment
resource "aws_elasticache_cluster" "this_redis" {
  count = var.create_redis ? 1 : 0

  cluster_id           = var.cluster_id
  engine               = var.engine
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  engine_version       = var.engine_version
  port                 = var.port
  subnet_group_name    = var.subnet_group_name
  security_group_ids   = ["${var.security_group_ids}"]
  maintenance_window   = var.maintenance_window
  snapshot_window      = var.snapshot_window
}