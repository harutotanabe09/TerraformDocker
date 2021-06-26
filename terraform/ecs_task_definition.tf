# Task Definition
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
  container_definitions = templatefile("task-definitions/tast_template.tpl", { port = 80 })
  tags = {
    Name    = "${var.service_name}-${var.environment}-javaapp"
    Service = var.service_name
    Env     = var.environment
    Region  = var.region
  }  
}
