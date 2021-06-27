output "this_security_group_id" {
    description = "SG ID"
    value       = module.sg_alb.this_security_group_id
}

// output "instance_services_id" {
//     description = "instance service ID"
//     value       = module.instance_services.this_instance_id
// }

output "iam_role_cluster_name" {
    description = "Name of cluster iam role"
    value       = module.iam_role_cluster.this_iam_role_name
}
output "iam_role_cluster_arn" {
    description = "Arn of cluster iam role"
    value       = module.iam_role_cluster.this_iam_role_arn
}
output "eks_cluster_name" {
    description = "Name of cluster"
    value       = module.eks_cluster.this_cluster_name
}

output "eks_cluster_sg" {
    description = "Name of cluster"
    value       = module.eks_cluster.this_cluster_vpc_config[0][0].cluster_security_group_id
}

output "eks_np_remote_access_security_group_id" {
    description = "Name of cluster"
    value       = module.eks_cluster_node_group.this_ng_access_resources[0][0].remote_access_security_group_id
}
