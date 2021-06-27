output "this_cluster_endpoint" {
    description = "cluster endpoint"
    value       = concat(
                aws_eks_cluster.this.*.endpoint,
                [""],
    )[0]
}

output "this_cluster_name" {
    description = "cluster name"
    value       = concat(
                aws_eks_cluster.this.*.name,
                [""],
    )[0]
}

output "this_cluster_vpc_config" {
    description = "cluster name"
    value       = aws_eks_cluster.this.*.vpc_config           
}