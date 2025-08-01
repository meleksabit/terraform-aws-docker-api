# -----------------------------------------------------
# Root outputs collected from modules
# -----------------------------------------------------

output "load_balancer_url" {
  description = "Public URL of the app"
  value       = "http://${module.network.alb_dns_name}"
}

output "vpc_id" {
  description = "VPC ID from the network module"
  value       = module.network.vpc_id
}

output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = module.network.alb_arn
}

output "alb_dns_name" {
  description = "DNS name to access the application"
  value       = module.network.alb_dns_name
}

output "ecs_service_name" {
  description = "Name of the ECS service"
  value       = module.compute.service_name
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  value       = module.compute.cluster_name
}
