

#########################################
# SG name, open ports 
#########################################

module "sg_alb" {
  source                        = "../modules/aws-security-groups"
  name                          = "SG-BOND-ALB-${var.sg_suffix}"
  description                   = "SG for ALB for ${var.env_suffix}"
  vpc_id                        = var.vpc_id
  ports_to_source               = {}
  ports_to_ip                   = {   80 = "0.0.0.0/0"
                                      443 = "0.0.0.0/0"
                                  }
}

module "sg_services" {
  source                        = "../modules/aws-security-groups"
  name                          = "SG-BOND-SERVICES-${var.sg_suffix}"
  description                   = "SG for Services for ${var.env_suffix}"
  vpc_id                        = var.vpc_id
  ports_to_source               = { 
                                    22 = "sg-054c6048926857aaa,sg-0c98591f4882ca693,sg-045fc3c50c684fdca" ### Ansible, Jenkins, OpenVPN
                                    30500 = module.sg_alb.this_security_group_id 
                                    30501 = module.sg_alb.this_security_group_id 
                                    30502 = module.sg_alb.this_security_group_id 
                                    30503 = module.sg_alb.this_security_group_id 
                                    30504 = module.sg_alb.this_security_group_id 
                                    30505 = module.sg_alb.this_security_group_id 
                                    30506 = module.sg_alb.this_security_group_id
                                    30507 = module.sg_alb.this_security_group_id 
                                    30508 = module.sg_alb.this_security_group_id
                                    30509 = module.sg_alb.this_security_group_id
                                    30510 = module.sg_alb.this_security_group_id 
                                    30511 = module.sg_alb.this_security_group_id
                                    30512 = module.sg_alb.this_security_group_id
                                    30513 = module.sg_alb.this_security_group_id
                                    30514 = module.sg_alb.this_security_group_id
                                    }
  ports_to_ip                   = {}
}

module "sg_mongo" {
  source                        = "../modules/aws-security-groups"
  name                          = "SG-BOND-MONGO-${var.sg_suffix}"
  description                   = "SG for Mongo for ${var.env_suffix}"
  vpc_id                        = var.vpc_id
  ports_to_source               = { 22    = "sg-045fc3c50c684fdca,sg-054c6048926857aaa"    
                                    27017 = "${module.sg_services.this_security_group_id},sg-045fc3c50c684fdca,sg-0c98591f4882ca693,sg-054c6048926857aaa,${module.eks_cluster.this_cluster_vpc_config[0][0].cluster_security_group_id}" #"OpenVPN abd sg_sevices's id, Ansible, Jenkins
                                    }
  ports_to_ip                   = {}
}

module "sg_redis" {
  source                        = "../modules/aws-security-groups"
  name                          = "SG-REDIS-CLUSTER-${var.sg_suffix}"
  description                   = "SG for Redis cluster ${var.env_suffix}"
  vpc_id                        = var.vpc_id
  ports_to_source               = { 6379    = "${module.sg_services.this_security_group_id},sg-0ff83f235605096a5"   #"Enter Service sg 
                                    }
  ports_to_ip                   = {}
}

module "sg_eks_cluster" {
  source                        = "../modules/aws-security-groups"
  name                          = "SG-EKS-CLUSTER-${var.sg_suffix}"
  description                   = "SG for EKS cluster ${var.env_suffix}"
  vpc_id                        = var.vpc_id
  ports_to_source               = { 22   = "sg-045fc3c50c684fdca,sg-055bde59a79635038"   #"OpenVPN,Manage
                                    }
  ports_to_ip                   = {}
}

module "sg_efs" {
  source                        = "../modules/aws-security-groups"
  name                          = "SG-EFS-${var.sg_suffix}"
  description                   = "SG for EFS ${var.env_suffix}"
  vpc_id                        = var.vpc_id
  ports_to_source               = { 2049   = "${module.eks_cluster.this_cluster_vpc_config[0][0].cluster_security_group_id}"   #" default sg of eks cluster
                                    }
  ports_to_ip                   = {}
}