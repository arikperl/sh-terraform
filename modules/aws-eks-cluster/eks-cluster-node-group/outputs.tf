
output "this_ng_access_resources" {
    description = "cluster ng sg"
    value       = aws_eks_node_group.this.*.resources            
}