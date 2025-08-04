# --------------------------------------------------------
# Outputs from the Compute Module (ECS & Load Balancing)
# --------------------------------------------------------

# ECS Cluster Name
output "cluster_name" {
  description = "ECS Cluster name"
  value       = aws_ecs_cluster.this.name
}

# ECS Service Name
output "service_name" {
  description = "Name of the ECS Service"
  value       = aws_ecs_service.this.name
}

# Task Definition ARN
output "task_definition_arn" {
  description = "ARN of the ECS Task Definition"
  value       = aws_ecs_task_definition.this.arn
}

# Task Execution Role ARN
output "task_exec_role_arn" {
  description = "IAM Role ARN used by ECS Task Execution"
  value       = aws_iam_role.ecs_task_execution.arn
}
