# terraform.tfvars

aws_region           = "us-east-1"
project_name         = "todo-app"
cluster_name         = "todo-eks-cluster"
worker_instance_type = "c7i-flex.large"

# Run: curl -s https://checkip.amazonaws.com && echo "/32"
your_ip = "103.254.35.50/32"

public_key_path = "~/.ssh/eks-terraform-key.pub"

node_desired_size = 1
node_min_size     = 1
node_max_size     = 1
