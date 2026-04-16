# outputs.tf

output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
  description = "API server endpoint for the EKS cluster"
  value       = aws_eks_cluster.main.endpoint
}

# CHANGED: Added description fields to all outputs for clarity
output "kubeconfig_command" {
  description = "Run this command to configure kubectl to talk to your cluster"
  value       = "aws eks update-kubeconfig --region ${var.aws_region} --name ${var.cluster_name}"
}

output "node_group" {
  description = "Name of the EKS managed node group"
  value       = aws_eks_node_group.workers.node_group_name
}

# CHANGED: Added node group status output so you can confirm nodes are ACTIVE
# after apply without going to the AWS console
output "node_group_status" {
  description = "Current status of the node group (should be ACTIVE)"
  value       = aws_eks_node_group.workers.status
}

# CHANGED: Added cluster CA cert output — useful for scripting kubeconfig
# without relying on the AWS CLI, marked sensitive so it won't print in logs
output "cluster_certificate_authority" {
  description = "Base64-encoded certificate authority data for the cluster"
  value       = aws_eks_cluster.main.certificate_authority[0].data
  sensitive   = true
}

# CHANGED: Added VPC ID output — handy when debugging networking issues
# or when you need to reference this VPC in other Terraform configs
output "vpc_id" {
  description = "ID of the VPC created for this cluster"
  value       = aws_vpc.main.id
}
