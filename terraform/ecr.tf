resource "aws_ecr_repository" "javaapp" {
  name                 = "${var.service_name}/javaapp"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Service = "${var.service_name}-javaapp"
    Region  = var.region
  }
}
