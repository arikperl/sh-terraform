
#################################################
# Create Route 53 with wanted record
################################################

module "this_route53" {
  source        = "../modules/aws-route53"

  name          = "*.${var.env_suffix}.withbond.io"
  type          = "CNAME"
  ttl           = "300"
  record        = module.alb.this_lb_dns
  hosted_zone   = "Z11U984KCKELBO"
}
