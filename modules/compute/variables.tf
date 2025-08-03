# ----------------------------------
# ECS & Fargate Configuration
# ----------------------------------

variable "cluster_name" {
  description = "Cluster name for ECS Service"
  type        = string
}

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
  default     = "hello-api-service"
}

variable "docker_image" {
  description = "Docker image to deploy"
  type        = string
}

variable "container_name" {
  description = "Container name"
  type        = string
  default     = "hello-api"
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
  default     = 3000
}

variable "desired_count" {
  description = "Number of running container instances"
  type        = number
  default     = 1
}

# ----------------------------------
# Networking & IAM
# ----------------------------------

variable "vpc_id" {
  description = "VPC ID for ECS and ALB"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for ECS tasks"
  type        = list(string)
}

variable "alb_subnets" {
  description = "List of public subnets for ALB"
  type        = list(string)
}

variable "alb_security_group" {
  description = "Security Group ID for ALB"
  type        = string
}

variable "alb_target_group_arn" {
  description = "ALB ARN for target group attachment"
  type        = string
}

variable "alb_listener_arn" {
  description = "ALB Listener ARN for routing traffic"
  type        = string
}

variable "ecs_execution_role_arn" {
  description = "IAM role for ECS task execution (e.g. pulling image, writing logs)"
  type        = string
}

variable "aws_region" {
  description = "AWS Region for ECS deployment"
  type        = string
}
