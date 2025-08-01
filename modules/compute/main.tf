# ----------------------------------
# ECS Cluster
# ----------------------------------

resource "aws_ecs_cluster" "this" {
  name = "hello-api-cluster"

  tags = {
    Name = "hello-api-cluster"
  }
}

# ----------------------------------
# IAM Role for ECS Task Execution
# ----------------------------------

resource "aws_iam_role" "ecs_task_execution" {
  name = "${var.cluster_name}-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "${var.cluster_name}-exec-role"
  }
}

resource "aws_iam_role_policy_attachment" "ecs_execution_policy" {
  role       = aws_iam_role.ecs_task_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# ----------------------------------
# ECS Task Definition
# ----------------------------------

resource "aws_ecs_task_definition" "this" {
  family                   = "${var.container_name}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution.arn

  container_definitions = jsonencode([
    {
      name  = var.container_name
      image = var.docker_image
      portMappings = [
        {
          containerPort = var.container_port
          protocol      = "tcp"
        }
      ]
    }
  ])

  tags = {
    Name = "${var.container_name}-task"
  }
}

# ----------------------------------
# ECS Service
# ----------------------------------

resource "aws_ecs_service" "this" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.this.id
  launch_type     = "FARGATE"
  desired_count   = var.desired_count
  task_definition = aws_ecs_task_definition.this.arn

  network_configuration {
    subnets          = var.public_subnet_ids
    security_groups  = var.security_group_ids
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.alb_target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  tags = {
    Name = var.service_name
  }
}
