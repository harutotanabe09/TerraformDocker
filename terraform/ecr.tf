resource "aws_ecr_repository" "java-app" {
  name                 = "${var.service_name}/${var.environment}/java-app"
  image_tag_mutability = "MUTABLE"
  tags = {
    Service = var.service_name
    Env     = var.environment
    Region  = var.region
  }
}
