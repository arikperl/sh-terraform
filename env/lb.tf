
#########################################
# ALB - Create ALB and default rules
# CERT - Created Manually!
#########################################

module "alb" {
    source             = "../modules/aws-lb"
    name               = "withbond-${var.env_suffix}"
    internal           = false
    load_balancer_type = "application"
    security_groups    = module.sg_alb.this_security_group_id
    subnets            = "subnet-03fedafa1e531dfc7,subnet-030468f2b9d27e8fa,subnet-037fbfe5407523737"
    vpc                = var.vpc_id
    certificate_arn    = "arn:aws:acm:us-east-2:101715011694:certificate/ba3e8467-bffa-4ae3-af91-efb781ddac9c" 

    enable_deletion_protection = false
    env_suffix         = var.env_suffix
    tg_suffix          = var.tg_suffix
}

#########################################
# ALB - TG and rules and headers
# name: TG-BOND-<service>-POC
# host Headers: <service>.poc.withbond.io
#########################################

module "rule_bo" {
    source             = "../modules/aws-target-groups"
    name               = "BO-${var.tg_suffix}"
    vpc                = var.vpc_id
    port               = 30500
    listener_arn       = module.alb.this_lb_default_listener
    priority           = 100
    host_header        = "bo.${var.env_suffix}"
    instance_ids       = var.eks_intances_ids
    count_ids          = 3

}

module "rule_track" {
    source             = "../modules/aws-target-groups"
    name               = "TRACK-${var.tg_suffix}"
    vpc                = var.vpc_id
    port               = 30501
    listener_arn       = module.alb.this_lb_default_listener
    priority           = 110
    host_header        = "track.${var.env_suffix}"
    instance_ids       = var.eks_intances_ids 
    count_ids          = 3

}

module "rule_shopify" {
    source             = "../modules/aws-target-groups"
    name               = "ORDERS-${var.tg_suffix}"
    vpc                = var.vpc_id
    port               = 30502
    listener_arn       = module.alb.this_lb_default_listener
    priority           = 120
    host_header        = "shopify.${var.env_suffix}"
    instance_ids       = var.eks_intances_ids 
    count_ids          = 3

}

module "rule_shipstation" {
    source             = "../modules/aws-target-groups"
    name               = "SHPISTATION-${var.tg_suffix}"
    vpc                = var.vpc_id
    port               = 30503
    listener_arn       = module.alb.this_lb_default_listener
    priority           = 130
    host_header        = "shipstation.${var.env_suffix}"
    instance_ids       = var.eks_intances_ids 
    count_ids          = 3

}

module "rule_bondapi" {
    source             = "../modules/aws-target-groups"
    name               = "ORDERAPI-${var.tg_suffix}"
    vpc                = var.vpc_id
    port               = 30504
    listener_arn       = module.alb.this_lb_default_listener
    priority           = 140
    host_header        = "bondapi.${var.env_suffix}"
    instance_ids       = var.eks_intances_ids 
    count_ids          = 3
}

module "rule_info-plus" {
    source             = "../modules/aws-target-groups"
    name               = "INFOPLUS-${var.tg_suffix}"
    vpc                = var.vpc_id
    port               = 30505
    listener_arn       = module.alb.this_lb_default_listener
    priority           = 150
    host_header        = "info-plus.${var.env_suffix}"
    instance_ids       = var.eks_intances_ids 
    count_ids          = 3
}

module "rule_onfleet" {
    source             = "../modules/aws-target-groups"
    name               = "ONFLEET-${var.tg_suffix}"
    vpc                = var.vpc_id
    port               = 30506
    listener_arn       = module.alb.this_lb_default_listener
    priority           = 160
    host_header        = "onfleet.${var.env_suffix}"
    instance_ids       = var.eks_intances_ids 
    count_ids          = 3

}

module "rule_ordersdashboard" {
    source             = "../modules/aws-target-groups"
    name               = "ORDERS-DASHBOARD-${var.tg_suffix}"
    vpc                = var.vpc_id
    port               = 30507
    listener_arn       = module.alb.this_lb_default_listener
    priority           = 170
    host_header        = "orders-dashboard.${var.env_suffix}"
    instance_ids       = var.eks_intances_ids 
    count_ids          = 3

}

module "rule_geo" {
    source             = "../modules/aws-target-groups"
    name               = "GEO-${var.tg_suffix}"
    vpc                = var.vpc_id
    port               = 30508
    listener_arn       = module.alb.this_lb_default_listener
    priority           = 180
    host_header        = "geo.${var.env_suffix}"
    instance_ids       = var.eks_intances_ids 
    count_ids          = 3

}

module "rule_aftership" {
    source             = "../modules/aws-target-groups"
    name               = "AFTERSHIP-${var.tg_suffix}"
    vpc                = var.vpc_id
    port               = 30509
    listener_arn       = module.alb.this_lb_default_listener
    priority           = 190
    host_header        = "tracking-api.${var.env_suffix}"
    instance_ids       = var.eks_intances_ids 
    count_ids          = 3

}

module "rule_label" {
    source             = "../modules/aws-target-groups"
    name               = "LABEL-${var.tg_suffix}"
    vpc                = var.vpc_id
    port               = 30510
    listener_arn       = module.alb.this_lb_default_listener
    priority           = 200
    host_header        = "label.${var.env_suffix}"
    instance_ids       = var.eks_intances_ids 
    count_ids          = 3

}

module "rule_messages" {
    source             = "../modules/aws-target-groups"
    name               = "MESSAGES-${var.tg_suffix}"
    vpc                = var.vpc_id
    port               = 30511
    listener_arn       = module.alb.this_lb_default_listener
    priority           = 210
    host_header        = "messages.${var.env_suffix}"
    instance_ids       = var.eks_intances_ids 
    count_ids          = 3

}

module "rule_scheduling" {
    source             = "../modules/aws-target-groups"
    name               = "SCHEDULING-${var.tg_suffix}"
    vpc                = var.vpc_id
    port               = 30512
    listener_arn       = module.alb.this_lb_default_listener
    priority           = 220
    host_header        = "scheduling.${var.env_suffix}"
    instance_ids       = var.eks_intances_ids 
    count_ids          = 3

}

module "rule_tracking_messages_publisher" {
    source             = "../modules/aws-target-groups"
    name               = "TRACKING-MESSAGES-${var.tg_suffix}"
    vpc                = var.vpc_id
    port               = 30513
    listener_arn       = module.alb.this_lb_default_listener
    priority           = 221
    host_header        = "tracking-messages.${var.env_suffix}"
    instance_ids       = var.eks_intances_ids 
    count_ids          = 3

}

module "rule_public_api" {
    source             = "../modules/aws-target-groups"
    name               = "PUBLIC-API-${var.tg_suffix}"
    vpc                = var.vpc_id
    port               = 30514
    listener_arn       = module.alb.this_lb_default_listener
    priority           = 222
    host_header        = "public-api.${var.env_suffix}"
    instance_ids       = var.eks_intances_ids 
    count_ids          = 3

}