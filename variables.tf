# ------------------------------
# Root-level input variables
# ------------------------------

variable "aws_region" {
  description = "AWS region to deploy in"
  type        = string
}

variable "availability_zones" {
  description = "Availability Zones to deploy public subnets in"
  type        = list(string)
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable "aws_role_arn" {
  description = "IAM role ARN for assuming role"
  type        = string
}

variable "AWS_ACCESS_KEY_ID" {
  description = "AWS access key"
  type        = string
  sensitive   = true
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS secret key"
  type        = string
  sensitive   = true
}

# ---------------------------------------
# Network and ECS configuration variables
# ---------------------------------------

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/26"
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.0.0/28", "10.0.0.32/28"]
}

variable "ecs_cluster_name" {
  description = "Name of ECS cluster"
  type        = string
  default     = "hello-api-cluster"
}

variable "ecs_service_name" {
  description = "Name of ECS service"
  type        = string
  default     = "hello-api-service"
}

variable "container_name" {
  description = "Container name"
  type        = string
  default     = "hello-api"
}

variable "container_image" {
  description = "Docker image to deploy"
  type        = string
  default     = "nmatsui/hello-world-api:latest"
}

variable "container_port" {
  description = "Port container listens on"
  type        = number
  default     = 80
}

variable "desired_count" {
  description = "Number of ECS tasks to run"
  type        = number
  default     = 1
}

variable "ecs_execution_role_arn" {
  description = "ECS task execution IAM role"
  type        = string
}
