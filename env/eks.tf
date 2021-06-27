# Create eks cluster, Include Iam roles, policies, cluster
#####################################################

module "eks_cluster" {
    source                    = "../modules/aws-eks-cluster/eks-cluster"

    name                      = "eks-cluster-${var.env_suffix}"
    role_arn                  = module.iam_role_cluster.this_iam_role_arn
    vpc_id                    = var.vpc_id
    subnet_ids                = ["subnet-03a3009f3e341222f","subnet-0693091c4f184d547"]
    enabled_cluster_log_types = ["api","audit"]
    endpoint_private_access   = true
    security_group_ids        = ["${module.sg_eks_cluster.this_security_group_id}"]
}

# Create eks cluster node group, include roles
#####################################################

module "eks_cluster_node_group" {
    source                    = "../modules/aws-eks-cluster/eks-cluster-node-group"

    cluster_name              = module.eks_cluster.this_cluster_name
    node_group_name           = "NG-${var.tg_suffix}"
    node_role_arn             = module.iam_role_cluster_nodegroup.this_iam_role_arn
    subnet_ids                = ["subnet-03a3009f3e341222f","subnet-0693091c4f184d547"]
    source_security_group_ids = ["${module.sg_eks_cluster.this_security_group_id}"]
    ec2_ssh_key               = "DEVOPS-KP"

    instance_types            = ["t3.medium"]
    desired_size              = 1
    max_size                  = 1
    min_size                  = 1
}

module "eks_cluster_remote_access_sg_rule" {
    source                    = "../modules/aws-eks-cluster/eks-cluster-sg-attachment"

    from_port                 = 30000
    to_port                   = 32767
    source_security_group_id  = "${module.sg_alb.this_security_group_id}"
    security_group_id         = "${module.eks_cluster_node_group.this_ng_access_resources[0][0].remote_access_security_group_id}"
}

module "eks_cluster_remote_access_vpn_sg_rule" {
    source                    = "../modules/aws-eks-cluster/eks-cluster-sg-attachment"

    from_port                 = 30000
    to_port                   = 32767
    source_security_group_id  = "sg-045fc3c50c684fdca"
    security_group_id         = "${module.eks_cluster_node_group.this_ng_access_resources[0][0].remote_access_security_group_id}"
}