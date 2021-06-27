resource "aws_alb_target_group" "javaapp" {
  name                          = "${var.service_name}-${var.environment}-java-server"
  port                          = 5000
  protocol                      = "HTTP"
  vpc_id                        = "vpc-0929ebf65d492884e" # TOOD: 固定 
  load_balancing_algorithm_type = "least_outstanding_requests"
  target_type                   = "ip"
  health_check {
    path                = "/login"
    interval            = 180
    port                = "traffic-port"
    timeout             = 5
    protocol            = "HTTP"
    unhealthy_threshold = 5
  }
}

// クラスタ
resource "aws_ecs_cluster" "javaapp" {
  name  = "${var.service_name}-${var.environment}-javaapp"
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
  tags = {
    Name    = "${var.service_name}-${var.environment}-javaapp"
    Service = var.service_name
    Env     = var.environment
    Region  = var.region
  }
}


# ECS タスク定義(コンテナと紐付け)
# https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html
resource "aws_ecs_task_definition" "javaapp" {
  family = "${var.service_name}-${var.environment}-javaapp"
  # データプレーンの選択
  requires_compatibilities = ["FARGATE"]
  # ECSタスクが使用可能なリソースの上限
  # タスク内のコンテナはこの上限内に使用するリソースを収める必要があり、メモリが上限に達した場合OOM Killer にタスクがキルされる
  cpu    = "256"
  memory = "512"
  # ECSタスクのネットワークドライバ
  # Fargateを使用する場合は"awsvpc"決め打ち
  network_mode = "awsvpc"
  # 起動するコンテナの定義
  # 「nginxを起動し、80ポートを開放する」設定を記述。
   // コンテナに設定する変数
  container_definitions = templatefile("task-definitions/tast_template.tpl", {
    environment  = "${var.environment}"
    label  = "latest"
    account_id   = "034454083140"
    region       = "${var.region}"
    service_name = "${var.service_name}"
    container_name  = "${var.service_name}-${var.environment}-javaapp"
  })
  tags = {
    Name    = "${var.service_name}-${var.environment}-javaapp"
    Service = var.service_name
    Env     = var.environment
    Region  = var.region
  }
}
