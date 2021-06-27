
#################################################
# Create elasticache for redis engine
################################################

module "elastic_redis" {
  source                = "../modules/aws-elastic-redis"

  cluster_id           = "bond-redis-cluster-${var.env_suffix}"
  engine               = "redis"
  node_type            = "cache.t3.medium"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis5.0"
  engine_version       = "5.0.6"
  port                 = 6379
  subnet_group_name    = "bond-cluster-poc-subet-group"
  security_group_ids   = module.sg_redis.this_security_group_id
  maintenance_window   = "fri:02:00-fri:03:00"
  snapshot_window      = "01:00-02:00"
}

