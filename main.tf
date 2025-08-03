module "network" {
  source = "./modules/network"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones  = var.availability_zones
}

module "compute" {
  source = "./modules/compute"

  cluster_name   = "hello-api-cluster"
  docker_image   = "nmatsui/hello-world-api"
  container_name = "hello-api"
  container_port = 3000
  desired_count  = 1

  vpc_id             = module.network.vpc_id
  public_subnet_ids  = module.network.public_subnet_ids
  security_group_ids = [module.network.security_group_id]

  alb_subnets          = module.network.public_subnet_ids
  alb_security_group   = module.network.security_group_id
  alb_target_group_arn = module.network.alb_target_group_arn
  alb_listener_arn     = module.network.alb_listener.arn

  ecs_execution_role_arn = var.ecs_execution_role_arn
  aws_region             = var.aws_region

  depends_on = [module.network]
}
